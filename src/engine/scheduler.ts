/**
 * Spaced repetition: wrapper deterministico attorno a ts-fsrs (FSRS v5/v6).
 *
 * Responsabilità:
 * - tradurre ReviewState (contratto NetFlow) ⇄ Card (ts-fsrs);
 * - applicare una valutazione e produrre nuovo stato + evento immutabile;
 * - nessun accesso a I/O, nessun Date.now() implicito: "now" è sempre un parametro.
 *
 * Corrispondenza valutazioni (docs/adr/0004-spaced-repetition-fsrs.md):
 *   Da ristudiare → Again · Difficile → Hard · Compreso → Good · Padroneggiato → Easy
 */
import { createEmptyCard, fsrs, generatorParameters, Rating, type Card, type Grade } from "ts-fsrs";
import type { CardId } from "@/domain/content";
import type { CardState, ReviewEvent, ReviewRating, ReviewState } from "@/domain/progress";

const RATING_TO_FSRS: Record<ReviewRating, Grade> = {
  again: Rating.Again,
  hard: Rating.Hard,
  good: Rating.Good,
  easy: Rating.Easy,
};

/**
 * Parametri: retention desiderata 0.9 (default FSRS), intervallo massimo 1 anno,
 * fuzz disattivato per rendere il comportamento riproducibile e testabile.
 * learning steps brevi (1m, 10m) come da default FSRS.
 */
const scheduler = fsrs(
  generatorParameters({
    request_retention: 0.9,
    maximum_interval: 365,
    enable_fuzz: false,
    enable_short_term: true,
  }),
);

const DAY_MS = 86_400_000;

export function newReviewState(cardId: CardId, now: Date, contentRevision: number): ReviewState {
  return fromCard(cardId, createEmptyCard(now), contentRevision, 0, now);
}

function toCard(s: ReviewState): Card {
  return {
    due: new Date(s.due),
    stability: s.stability,
    difficulty: s.difficulty,
    elapsed_days: 0, // deprecato in ts-fsrs, ricalcolato internamente da last_review
    scheduled_days: s.scheduledDays,
    learning_steps: s.learningSteps,
    reps: s.reps,
    lapses: s.lapses,
    state: s.state,
    last_review: s.lastReview ? new Date(s.lastReview) : undefined,
  };
}

function fromCard(cardId: CardId, c: Card, contentRevision: number, version: number, now: Date): ReviewState {
  return {
    cardId,
    due: c.due.toISOString(),
    stability: c.stability,
    difficulty: c.difficulty,
    scheduledDays: c.scheduled_days,
    learningSteps: c.learning_steps,
    reps: c.reps,
    lapses: c.lapses,
    state: c.state as CardState,
    lastReview: c.last_review?.toISOString(),
    contentRevision,
    version,
    updatedAt: now.toISOString(),
  };
}

export interface ApplyReviewInput {
  state: ReviewState;
  rating: ReviewRating;
  now: Date;
  eventId: string;
  contentRevision: number;
}

export interface ApplyReviewResult {
  state: ReviewState;
  event: ReviewEvent;
}

/**
 * Applica una valutazione. Gestisce revisioni anticipate e in ritardo: FSRS usa
 * il tempo realmente trascorso da last_review, quindi un ripasso anticipato
 * produce un aumento di stabilità minore e uno in ritardo uno maggiore (se ricordato).
 * Un orologio che va indietro (now < lastReview) viene normalizzato a lastReview.
 */
export function applyReview({ state, rating, now, eventId, contentRevision }: ApplyReviewInput): ApplyReviewResult {
  const last = state.lastReview ? new Date(state.lastReview) : undefined;
  const effectiveNow = last && now < last ? last : now;
  const record = scheduler.next(toCard(state), effectiveNow, RATING_TO_FSRS[rating]);
  const next = fromCard(state.cardId, record.card, contentRevision, state.version + 1, effectiveNow);
  const elapsedDays = last ? Math.max(0, Math.floor((effectiveNow.getTime() - last.getTime()) / DAY_MS)) : 0;
  return {
    state: next,
    event: {
      id: eventId,
      cardId: state.cardId,
      rating,
      reviewedAt: effectiveNow.toISOString(),
      stateBefore: state.state,
      dueBefore: state.reps > 0 ? state.due : undefined,
      dueAfter: next.due,
      stabilityAfter: next.stability,
      difficultyAfter: next.difficulty,
      scheduledDays: next.scheduledDays,
      elapsedDays,
    },
  };
}

/** Anteprima dell'intervallo per ciascuna valutazione (mostrata sui pulsanti). */
export function previewIntervals(state: ReviewState, now: Date): Record<ReviewRating, Date> {
  const preview = scheduler.repeat(toCard(state), now);
  return {
    again: preview[Rating.Again].card.due,
    hard: preview[Rating.Hard].card.due,
    good: preview[Rating.Good].card.due,
    easy: preview[Rating.Easy].card.due,
  };
}

/** Reset esplicito di una carta (azione dell'utente). Lo storico eventi resta. */
export function resetReviewState(state: ReviewState, now: Date): ReviewState {
  const fresh = newReviewState(state.cardId, now, state.contentRevision);
  return { ...fresh, version: state.version + 1 };
}

export const isDue = (s: ReviewState, now: Date): boolean => s.reps > 0 && new Date(s.due).getTime() <= now.getTime();

/**
 * Una carta è "consolidata" quando è in stato Review con stabilità ≥ 21 giorni
 * e almeno 3 ripetizioni. Una singola risposta corretta non basta mai.
 */
export const isConsolidated = (s: ReviewState): boolean => s.state === 2 && s.stability >= 21 && s.reps >= 3;

/** Probabilità stimata di ricordo adesso (0..1), dal modello FSRS. */
export function retrievability(s: ReviewState, now: Date): number {
  if (s.reps === 0) return 0;
  return scheduler.get_retrievability(toCard(s), now, false);
}

/** Formatta un intervallo in modo compatto: "10 min", "3 g", "2 mesi". */
export function formatInterval(from: Date, to: Date): string {
  const ms = Math.max(0, to.getTime() - from.getTime());
  const min = Math.round(ms / 60_000);
  if (min < 60) return `${Math.max(1, min)} min`;
  const h = Math.round(min / 60);
  if (h < 24) return `${h} h`;
  const d = Math.round(h / 24);
  if (d < 31) return `${d} g`;
  const mo = Math.round(d / 30);
  if (mo < 12) return `${mo} ${mo === 1 ? "mese" : "mesi"}`;
  return `${Math.round(d / 365)} a`;
}
