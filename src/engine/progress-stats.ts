/** Statistiche dei progressi: solo dati reali, nessuna stima di "probabilità di superare l'esame". */
import { cardIdOf, type ContentItem } from "@/domain/content";
import type { BlueprintObjective, TopicNode } from "@/domain/catalog";
import { TOPIC_STATUSES, type ReviewRating, type TopicStatus, type UserSnapshot } from "@/domain/progress";
import { isConsolidated, isDue } from "./scheduler";

export interface ProgressStats {
  topicsByStatus: Record<TopicStatus, number>;
  content: { total: number; seen: number; opened: number; saved: number };
  cards: { total: number; inReview: number; consolidated: number; due: number };
  reviews: { total: number; last7: Record<ReviewRating, number> };
  /** Obiettivi del blueprint per cui esiste almeno un contenuto: copertura della libreria, non preparazione. */
  coverage: { covered: number; total: number };
  hardestTopics: { topicId: string; lapses: number; again: number }[];
}

export function computeStats(items: ContentItem[], topics: TopicNode[], objectives: BlueprintObjective[], s: UserSnapshot, now: Date): ProgressStats {
  const topicsByStatus = Object.fromEntries(TOPIC_STATUSES.map((st) => [st, 0])) as Record<TopicStatus, number>;
  for (const t of topics) topicsByStatus[s.topics[t.id]?.status ?? "not_started"]++;

  const content = { total: items.length, seen: 0, opened: 0, saved: 0 };
  for (const it of items) {
    const p = s.content[it.id];
    if (p?.lastSeenAt) content.seen++;
    if (p && p.openCount > 0) content.opened++;
    if (p?.saved) content.saved++;
  }

  const cards = { total: 0, inReview: 0, consolidated: 0, due: 0 };
  const perTopic = new Map<string, { lapses: number; again: number }>();
  const contentTopic = new Map(items.map((i) => [i.id, i.topicId]));
  for (const it of items)
    for (const r of it.recall) {
      cards.total++;
      const st = s.reviews[cardIdOf(it.id, r.key)];
      if (!st || st.reps === 0) continue;
      cards.inReview++;
      if (isConsolidated(st)) cards.consolidated++;
      if (isDue(st, now)) cards.due++;
      const agg = perTopic.get(it.topicId) ?? { lapses: 0, again: 0 };
      agg.lapses += st.lapses;
      perTopic.set(it.topicId, agg);
    }

  const weekAgo = now.getTime() - 7 * 86_400_000;
  const last7: Record<ReviewRating, number> = { again: 0, hard: 0, good: 0, easy: 0 };
  for (const e of s.events) {
    if (new Date(e.reviewedAt).getTime() >= weekAgo) last7[e.rating]++;
    if (e.rating === "again") {
      const topicId = contentTopic.get(e.cardId.split("#")[0]);
      if (topicId) {
        const agg = perTopic.get(topicId) ?? { lapses: 0, again: 0 };
        agg.again++;
        perTopic.set(topicId, agg);
      }
    }
  }

  const coveredSet = new Set(items.flatMap((i) => i.objectives));
  const coverage = { covered: objectives.filter((o) => coveredSet.has(o.id)).length, total: objectives.length };

  const hardestTopics = [...perTopic.entries()]
    .map(([topicId, v]) => ({ topicId, ...v }))
    .filter((t) => t.again + t.lapses > 0)
    .sort((a, b) => b.again + b.lapses - (a.again + a.lapses) || a.topicId.localeCompare(b.topicId))
    .slice(0, 5);

  return { topicsByStatus, content, cards, reviews: { total: s.events.length, last7 }, coverage, hardestTopics };
}
