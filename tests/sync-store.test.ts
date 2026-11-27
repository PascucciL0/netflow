/**
 * Store sincronizzato (offline-first) con un backend finto in memoria che riproduce
 * la semantica delle funzioni SQL (idempotenza, controllo di versione, unione/sostituzione).
 */
import { describe, expect, it } from "vitest";
import { cardIdOf, type CardId } from "@/domain/content";
import { emptySnapshot, type UserSnapshot } from "@/domain/progress";
import { STORAGE_KEY } from "@/data/local-store";
import { createSyncStore, RemoteError, type RemoteApi, type SyncStore } from "@/data/sync-store";
import {
  buildContentMap,
  type ContentProgressRow,
  type ImportPayload,
  type PreferencesRow,
  type ReviewEventRow,
  type ReviewStateRow,
  type TopicProgressRow,
} from "@/data/sync-types";
import { T0, at, hours } from "./helpers";

const UID = "user-a";
const CARD: CardId = cardIdOf("arp-basics", "why");
const contents = [
  { id: "c-1", slug: "arp-basics", owner_id: null },
  { id: "c-2", slug: "dhcp-dora", owner_id: null },
];
const recalls = [{ id: "r-1", content_id: "c-1", key: "why" }];

class MemoryStorage {
  data = new Map<string, string>();
  getItem = (k: string) => this.data.get(k) ?? null;
  setItem = (k: string, v: string) => void this.data.set(k, v);
  removeItem = (k: string) => void this.data.delete(k);
}

class FakeBackend implements RemoteApi {
  online = true;
  user: { id: string; email?: string } | null = { id: UID, email: "a@example.com" };
  topics = new Map<string, TopicProgressRow>();
  content = new Map<string, ContentProgressRow>();
  states = new Map<string, ReviewStateRow>();
  events = new Map<string, ReviewEventRow>();
  prefs: PreferencesRow | null = null;
  calls: string[] = [];
  failNextContentPermanently = false;
  imports: { payload: Omit<ImportPayload, "unmapped">; replace: boolean }[] = [];

  private net() {
    if (!this.online) throw new RemoteError("Failed to fetch", true);
  }
  async currentUser() {
    return this.user;
  }
  async loadContentMap() {
    this.net();
    return buildContentMap(contents, recalls);
  }
  async loadProgress() {
    this.net();
    return { topics: [...this.topics.values()], content: [...this.content.values()], states: [...this.states.values()], events: [...this.events.values()], preferences: this.prefs };
  }
  async upsertTopic(_u: string, row: TopicProgressRow) {
    this.net();
    this.calls.push(`topic:${row.topic_id}`);
    this.topics.set(row.topic_id, row);
  }
  async upsertContent(_u: string, row: ContentProgressRow) {
    this.net();
    if (this.failNextContentPermanently) {
      this.failNextContentPermanently = false;
      throw new RemoteError("violates check constraint", false);
    }
    this.calls.push(`content:${row.content_id}`);
    this.content.set(row.content_id, row);
  }
  async upsertPreferences(_u: string, row: PreferencesRow) {
    this.net();
    this.calls.push("prefs");
    this.prefs = row;
  }
  async recordReview({ state, event, expectedVersion }: { state: ReviewStateRow; event: ReviewEventRow; expectedVersion: number }) {
    this.net();
    this.calls.push(`review:${event.id}`);
    if (this.events.has(event.id)) return "duplicate_event" as const;
    if ((this.states.get(state.recall_id)?.version ?? 0) !== expectedVersion) return "stale_version" as const;
    this.events.set(event.id, event);
    this.states.set(state.recall_id, { ...state, version: expectedVersion + 1 });
    return "ok" as const;
  }
  async resetReview({ recallId, expectedVersion, due }: { recallId: string; expectedVersion: number; due: string; contentRevision: number }) {
    this.net();
    const cur = this.states.get(recallId);
    if (!cur) return "not_found" as const;
    if (cur.version !== expectedVersion) return "stale_version" as const;
    this.states.set(recallId, { ...cur, due, stability: 0, difficulty: 0, reps: 0, lapses: 0, state: 0, scheduled_days: 0, last_review: null, version: cur.version + 1 });
    return "ok" as const;
  }
  async importProgress(payload: Omit<ImportPayload, "unmapped">, replace: boolean) {
    this.net();
    this.imports.push({ payload, replace });
    if (replace) {
      this.topics.clear();
      this.content.clear();
      this.states.clear();
      this.events.clear();
    }
    for (const t of payload.topics) if (!this.topics.has(t.topic_id)) this.topics.set(t.topic_id, t);
    for (const c of payload.content) if (!this.content.has(c.content_id)) this.content.set(c.content_id, c);
    for (const s of payload.states) if (!this.states.has(s.recall_id)) this.states.set(s.recall_id, s);
    for (const e of payload.events) if (!this.events.has(e.id)) this.events.set(e.id, e);
    return { skipped: 0 };
  }
}

/** Pianificatore manuale: i retry partono solo quando il test lo decide. */
function manualSchedule() {
  const jobs: (() => void)[] = [];
  return {
    schedule: (fn: () => void) => {
      jobs.push(fn);
      return () => {
        const i = jobs.indexOf(fn);
        if (i >= 0) jobs.splice(i, 1);
      };
    },
    runAll: () => jobs.splice(0).forEach((f) => f()),
  };
}

const settle = () => new Promise((r) => setTimeout(r, 0));
async function until(store: SyncStore, cond: () => boolean) {
  for (let i = 0; i < 50 && !cond(); i++) await settle();
  expect(cond()).toBe(true);
}

function setup(opts: { backend?: FakeBackend; storage?: MemoryStorage; now?: Date } = {}) {
  const backend = opts.backend ?? new FakeBackend();
  const storage = opts.storage ?? new MemoryStorage();
  const sched = manualSchedule();
  let now = opts.now ?? T0;
  const store = createSyncStore(backend, { storage, clock: () => now, schedule: sched.schedule });
  return { backend, storage, store, sched, setNow: (d: Date) => (now = d) };
}

describe("store sincronizzato", () => {
  it("carica i progressi dal server e li traduce negli id del client", async () => {
    const backend = new FakeBackend();
    backend.topics.set("arp", { topic_id: "arp", status: "studying", updated_at: "2026-11-20 10:00:00+00" });
    backend.content.set("c-1", { content_id: "c-1", first_seen_at: null, last_seen_at: "2026-11-20T10:00:00Z", seen_count: 2, open_count: 1, saved: true, hidden: false, signal: null, updated_at: "2026-11-20T10:00:00Z" });
    const { store } = setup({ backend });
    expect(store.isReady()).toBe(false);
    await until(store, () => store.getStatus().phase === "synced");
    expect(store.isReady()).toBe(true);
    const s = store.getSnapshot();
    expect(s.topics.arp.status).toBe("studying");
    expect(s.topics.arp.updatedAt).toBe("2026-11-20T10:00:00.000Z");
    expect(s.content["arp-basics"]).toMatchObject({ saved: true, seenCount: 2 });
    expect(store.getStatus().email).toBe("a@example.com");
  });

  it("applica subito la mutazione e poi la salva sul server", async () => {
    const { store, backend } = setup();
    await until(store, () => store.getStatus().phase === "synced");
    store.dispatch({ type: "content/save", contentId: "arp-basics", saved: true });
    expect(store.getSnapshot().content["arp-basics"].saved).toBe(true);
    await until(store, () => backend.content.get("c-1")?.saved === true && store.getStatus().phase === "synced");
    expect(store.getStatus().pending).toBe(0);
  });

  it("offline: accoda, persiste, fonde le operazioni sulla stessa entità e riprende al ritorno della rete", async () => {
    const { store, backend, storage, sched, setNow } = setup();
    await until(store, () => store.getStatus().phase === "synced");
    backend.online = false;
    store.dispatch({ type: "content/seen", contentId: "arp-basics" });
    await until(store, () => store.getStatus().phase === "offline");
    setNow(at(hours(1)));
    store.dispatch({ type: "content/seen", contentId: "arp-basics" });
    store.dispatch({ type: "topic/status", topicId: "arp", status: "studied" });
    await settle();
    expect(store.getStatus().pending).toBe(2); // due "seen" fusi in una sola operazione

    // ricarica della pagina mentre si è ancora offline: la cache restituisce dati e coda
    const reopened = createSyncStore(backend, { storage, clock: () => at(hours(1)), schedule: manualSchedule().schedule });
    expect(reopened.isReady()).toBe(true);
    expect(reopened.getSnapshot().content["arp-basics"].seenCount).toBe(2);
    expect(reopened.getStatus().pending).toBe(2);
    reopened.dispose();

    backend.online = true;
    sched.runAll();
    await until(store, () => store.getStatus().phase === "synced");
    expect(backend.content.get("c-1")?.seen_count).toBe(2);
    expect(backend.topics.get("arp")?.status).toBe("studied");
    expect(backend.calls.filter((c) => c.startsWith("content:"))).toHaveLength(1);
  });

  it("ripassi: idempotenti e, in caso di conflitto con un altro dispositivo, vince il server", async () => {
    const { store, backend } = setup();
    await until(store, () => store.getStatus().phase === "synced");
    store.dispatch({ type: "review/record", eventId: "e-1", cardId: CARD, rating: "good", contentRevision: 1, expectedVersion: 0 });
    await until(store, () => backend.events.has("e-1"));
    expect(backend.states.get("r-1")?.version).toBe(1);

    // un altro dispositivo valuta la stessa carta (versione 1 → 2)
    await backend.recordReview({ state: { ...backend.states.get("r-1")!, reps: 9 }, event: { ...backend.events.get("e-1")!, id: "e-other" }, expectedVersion: 1 });
    // questo dispositivo, ancora alla versione 1, valuta di nuovo
    store.dispatch({ type: "review/record", eventId: "e-2", cardId: CARD, rating: "easy", contentRevision: 1, expectedVersion: 1 });
    await until(store, () => store.getStatus().phase === "synced" && store.getStatus().conflicts === 1);
    expect(backend.events.has("e-2")).toBe(false);
    expect(store.getSnapshot().reviews[CARD]).toMatchObject({ version: 2, reps: 9 });
    expect(store.getSnapshot().events.map((e) => e.id).sort()).toEqual(["e-1", "e-other"]);
  });

  it("reset di una carta allineato alla versione del server", async () => {
    const { store, backend } = setup();
    await until(store, () => store.getStatus().phase === "synced");
    store.dispatch({ type: "review/record", eventId: "e-1", cardId: CARD, rating: "good", contentRevision: 1, expectedVersion: 0 });
    store.dispatch({ type: "review/reset", cardId: CARD });
    await until(store, () => store.getStatus().phase === "synced" && backend.states.get("r-1")?.version === 2);
    expect(backend.states.get("r-1")?.reps).toBe(0);
    expect(store.getSnapshot().reviews[CARD].version).toBe(2);
    store.dispatch({ type: "review/record", eventId: "e-3", cardId: CARD, rating: "good", contentRevision: 1, expectedVersion: 2 });
    await until(store, () => backend.events.has("e-3"));
  });

  it("un errore definitivo scarta solo quell'operazione e prosegue con le altre", async () => {
    const { store, backend } = setup();
    await until(store, () => store.getStatus().phase === "synced");
    backend.failNextContentPermanently = true;
    store.dispatch({ type: "content/save", contentId: "arp-basics", saved: true });
    store.dispatch({ type: "topic/status", topicId: "arp", status: "studying" });
    await until(store, () => backend.topics.has("arp"));
    expect(store.getStatus()).toMatchObject({ dropped: 1, pending: 0 });
    expect(store.getStatus().error).toMatch(/check constraint/);
  });

  it("contenuti non presenti sul server: l'operazione viene scartata senza bloccare la coda", async () => {
    const { store, backend } = setup();
    await until(store, () => store.getStatus().phase === "synced");
    store.dispatch({ type: "content/save", contentId: "solo-locale", saved: true });
    store.dispatch({ type: "preferences/update", patch: { theme: "dark" } });
    await until(store, () => backend.prefs?.theme === "dark");
    expect(store.getStatus().dropped).toBe(1);
  });

  it("primo accesso: i progressi della modalità locale vengono portati nell'account vuoto, una sola volta", async () => {
    const storage = new MemoryStorage();
    const local: UserSnapshot = { ...emptySnapshot(), topics: { arp: { topicId: "arp", status: "studied", updatedAt: T0.toISOString() } } };
    storage.setItem(STORAGE_KEY, JSON.stringify(local));
    const backend = new FakeBackend();
    const { store } = setup({ backend, storage });
    await until(store, () => backend.topics.get("arp")?.status === "studied" && store.getStatus().phase === "synced");
    expect(backend.imports).toHaveLength(1);
    expect(backend.imports[0].replace).toBe(false);
    expect(store.getSnapshot().topics.arp.status).toBe("studied");
    store.dispose();

    const again = createSyncStore(backend, { storage, clock: () => T0, schedule: manualSchedule().schedule });
    await until(again, () => again.getStatus().phase === "synced");
    expect(backend.imports).toHaveLength(1);
    again.dispose();
  });

  it("account già usato altrove: i dati locali non vengono uniti in automatico ma proposti", async () => {
    const storage = new MemoryStorage();
    storage.setItem(STORAGE_KEY, JSON.stringify({ ...emptySnapshot(), topics: { dhcp: { topicId: "dhcp", status: "studying", updatedAt: T0.toISOString() } } }));
    const backend = new FakeBackend();
    backend.topics.set("arp", { topic_id: "arp", status: "mastered", updated_at: T0.toISOString() });
    const { store } = setup({ backend, storage });
    await until(store, () => store.getStatus().phase === "synced");
    expect(store.getStatus().localDataAvailable).toBe(true);
    expect(backend.imports).toHaveLength(0);
    store.importLocalData();
    await until(store, () => backend.topics.has("dhcp") && store.getStatus().phase === "synced");
    expect(store.getStatus().localDataAvailable).toBe(false);
    expect(store.getSnapshot().topics.arp.status).toBe("mastered");
  });

  it("cambio utente sullo stesso dispositivo: nessun dato del precedente resta visibile", async () => {
    const storage = new MemoryStorage();
    const backend = new FakeBackend();
    backend.topics.set("arp", { topic_id: "arp", status: "mastered", updated_at: T0.toISOString() });
    const first = setup({ backend, storage }).store;
    await until(first, () => first.getStatus().phase === "synced");
    first.dispose();

    const other = new FakeBackend();
    other.user = { id: "user-b" };
    const second = createSyncStore(other, { storage, clock: () => T0, schedule: manualSchedule().schedule });
    await until(second, () => second.getStatus().phase === "synced");
    expect(second.getSnapshot().topics).toEqual({});
  });

  it("sessione assente: stato signed_out", async () => {
    const backend = new FakeBackend();
    backend.user = null;
    const { store } = setup({ backend });
    await until(store, () => store.getStatus().phase === "signed_out");
    expect(store.isReady()).toBe(true);
  });

  it("replace (cancellazione completa) sostituisce i dati sul server e svuota la coda precedente", async () => {
    const { store, backend } = setup();
    await until(store, () => store.getStatus().phase === "synced");
    backend.online = false;
    store.dispatch({ type: "topic/status", topicId: "arp", status: "studying" });
    store.replace(emptySnapshot());
    expect(store.getStatus().pending).toBe(1);
    backend.online = true;
    await store.refresh();
    expect(backend.imports.at(-1)).toMatchObject({ replace: true });
    expect(backend.topics.size).toBe(0);
  });
});

describe("mappa degli id e conversione delle righe", () => {
  it("se uno slug esiste sia di sistema sia importato, vince il contenuto dell'utente", () => {
    const map = buildContentMap(
      [
        { id: "sys", slug: "arp-basics", owner_id: null },
        { id: "own", slug: "arp-basics", owner_id: UID },
      ],
      [
        { id: "r-sys", content_id: "sys", key: "why" },
        { id: "r-own", content_id: "own", key: "why" },
      ],
    );
    expect(map.contentUuidBySlug.get("arp-basics")).toBe("own");
    expect(map.recallUuidByCardId.get(CARD)).toBe("r-own");
  });
});
