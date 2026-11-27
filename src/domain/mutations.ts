/**
 * Mutazioni dei dati personali. Sono l'unico modo per modificare uno UserSnapshot:
 * lo store locale e l'adapter Supabase applicano le stesse mutazioni con lo stesso
 * reducer (src/engine/reducer.ts), così la business logic non è duplicata.
 */
import type { CardId } from "./content";
import type { ReadSignal, ReviewRating, TopicStatus, UserPreferences } from "./progress";

export type Mutation =
  | { type: "content/seen"; contentId: string }
  | { type: "content/opened"; contentId: string }
  | { type: "content/save"; contentId: string; saved: boolean }
  | { type: "content/hide"; contentId: string; hidden: boolean }
  | { type: "content/signal"; contentId: string; signal: ReadSignal | null }
  | { type: "topic/status"; topicId: string; status: TopicStatus }
  | {
      type: "review/record";
      /** UUID generato dal client: rende la mutazione idempotente. */
      eventId: string;
      cardId: CardId;
      rating: ReviewRating;
      contentRevision: number;
      /** Versione dello stato su cui l'utente ha valutato (concorrenza ottimistica). */
      expectedVersion: number;
    }
  | { type: "review/reset"; cardId: CardId }
  | { type: "preferences/update"; patch: Partial<UserPreferences> };
