"use client";

import { createContext, useContext, useMemo, useSyncExternalStore, type ReactNode } from "react";
import type { Mutation } from "@/domain/mutations";
import { emptySnapshot, type UserSnapshot } from "@/domain/progress";
import type { ReduceResult } from "@/engine/reducer";
import { createLocalStore, type ProgressStore } from "./local-store";

const Ctx = createContext<ProgressStore | null>(null);
const SERVER_SNAPSHOT = emptySnapshot();

/**
 * Fornisce lo store dei progressi all'albero React.
 * Oggi: store locale. Quando Supabase sarà configurato, qui verrà scelto l'adapter remoto
 * (stessa interfaccia ProgressStore, vedi docs/ARCHITECTURE.md).
 */
export function ProgressProvider({ children }: { children: ReactNode }) {
  const store = useMemo(() => createLocalStore(), []);
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

/** true dopo l'idratazione: evita di mostrare stati "vuoti" prima di leggere localStorage. */
export function useHydrated(): boolean {
  return useSyncExternalStore(
    () => () => {},
    () => true,
    () => false,
  );
}

export function useDispatch(): (m: Mutation) => ReduceResult {
  return useStore().dispatch;
}

export function useStoreApi(): ProgressStore {
  return useStore();
}
