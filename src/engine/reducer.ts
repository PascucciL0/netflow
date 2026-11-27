/**
 * Reducer puro: (snapshot, mutazione, now) → nuovo snapshot.
 * Nessun I/O. Restituisce sempre un nuovo oggetto (immutabilità) oppure lo stesso
 * riferimento se la mutazione non cambia nulla (idempotenza).
 */
import type { Mutation } from "@/domain/mutations";
import type { ContentProgress, UserSnapshot } from "@/domain/progress";
import { applyReview, newReviewState, resetReviewState } from "./scheduler";

/** Una nuova visualizzazione dello stesso contenuto entro questo intervallo non conta come nuova. */
const SEEN_DEBOUNCE_MS = 30 * 60_000;

export type ReduceResult = { snapshot: UserSnapshot; conflict?: "stale_version" | "duplicate_event" };

export function reduce(s: UserSnapshot, m: Mutation, now: Date): ReduceResult {
  const iso = now.toISOString();
  const content = (id: string): ContentProgress =>
    s.content[id] ?? { contentId: id, seenCount: 0, openCount: 0, saved: false, hidden: false, updatedAt: iso };
  const withContent = (id: string, patch: Partial<ContentProgress>): UserSnapshot => ({
    ...s,
    content: { ...s.content, [id]: { ...content(id), ...patch, updatedAt: iso } },
  });

  switch (m.type) {
    case "content/seen": {
      const c = content(m.contentId);
      if (c.lastSeenAt && now.getTime() - new Date(c.lastSeenAt).getTime() < SEEN_DEBOUNCE_MS) return { snapshot: s };
      return { snapshot: withContent(m.contentId, { firstSeenAt: c.firstSeenAt ?? iso, lastSeenAt: iso, seenCount: c.seenCount + 1 }) };
    }
    case "content/opened": {
      const c = content(m.contentId);
      return { snapshot: withContent(m.contentId, { firstSeenAt: c.firstSeenAt ?? iso, lastSeenAt: iso, seenCount: Math.max(1, c.seenCount), openCount: c.openCount + 1 }) };
    }
    case "content/save":
      return { snapshot: withContent(m.contentId, { saved: m.saved }) };
    case "content/hide":
      return { snapshot: withContent(m.contentId, { hidden: m.hidden }) };
    case "content/signal":
      return { snapshot: withContent(m.contentId, { signal: m.signal ?? undefined }) };
    case "topic/status":
      return { snapshot: { ...s, topics: { ...s.topics, [m.topicId]: { topicId: m.topicId, status: m.status, updatedAt: iso } } } };
    case "review/record": {
      if (s.events.some((e) => e.id === m.eventId)) return { snapshot: s, conflict: "duplicate_event" };
      const current = s.reviews[m.cardId] ?? newReviewState(m.cardId, now, m.contentRevision);
      if (current.version !== m.expectedVersion) return { snapshot: s, conflict: "stale_version" };
      const { state, event } = applyReview({ state: current, rating: m.rating, now, eventId: m.eventId, contentRevision: m.contentRevision });
      return { snapshot: { ...s, reviews: { ...s.reviews, [m.cardId]: state }, events: [...s.events, event] } };
    }
    case "review/reset": {
      const current = s.reviews[m.cardId];
      if (!current) return { snapshot: s };
      return { snapshot: { ...s, reviews: { ...s.reviews, [m.cardId]: resetReviewState(current, now) } } };
    }
    case "preferences/update":
      return { snapshot: { ...s, preferences: { ...s.preferences, ...m.patch } } };
  }
}
