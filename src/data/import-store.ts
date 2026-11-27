"use client";

/**
 * Libreria dei contenuti importati (modalità locale).
 * Un solo oggetto in localStorage, scritto in un'unica operazione: l'import è tutto o niente.
 * Sincronizzato tra schede con l'evento "storage". Quando l'adapter Supabase sarà pronto,
 * la stessa interfaccia potrà leggere e scrivere la tabella dei contenuti dell'utente.
 */
import { useMemo, useSyncExternalStore } from "react";
import type { ContentItem } from "@/domain/content";
import { seedItemById } from "./catalog";
import { applyImport, emptyLibrary, removePackage, reviveLibrary, type ImportedLibrary, type ImportPlan, type ImportRecord } from "./import-plan";

export const IMPORT_STORAGE_KEY = "netflow:v1:imported";

const SYSTEM_IDS: ReadonlySet<string> = new Set(seedItemById.keys());
const EMPTY = emptyLibrary();
const EMPTY_ITEMS: ContentItem[] = [];

type Listener = () => void;
const listeners = new Set<Listener>();
let library: ImportedLibrary | null = null;

function read(): ImportedLibrary {
  try {
    const raw = window.localStorage.getItem(IMPORT_STORAGE_KEY);
    return raw ? reviveLibrary(JSON.parse(raw), SYSTEM_IDS) : emptyLibrary();
  } catch {
    return emptyLibrary();
  }
}

function current(): ImportedLibrary {
  if (typeof window === "undefined") return EMPTY;
  if (!library) {
    library = read();
    window.addEventListener("storage", (e) => {
      if (e.key === IMPORT_STORAGE_KEY) {
        library = read();
        listeners.forEach((l) => l());
      }
    });
  }
  return library;
}

function write(next: ImportedLibrary): { ok: true } | { ok: false; reason: string } {
  try {
    window.localStorage.setItem(IMPORT_STORAGE_KEY, JSON.stringify(next));
  } catch {
    return { ok: false, reason: "Spazio del browser esaurito o archiviazione bloccata: nessun contenuto è stato importato." };
  }
  library = next;
  listeners.forEach((l) => l());
  return { ok: true };
}

const subscribe = (l: Listener) => {
  listeners.add(l);
  return () => {
    listeners.delete(l);
  };
};

export function getImportedLibrary(): ImportedLibrary {
  return current();
}

export function useImportedLibrary(): ImportedLibrary {
  return useSyncExternalStore(subscribe, current, () => EMPTY);
}

/** Contenuti importati come array stabile (stessa identità finché la libreria non cambia). */
export function useImportedItems(): ContentItem[] {
  const lib = useImportedLibrary();
  return useMemo(() => (lib === EMPTY ? EMPTY_ITEMS : Object.values(lib.items).map((e) => e.item)), [lib]);
}

/** Conferma un piano. Rilegge lo storage prima di scrivere (altre schede) e scrive in un'unica operazione. */
export function commitImport(plan: ImportPlan): { ok: true; record: ImportRecord } | { ok: false; reason: string } {
  const fresh = read();
  library = fresh;
  const id = typeof crypto !== "undefined" && "randomUUID" in crypto ? crypto.randomUUID() : `imp-${Date.now()}`;
  const res = applyImport(fresh, plan, new Date(), id);
  if (!res.ok) return res;
  const w = write(res.library);
  return w.ok ? { ok: true, record: res.record } : w;
}

export function removeImportedPackage(packageId: string): { ok: true } | { ok: false; reason: string } {
  return write(removePackage(read(), packageId));
}

export { SYSTEM_IDS };
