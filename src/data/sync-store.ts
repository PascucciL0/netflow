/**
 * ProgressStore sincronizzato con un backend remoto (Supabase), offline-first.
 *
 * 1. Ogni mutazione viene applicata SUBITO con il reducer condiviso (UI immediata).
 * 2. Ne deriva una SyncOp con lo stato completo dell'entità, accodata in una outbox persistita in localStorage.
 * 3. La outbox viene inviata in ordine; se manca la rete resta in coda e riparte al ritorno online.
 * 4. Conflitti di versione su un ripasso (stessa carta valutata su un altro dispositivo): vince il server,
 *    lo stato viene ricaricato e l'operazione locale scartata (contata in `conflicts`).
 *
 * Il trasporto è astratto da RemoteApi: questo file non conosce supabase-js ed è testato con un backend finto.
 */
import type { Mutation } from "@/domain/mutations";
import { emptySnapshot, type UserSnapshot } from "@/domain/progress";
import { reduce } from "@/engine/reducer";
import { STORAGE_KEY as LOCAL_STORAGE_KEY, type ProgressStore } from "./local-store";
import {
  applyPendingOps,
  isSnapshotEmpty,
  opFromMutation,
  opKey,
  snapshotToImportPayload,
  type ContentMap,
  type ImportPayload,
  type PreferencesRow,
  type ProgressRows,
  type ReviewEventRow,
  type ReviewStateRow,
  type SyncOp,
  contentRow,
  eventRow,
  preferencesRow,
  rowsToSnapshot,
  stateRow,
  topicRow,
} from "./sync-types";

/** Errore del backend. `transient` = rete assente, timeout, 5xx, 429: si riprova più tardi. */
export class RemoteError extends Error {
  constructor(message: string, readonly transient: boolean) {
    super(message);
    this.name = "RemoteError";
  }
}

export type RpcOutcome = "ok" | "duplicate_event" | "stale_version" | "not_found";

export interface RemoteApi {
  /** Utente della sessione corrente (letto localmente, funziona anche offline). */
  currentUser(): Promise<{ id: string; email?: string } | null>;
  loadContentMap(): Promise<ContentMap>;
  loadProgress(userId: string): Promise<ProgressRows>;
  upsertTopic(userId: string, row: ReturnType<typeof topicRow>): Promise<void>;
  upsertContent(userId: string, row: ReturnType<typeof contentRow>): Promise<void>;
  upsertPreferences(userId: string, row: PreferencesRow): Promise<void>;
  recordReview(input: { state: ReviewStateRow; event: ReviewEventRow; expectedVersion: number }): Promise<RpcOutcome>;
  resetReview(input: { recallId: string; expectedVersion: number; due: string; contentRevision: number }): Promise<RpcOutcome>;
  importProgress(payload: Omit<ImportPayload, "unmapped">, replace: boolean): Promise<{ skipped: number }>;
}

export type SyncPhase = "loading" | "synced" | "syncing" | "offline" | "error" | "signed_out";

export interface SyncStatus {
  phase: SyncPhase;
  pending: number;
  email?: string;
  lastSyncedAt?: string;
  /** Messaggio leggibile dell'ultimo errore non recuperabile. */
  error?: string;
  /** Ripassi scartati perché la stessa carta era stata valutata su un altro dispositivo. */
  conflicts: number;
  /** Elementi non sincronizzabili (es. contenuto non presente sul server): scartati. */
  dropped: number;
  /** Ci sono progressi della modalità locale non ancora uniti all'account. */
  localDataAvailable: boolean;
}

export interface SyncStore extends ProgressStore {
  getStatus(): SyncStatus;
  /** Unisce all'account i progressi salvati in modalità locale su questo dispositivo. */
  importLocalData(): void;
  /** Forza una ricarica dal server (es. al ritorno in primo piano). */
  refresh(): Promise<void>;
  /** Cancella la cache di questo dispositivo (da chiamare al logout). */
  clearDeviceCache(): void;
  dispose(): void;
}

interface QueuedOp {
  seq: number;
  op: SyncOp;
}

interface Persisted {
  snapshot: UserSnapshot;
  outbox: QueuedOp[];
  seq: number;
  lastSyncedAt?: string;
}

export const CLOUD_PREFIX = "netflow:v1:cloud:";
const LAST_USER_KEY = `${CLOUD_PREFIX}last-user`;
const migratedKey = (uid: string) => `${CLOUD_PREFIX}${uid}:local-migrated`;
const cacheKey = (uid: string) => `${CLOUD_PREFIX}${uid}`;

export interface SyncStoreOptions {
  clock?: () => Date;
  storage?: Pick<Storage, "getItem" | "setItem" | "removeItem"> | null;
  /** Ritardo prima di riprovare dopo un errore di rete (ms). */
  retryMs?: number;
  /** Pianificatore (sostituibile nei test). */
  schedule?: (fn: () => void, ms: number) => () => void;
  /** Collegamento agli eventi del browser (online, visibilità). Restituisce la funzione di pulizia. */
  attachBrowserEvents?: (handlers: { online: () => void; visible: () => void }) => () => void;
}

const defaultSchedule = (fn: () => void, ms: number) => {
  const t = setTimeout(fn, ms);
  return () => clearTimeout(t);
};

function safeStorage(): Pick<Storage, "getItem" | "setItem" | "removeItem"> | null {
  try {
    return typeof window !== "undefined" ? window.localStorage : null;
  } catch {
    return null;
  }
}

const friendly = (e: unknown): string => (e instanceof Error ? e.message : String(e));

export function createSyncStore(api: RemoteApi, opts: SyncStoreOptions = {}): SyncStore {
  const clock = opts.clock ?? (() => new Date());
  const storage = opts.storage === undefined ? safeStorage() : opts.storage;
  const retryMs = opts.retryMs ?? 15_000;
  const schedule = opts.schedule ?? defaultSchedule;

  let userId: string | null = null;
  let map: ContentMap | null = null;
  let snapshot: UserSnapshot = emptySnapshot();
  let outbox: QueuedOp[] = [];
  let seq = 0;
  let ready = false;
  let flushing = false;
  let cancelRetry: (() => void) | null = null;
  let disposed = false;
  let status: SyncStatus = { phase: "loading", pending: 0, conflicts: 0, dropped: 0, localDataAvailable: false };
  const listeners = new Set<() => void>();

  const emit = () => listeners.forEach((l) => l());
  const setStatus = (patch: Partial<SyncStatus>) => {
    status = { ...status, ...patch, pending: outbox.length };
    emit();
  };

  const read = <T>(key: string): T | null => {
    try {
      const raw = storage?.getItem(key);
      return raw ? (JSON.parse(raw) as T) : null;
    } catch {
      return null;
    }
  };
  const write = (key: string, value: unknown) => {
    try {
      storage?.setItem(key, JSON.stringify(value));
    } catch {
      // quota piena: la coda resta in memoria per questa sessione
    }
  };
  const persist = () => {
    if (!userId) return;
    write(cacheKey(userId), { snapshot, outbox, seq, lastSyncedAt: status.lastSyncedAt } satisfies Persisted);
  };

  const localSnapshot = (): UserSnapshot | null => {
    const s = read<UserSnapshot>(LOCAL_STORAGE_KEY);
    return s && !isSnapshotEmpty({ ...emptySnapshot(), ...s }) ? { ...emptySnapshot(), ...s } : null;
  };
  const hasUnmigratedLocal = () => !!userId && !read<boolean>(migratedKey(userId)) && localSnapshot() !== null;

  const enqueue = (op: SyncOp) => {
    const key = opKey(op);
    if (key) outbox = outbox.filter((q) => opKey(q.op) !== key);
    if (op.kind === "import" && op.replace) outbox = [];
    outbox.push({ seq: ++seq, op });
  };

  function restoreCache(uid: string) {
    const cached = read<Persisted>(cacheKey(uid));
    if (cached) {
      snapshot = cached.snapshot;
      outbox = cached.outbox ?? [];
      seq = cached.seq ?? outbox.length;
      ready = true;
      status = { ...status, lastSyncedAt: cached.lastSyncedAt, pending: outbox.length };
    }
  }

  // Avvio rapido: se questo dispositivo ha già una cache dell'ultimo utente, la mostra subito (anche offline).
  const lastUser = read<string>(LAST_USER_KEY);
  if (lastUser) {
    userId = lastUser;
    restoreCache(lastUser);
  }

  async function loadFromServer(): Promise<void> {
    if (!userId) return;
    map = await api.loadContentMap();
    const rows = await api.loadProgress(userId);
    const server = rowsToSnapshot(rows, map);
    snapshot = applyPendingOps(server, outbox.map((q) => q.op));
    ready = true;
    persist();
    setStatus({ lastSyncedAt: clock().toISOString(), localDataAvailable: hasUnmigratedLocal() });
  }

  async function sendOp(op: SyncOp): Promise<"done" | "reload"> {
    if (!userId || !map) throw new RemoteError("Sessione non pronta", true);
    const m = map;
    const recall = (cardId: string) => m.recallUuidByCardId.get(cardId as never);
    switch (op.kind) {
      case "topic":
        await api.upsertTopic(userId, topicRow(op.topic));
        return "done";
      case "content": {
        const id = m.contentUuidBySlug.get(op.content.contentId);
        if (!id) throw new RemoteError(`Contenuto non presente sul server: ${op.content.contentId}`, false);
        await api.upsertContent(userId, contentRow(op.content, id));
        return "done";
      }
      case "preferences":
        await api.upsertPreferences(userId, preferencesRow(op.preferences));
        return "done";
      case "review": {
        const id = recall(op.state.cardId);
        if (!id) throw new RemoteError(`Domanda non presente sul server: ${op.state.cardId}`, false);
        const r = await api.recordReview({ state: stateRow(op.state, id), event: eventRow(op.event, id), expectedVersion: op.expectedVersion });
        if (r === "stale_version") {
          status = { ...status, conflicts: status.conflicts + 1 };
          return "reload";
        }
        return "done";
      }
      case "reset": {
        const id = recall(op.state.cardId);
        if (!id) throw new RemoteError(`Domanda non presente sul server: ${op.state.cardId}`, false);
        const r = await api.resetReview({ recallId: id, expectedVersion: op.expectedVersion, due: op.state.due, contentRevision: op.state.contentRevision });
        return r === "ok" ? "done" : "reload";
      }
      case "import": {
        const { unmapped, ...payload } = snapshotToImportPayload(op.snapshot, m);
        const r = await api.importProgress(payload, op.replace);
        status = { ...status, dropped: status.dropped + unmapped + r.skipped };
        return "reload";
      }
    }
  }

  let inFlight: Promise<void> | null = null;
  let rerun = false;

  /** Invia la coda. Se un invio è già in corso, ne programma un altro subito dopo e restituisce la stessa promessa. */
  function flush(): Promise<void> {
    if (inFlight) {
      rerun = true;
      return inFlight;
    }
    inFlight = (async () => {
      do {
        rerun = false;
        await flushOnce();
      } while (rerun && !disposed);
    })().finally(() => {
      inFlight = null;
    });
    return inFlight;
  }

  async function flushOnce(): Promise<void> {
    if (flushing || disposed || !userId) return;
    flushing = true;
    cancelRetry?.();
    cancelRetry = null;
    let needReload = false;
    try {
      if (!map) await loadFromServer();
      while (outbox.length > 0 && !disposed) {
        setStatus({ phase: "syncing" });
        const head = outbox[0];
        try {
          if ((await sendOp(head.op)) === "reload") needReload = true;
        } catch (e) {
          if (e instanceof RemoteError && !e.transient) {
            status = { ...status, dropped: status.dropped + 1, error: e.message };
          } else throw e;
        }
        outbox = outbox.filter((q) => q.seq !== head.seq);
        persist();
      }
      if (needReload) await loadFromServer();
      setStatus({ phase: "synced", lastSyncedAt: clock().toISOString() });
      persist();
    } catch (e) {
      const transient = !(e instanceof RemoteError) || e.transient;
      setStatus(transient ? { phase: "offline" } : { phase: "error", error: friendly(e) });
      if (transient && !disposed) cancelRetry = schedule(() => void flush(), retryMs);
    } finally {
      flushing = false;
    }
  }

  async function start(): Promise<void> {
    let user: { id: string; email?: string } | null;
    try {
      user = await api.currentUser();
    } catch {
      user = userId ? { id: userId } : null;
    }
    if (disposed) return;
    if (!user) {
      ready = true;
      setStatus({ phase: "signed_out" });
      return;
    }
    if (userId && user.id !== userId) {
      // utente diverso dall'ultimo che ha usato il dispositivo: niente dati dell'altro in memoria
      userId = user.id;
      snapshot = emptySnapshot();
      outbox = [];
      seq = 0;
      ready = false;
      restoreCache(user.id);
    } else if (!userId) {
      // primo avvio su questo dispositivo: si conservano le azioni fatte durante il caricamento
      const early = outbox.map((q) => q.op);
      userId = user.id;
      outbox = [];
      restoreCache(user.id);
      early.forEach(enqueue);
    }
    write(LAST_USER_KEY, user.id);
    status = { ...status, email: user.email ?? status.email };
    emit();
    try {
      await loadFromServer();
      // Primo accesso con un account vuoto: i progressi della modalità locale vengono portati nell'account.
      const local = localSnapshot();
      if (local && isSnapshotEmpty(snapshot) && outbox.length === 0 && !read<boolean>(migratedKey(user.id))) {
        enqueue({ kind: "import", snapshot: local, replace: false });
        write(migratedKey(user.id), true);
        setStatus({ localDataAvailable: false });
      }
    } catch (e) {
      const transient = !(e instanceof RemoteError) || e.transient;
      ready = true;
      setStatus(transient ? { phase: "offline" } : { phase: "error", error: friendly(e) });
      if (transient && !disposed) cancelRetry = schedule(() => void flush(), retryMs);
      return;
    }
    await flush();
  }

  const detach = opts.attachBrowserEvents?.({
    online: () => void flush(),
    visible: () => {
      if (!flushing && outbox.length === 0) void loadFromServer().catch(() => undefined);
      else void flush();
    },
  });

  void start();

  return {
    getSnapshot: () => snapshot,
    isReady: () => ready,
    subscribe(l) {
      listeners.add(l);
      return () => listeners.delete(l);
    },
    dispatch(m: Mutation) {
      const before = snapshot;
      const result = reduce(snapshot, m, clock());
      if (result.snapshot === snapshot) return result;
      snapshot = result.snapshot;
      const op = opFromMutation(m, before, snapshot);
      if (op) enqueue(op);
      persist();
      setStatus({});
      void flush();
      return result;
    },
    replace(next: UserSnapshot) {
      snapshot = next;
      enqueue({ kind: "import", snapshot: next, replace: true });
      persist();
      setStatus({});
      void flush();
    },
    getStatus: () => status,
    importLocalData() {
      const local = localSnapshot();
      if (!local || !userId) return;
      enqueue({ kind: "import", snapshot: local, replace: false });
      write(migratedKey(userId), true);
      persist();
      setStatus({ localDataAvailable: false });
      void flush();
    },
    refresh: () => flush().then(() => (outbox.length === 0 ? loadFromServer() : undefined)),
    clearDeviceCache() {
      try {
        if (userId) storage?.removeItem(cacheKey(userId));
        storage?.removeItem(LAST_USER_KEY);
      } catch {
        // ignorato
      }
    },
    dispose() {
      disposed = true;
      cancelRetry?.();
      detach?.();
      listeners.clear();
    },
  };
}
