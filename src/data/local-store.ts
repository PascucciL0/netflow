/**
 * Store locale (modalità demo / senza credenziali Supabase).
 * Persiste lo UserSnapshot in localStorage, sincronizza tra schede tramite l'evento "storage".
 * Tutte le modifiche passano dal reducer condiviso.
 */
import type { Mutation } from "@/domain/mutations";
import { emptySnapshot, type UserSnapshot } from "@/domain/progress";
import { reduce, type ReduceResult } from "@/engine/reducer";

export const STORAGE_KEY = "netflow:v1:snapshot";

type Listener = () => void;

export interface ProgressStore {
  getSnapshot(): UserSnapshot;
  subscribe(listener: Listener): () => void;
  dispatch(m: Mutation): ReduceResult;
  replace(next: UserSnapshot): void;
}

function readStorage(): UserSnapshot {
  try {
    const raw = window.localStorage.getItem(STORAGE_KEY);
    if (!raw) return emptySnapshot();
    const parsed = JSON.parse(raw) as Partial<UserSnapshot>;
    const base = emptySnapshot();
    return {
      topics: parsed.topics ?? base.topics,
      content: parsed.content ?? base.content,
      reviews: parsed.reviews ?? base.reviews,
      events: Array.isArray(parsed.events) ? parsed.events : base.events,
      preferences: { ...base.preferences, ...(parsed.preferences ?? {}) },
    };
  } catch {
    return emptySnapshot();
  }
}

export function createLocalStore(clock: () => Date = () => new Date()): ProgressStore {
  let snapshot: UserSnapshot = typeof window === "undefined" ? emptySnapshot() : readStorage();
  const listeners = new Set<Listener>();
  const emit = () => listeners.forEach((l) => l());

  const persist = () => {
    try {
      window.localStorage.setItem(STORAGE_KEY, JSON.stringify(snapshot));
    } catch {
      // quota piena o storage bloccato: lo stato resta in memoria per la sessione
    }
  };

  if (typeof window !== "undefined") {
    window.addEventListener("storage", (e) => {
      if (e.key === STORAGE_KEY) {
        snapshot = readStorage();
        emit();
      }
    });
  }

  return {
    getSnapshot: () => snapshot,
    subscribe(l) {
      listeners.add(l);
      return () => listeners.delete(l);
    },
    dispatch(m) {
      // rilegge prima di scrivere: riduce i conflitti tra schede aperte
      if (typeof window !== "undefined") snapshot = readStorage();
      const result = reduce(snapshot, m, clock());
      if (result.snapshot !== snapshot) {
        snapshot = result.snapshot;
        persist();
        emit();
      }
      return result;
    },
    replace(next) {
      snapshot = next;
      persist();
      emit();
    },
  };
}
