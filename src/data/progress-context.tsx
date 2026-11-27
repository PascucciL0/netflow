"use client";

import { createContext, useContext, useMemo, useSyncExternalStore, type ReactNode } from "react";
import type { Mutation } from "@/domain/mutations";
import { emptySnapshot, type UserSnapshot } from "@/domain/progress";
import type { ReduceResult } from "@/engine/reducer";
import { dataMode } from "@/lib/env";
import { getSupabaseBrowserClient } from "@/lib/supabase/client";
import { createLocalStore, type ProgressStore } from "./local-store";
import { createSupabaseRemote } from "./supabase-remote";
import { createSyncStore, type SyncStatus, type SyncStore } from "./sync-store";

const Ctx = createContext<ProgressStore | null>(null);
const SERVER_SNAPSHOT = emptySnapshot();

function browserEvents(h: { online: () => void; visible: () => void }) {
  const onVisible = () => {
    if (document.visibilityState === "visible") h.visible();
  };
  window.addEventListener("online", h.online);
  document.addEventListener("visibilitychange", onVisible);
  return () => {
    window.removeEventListener("online", h.online);
    document.removeEventListener("visibilitychange", onVisible);
  };
}

/** Un solo store sincronizzato per scheda, per tutta la vita della pagina (anche con StrictMode). */
let browserSyncStore: SyncStore | null = null;

function createStore(): ProgressStore {
  if (dataMode === "supabase" && typeof window !== "undefined") {
    browserSyncStore ??= createSyncStore(createSupabaseRemote(getSupabaseBrowserClient()), { attachBrowserEvents: browserEvents });
    return browserSyncStore;
  }
  return createLocalStore();
}

/**
 * Fornisce lo store dei progressi all'albero React.
 * Modalità locale: localStorage. Modalità Supabase (variabili NEXT_PUBLIC_SUPABASE_* presenti):
 * store sincronizzato offline-first con la stessa interfaccia (vedi src/data/sync-store.ts).
 */
export function ProgressProvider({ children }: { children: ReactNode }) {
  const store = useMemo(() => createStore(), []);
  return <Ctx.Provider value={store}>{children}</Ctx.Provider>;
}

function useStore(): ProgressStore {
  const s = useContext(Ctx);
  if (!s) throw new Error("ProgressProvider mancante");
  return s;
}

export function useSnapshot(): UserSnapshot {
  const store = useStore();
  return useSyncExternalStore(store.subscribe, store.getSnapshot, () => SERVER_SNAPSHOT);
}

/**
 * true dopo l'idratazione E quando i dati personali sono disponibili (localStorage o cache/server).
 * Evita di mostrare stati "vuoti" o di calcolare il feed prima di avere i progressi.
 */
export function useHydrated(): boolean {
  const store = useStore();
  return useSyncExternalStore(store.subscribe, store.isReady, () => false);
}

export function useDispatch(): (m: Mutation) => ReduceResult {
  return useStore().dispatch;
}

export function useStoreApi(): ProgressStore {
  return useStore();
}

const isSyncStore = (s: ProgressStore): s is SyncStore => "getStatus" in s;

/** Stato della sincronizzazione; null in modalità locale. */
export function useSyncStatus(): SyncStatus | null {
  const store = useStore();
  const sync = isSyncStore(store) ? store : null;
  return useSyncExternalStore(
    store.subscribe,
    () => (sync ? sync.getStatus() : null),
    () => null,
  );
}

export function useSyncStore(): SyncStore | null {
  const store = useStore();
  return isSyncStore(store) ? store : null;
}
