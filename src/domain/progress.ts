/**
 * Contratti dei dati personali dell'utente: stato degli argomenti,
 * interazioni con i contenuti, stato di ripasso e storico delle revisioni.
 * Tutti i timestamp sono stringhe ISO 8601 in UTC.
 */
import { z } from "zod";
import type { CardId } from "./content";

/** Stato di un argomento dichiarato dall'utente (segue il corso esterno). */
export const TOPIC_STATUSES = ["not_started", "studying", "studied", "consolidating", "mastered"] as const;
export const TopicStatusSchema = z.enum(TOPIC_STATUSES);
export type TopicStatus = z.infer<typeof TopicStatusSchema>;

export const TOPIC_STATUS_LABELS: Record<TopicStatus, string> = {
  not_started: "Non ancora affrontato",
  studying: "In studio",
  studied: "Studiato",
  consolidating: "Da consolidare",
  mastered: "Padroneggiato",
};

/**
 * Valutazione di una revisione. Corrispondenza con FSRS:
 * again → Rating.Again, hard → Rating.Hard, good → Rating.Good, easy → Rating.Easy.
 */
export const RATINGS = ["again", "hard", "good", "easy"] as const;
export const RatingSchema = z.enum(RATINGS);
export type ReviewRating = z.infer<typeof RatingSchema>;

export const RATING_LABELS: Record<ReviewRating, string> = {
  again: "Da ristudiare",
  hard: "Difficile",
  good: "Compreso",
  easy: "Padroneggiato",
};

/**
 * Segnale di lettura informale su un contenuto (NON è una revisione FSRS).
 * "difficult" porta il contenuto nel consolidamento; "understood" lo allontana.
 */
export const ReadSignalSchema = z.enum(["difficult", "understood"]);
export type ReadSignal = z.infer<typeof ReadSignalSchema>;

export interface TopicProgress {
  topicId: string;
  status: TopicStatus;
  updatedAt: string;
}

export interface ContentProgress {
  contentId: string;
  firstSeenAt?: string;
  lastSeenAt?: string;
  /** Quante volte il contenuto è comparso nel feed ed è stato visualizzato. */
  seenCount: number;
  /** Quante volte è stato aperto per intero. */
  openCount: number;
  saved: boolean;
  hidden: boolean;
  signal?: ReadSignal;
  updatedAt: string;
}

/** Stati FSRS: 0 New, 1 Learning, 2 Review, 3 Relearning. */
export type CardState = 0 | 1 | 2 | 3;

export interface ReviewState {
  cardId: CardId;
  due: string;
  stability: number;
  difficulty: number;
  scheduledDays: number;
  learningSteps: number;
  reps: number;
  lapses: number;
  state: CardState;
  lastReview?: string;
  /** Revisione del contenuto al momento dell'ultima valutazione (per segnalare aggiornamenti). */
  contentRevision: number;
  /** Contatore per il controllo di concorrenza ottimistico. */
  version: number;
  updatedAt: string;
}

/** Evento immutabile (append-only). L'id è generato dal client: rende idempotente il salvataggio. */
export interface ReviewEvent {
  id: string;
  cardId: CardId;
  rating: ReviewRating;
  reviewedAt: string;
  stateBefore: CardState;
  dueBefore?: string;
  dueAfter: string;
  stabilityAfter: number;
  difficultyAfter: number;
  scheduledDays: number;
  /** Giorni trascorsi dall'ultima revisione (0 se prima revisione). Negativi impossibili. */
  elapsedDays: number;
}

export interface UserPreferences {
  theme: "system" | "light" | "dark";
  /** Fuso orario IANA usato per i confini di giornata, es. "Europe/Rome". */
  timeZone: string;
  /** Lingue di contenuto mostrate nel feed. */
  languages: ("it" | "en")[];
}

export const DEFAULT_PREFERENCES: UserPreferences = {
  theme: "system",
  timeZone: "Europe/Rome",
  languages: ["it", "en"],
};

/** Istantanea completa dei dati personali: usata da store locale, export e backup. */
export interface UserSnapshot {
  topics: Record<string, TopicProgress>;
  content: Record<string, ContentProgress>;
  reviews: Record<CardId, ReviewState>;
  events: ReviewEvent[];
  preferences: UserPreferences;
}

export const emptySnapshot = (): UserSnapshot => ({
  topics: {},
  content: {},
  reviews: {},
  events: [],
  preferences: { ...DEFAULT_PREFERENCES },
});
