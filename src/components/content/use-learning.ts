"use client";

import { useMemo, useState } from "react";
import { cardIdOf, type CardId, type ContentItem } from "@/domain/content";
import { seedItems, topics } from "@/data/catalog";
import { useHydrated, useSnapshot, useStoreApi } from "@/data/progress-context";
import { useImportedItems } from "@/data/import-store";
import { buildFeed, type FeedResult } from "@/engine/feed";
import { isDue } from "@/engine/scheduler";
import { localDayKey } from "@/lib/dates";

/** Tutti i contenuti disponibili: seed di sistema + contenuti importati dall'utente. */
export function useAllItems(): ContentItem[] {
  const imported = useImportedItems();
  return useMemo(() => (imported.length === 0 ? seedItems : [...seedItems, ...imported]), [imported]);
}

/**
 * Feed "congelato" per la sessione: viene calcolato all'apertura e su richiesta (refresh),
 * non a ogni interazione, così le card non si spostano mentre l'utente scorre.
 */
export function useFeed(): { feed: FeedResult | null; refresh: () => void } {
  const hydrated = useHydrated();
  const store = useStoreApi();
  const items = useAllItems();
  const [generation, setGeneration] = useState(0);
  const feed = useMemo(() => {
    if (!hydrated) return null;
    void generation;
    const snapshot = store.getSnapshot();
    const now = new Date();
    return buildFeed({ now, items, topics, snapshot, dayKey: localDayKey(now, snapshot.preferences.timeZone), limit: 30 });
  }, [hydrated, generation, items, store]);
  return { feed, refresh: () => setGeneration((g) => g + 1) };
}

export interface DueCard {
  cardId: CardId;
  item: ContentItem;
  recallKey: string;
  due: string;
}

export function useDueCards(): DueCard[] {
  const snapshot = useSnapshot();
  const items = useAllItems();
  const hydrated = useHydrated();
  return useMemo(() => {
    if (!hydrated) return [];
    const now = new Date();
    const out: DueCard[] = [];
    for (const item of items) {
      if (snapshot.content[item.id]?.hidden) continue;
      for (const r of item.recall) {
        const cardId = cardIdOf(item.id, r.key);
        const st = snapshot.reviews[cardId];
        if (st && isDue(st, now)) out.push({ cardId, item, recallKey: r.key, due: st.due });
      }
    }
    return out.sort((a, b) => a.due.localeCompare(b.due));
  }, [snapshot, items, hydrated]);
}

export function useDueCount(): number {
  return useDueCards().length;
}
