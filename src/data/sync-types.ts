/**
 * Tipi e funzioni pure della sincronizzazione con Supabase.
 * - ContentMap: corrispondenza tra id leggibili del client (slug, "slug#key") e uuid del database;
 * - righe del database ⇄ UserSnapshot;
 * - SyncOp: operazione da inviare al server, derivata da una Mutation già applicata dal reducer.
 * Nessun I/O: testabile senza rete.
 */
import { cardIdOf, parseCardId, type CardId } from "@/domain/content";
import type { Mutation } from "@/domain/mutations";
import type {
  CardState,
  ContentProgress,
  ReviewEvent,
  ReviewRating,
  ReviewState,
  TopicProgress,
  TopicStatus,
  UserPreferences,
  UserSnapshot,
} from "@/domain/progress";
import { DEFAULT_PREFERENCES, emptySnapshot } from "@/domain/progress";

// ─────────────────────────────────────────────────────────────── mappa degli id
export interface ContentRow {
  id: string;
  slug: string;
  owner_id: string | null;
}
export interface RecallRow {
  id: string;
  content_id: string;
  key: string;
}

export interface ContentMap {
  slugByContentUuid: Map<string, string>;
  contentUuidBySlug: Map<string, string>;
  cardIdByRecallUuid: Map<string, CardId>;
  recallUuidByCardId: Map<CardId, string>;
}

/** Se uno slug esiste sia come contenuto di sistema sia come contenuto importato, vince quello dell'utente. */
export function buildContentMap(contents: ContentRow[], recalls: RecallRow[]): ContentMap {
  const slugByContentUuid = new Map<string, string>();
  const contentUuidBySlug = new Map<string, string>();
  const owned = new Set<string>();
  for (const c of contents) {
    slugByContentUuid.set(c.id, c.slug);
    if (c.owner_id) owned.add(c.slug);
  }
  for (const c of contents) if (c.owner_id || !owned.has(c.slug)) contentUuidBySlug.set(c.slug, c.id);
  const cardIdByRecallUuid = new Map<string, CardId>();
  const recallUuidByCardId = new Map<CardId, string>();
  for (const r of recalls) {
    const slug = slugByContentUuid.get(r.content_id);
    if (!slug) continue;
    const cardId = cardIdOf(slug, r.key);
    cardIdByRecallUuid.set(r.id, cardId);
    if (contentUuidBySlug.get(slug) === r.content_id) recallUuidByCardId.set(cardId, r.id);
  }
  return { slugByContentUuid, contentUuidBySlug, cardIdByRecallUuid, recallUuidByCardId };
}

// ─────────────────────────────────────────────────────────────── righe del database
export interface TopicProgressRow {
  topic_id: string;
  status: TopicStatus;
  updated_at: string;
}
export interface ContentProgressRow {
  content_id: string;
  first_seen_at: string | null;
  last_seen_at: string | null;
  seen_count: number;
  open_count: number;
  saved: boolean;
  hidden: boolean;
  signal: "difficult" | "understood" | null;
  updated_at: string;
}
export interface ReviewStateRow {
  recall_id: string;
  due: string;
  stability: number;
  difficulty: number;
  scheduled_days: number;
  learning_steps: number;
  reps: number;
  lapses: number;
  state: number;
  last_review: string | null;
  content_revision: number;
  version: number;
  updated_at?: string;
}
export interface ReviewEventRow {
  id: string;
  recall_id: string;
  rating: ReviewRating;
  reviewed_at: string;
  state_before: number;
  due_before: string | null;
  due_after: string;
  stability_after: number;
  difficulty_after: number;
  scheduled_days: number;
  elapsed_days: number;
}
export interface PreferencesRow {
  theme: UserPreferences["theme"];
  time_zone: string;
  languages: string[];
}

export interface ProgressRows {
  topics: TopicProgressRow[];
  content: ContentProgressRow[];
  states: ReviewStateRow[];
  events: ReviewEventRow[];
  preferences: PreferencesRow | null;
}

/** PostgreSQL restituisce i timestamp come "2026-11-27 10:00:00+00": li normalizziamo in ISO UTC. */
const iso = (v: string): string => new Date(v).toISOString();
const isoOpt = (v: string | null | undefined): string | undefined => (v ? iso(v) : undefined);
const asCardState = (n: number): CardState => (n === 1 || n === 2 || n === 3 ? n : 0);

export function rowsToSnapshot(rows: ProgressRows, map: ContentMap): UserSnapshot {
  const s = emptySnapshot();
  for (const t of rows.topics) s.topics[t.topic_id] = { topicId: t.topic_id, status: t.status, updatedAt: iso(t.updated_at) };
  for (const c of rows.content) {
    const slug = map.slugByContentUuid.get(c.content_id);
    if (!slug) continue;
    s.content[slug] = {
      contentId: slug,
      firstSeenAt: isoOpt(c.first_seen_at),
      lastSeenAt: isoOpt(c.last_seen_at),
      seenCount: c.seen_count,
      openCount: c.open_count,
      saved: c.saved,
      hidden: c.hidden,
      signal: c.signal ?? undefined,
      updatedAt: iso(c.updated_at),
    };
  }
  for (const r of rows.states) {
    const cardId = map.cardIdByRecallUuid.get(r.recall_id);
    if (!cardId) continue;
    s.reviews[cardId] = {
      cardId,
      due: iso(r.due),
      stability: r.stability,
      difficulty: r.difficulty,
      scheduledDays: r.scheduled_days,
      learningSteps: r.learning_steps,
      reps: r.reps,
      lapses: r.lapses,
      state: asCardState(r.state),
      lastReview: isoOpt(r.last_review),
      contentRevision: r.content_revision,
      version: r.version,
      updatedAt: r.updated_at ? iso(r.updated_at) : iso(r.due),
    };
  }
  s.events = rows.events
    .flatMap((e): ReviewEvent[] => {
      const cardId = map.cardIdByRecallUuid.get(e.recall_id);
      if (!cardId) return [];
      return [
        {
          id: e.id,
          cardId,
          rating: e.rating,
          reviewedAt: iso(e.reviewed_at),
          stateBefore: asCardState(e.state_before),
          dueBefore: isoOpt(e.due_before),
          dueAfter: iso(e.due_after),
          stabilityAfter: e.stability_after,
          difficultyAfter: e.difficulty_after,
          scheduledDays: e.scheduled_days,
          elapsedDays: e.elapsed_days,
        },
      ];
    })
    .sort((a, b) => a.reviewedAt.localeCompare(b.reviewedAt) || a.id.localeCompare(b.id));
  if (rows.preferences) {
    const langs = rows.preferences.languages.filter((l): l is "it" | "en" => l === "it" || l === "en");
    s.preferences = {
      theme: rows.preferences.theme,
      timeZone: rows.preferences.time_zone,
      languages: langs.length ? langs : [...DEFAULT_PREFERENCES.languages],
    };
  }
  return s;
}

export const isSnapshotEmpty = (s: UserSnapshot): boolean =>
  Object.keys(s.topics).length === 0 && Object.keys(s.content).length === 0 && Object.keys(s.reviews).length === 0 && s.events.length === 0;

// ─────────────────────────────────────────────────────────────── snapshot → righe
export const topicRow = (t: TopicProgress): TopicProgressRow => ({ topic_id: t.topicId, status: t.status, updated_at: t.updatedAt });

export const contentRow = (c: ContentProgress, contentUuid: string): ContentProgressRow => ({
  content_id: contentUuid,
  first_seen_at: c.firstSeenAt ?? null,
  last_seen_at: c.lastSeenAt ?? null,
  seen_count: c.seenCount,
  open_count: c.openCount,
  saved: c.saved,
  hidden: c.hidden,
  signal: c.signal ?? null,
  updated_at: c.updatedAt,
});

export const stateRow = (r: ReviewState, recallUuid: string): ReviewStateRow => ({
  recall_id: recallUuid,
  due: r.due,
  stability: r.stability,
  difficulty: r.difficulty,
  scheduled_days: r.scheduledDays,
  learning_steps: r.learningSteps,
  reps: r.reps,
  lapses: r.lapses,
  state: r.state,
  last_review: r.lastReview ?? null,
  content_revision: r.contentRevision,
  version: r.version,
});

export const eventRow = (e: ReviewEvent, recallUuid: string): ReviewEventRow => ({
  id: e.id,
  recall_id: recallUuid,
  rating: e.rating,
  reviewed_at: e.reviewedAt,
  state_before: e.stateBefore,
  due_before: e.dueBefore ?? null,
  due_after: e.dueAfter,
  stability_after: e.stabilityAfter,
  difficulty_after: e.difficultyAfter,
  scheduled_days: e.scheduledDays,
  elapsed_days: e.elapsedDays,
});

export const preferencesRow = (p: UserPreferences): PreferencesRow => ({ theme: p.theme, time_zone: p.timeZone, languages: [...p.languages] });

export interface ImportPayload extends ProgressRows {
  /** Elementi che non hanno un corrispondente nel database (contenuti non presenti sul server). */
  unmapped: number;
}

/** Payload per import_progress(). Gli elementi senza corrispondenza nel database vengono contati e scartati. */
export function snapshotToImportPayload(s: UserSnapshot, map: ContentMap): ImportPayload {
  let unmapped = 0;
  const content: ContentProgressRow[] = [];
  for (const c of Object.values(s.content)) {
    const id = map.contentUuidBySlug.get(c.contentId);
    if (id) content.push(contentRow(c, id));
    else unmapped++;
  }
  const states: ReviewStateRow[] = [];
  for (const r of Object.values(s.reviews)) {
    const id = map.recallUuidByCardId.get(r.cardId);
    if (id) states.push(stateRow(r, id));
    else unmapped++;
  }
  const events: ReviewEventRow[] = [];
  for (const e of s.events) {
    const id = map.recallUuidByCardId.get(e.cardId);
    if (id) events.push(eventRow(e, id));
    else unmapped++;
  }
  return { topics: Object.values(s.topics).map(topicRow), content, states, events, preferences: preferencesRow(s.preferences), unmapped };
}

// ─────────────────────────────────────────────────────────────── operazioni di sincronizzazione
/**
 * Ogni operazione porta lo stato COMPLETO dell'entità dopo la mutazione (non un delta):
 * reinviarla è innocuo (idempotenza) e due operazioni sulla stessa entità si possono fondere.
 */
export type SyncOp =
  | { kind: "topic"; topic: TopicProgress }
  | { kind: "content"; content: ContentProgress }
  | { kind: "review"; state: ReviewState; event: ReviewEvent; expectedVersion: number }
  | { kind: "reset"; state: ReviewState; expectedVersion: number }
  | { kind: "preferences"; preferences: UserPreferences }
  | { kind: "import"; snapshot: UserSnapshot; replace: boolean };

/** Chiave di fusione: un'operazione più recente con la stessa chiave sostituisce quella in coda. */
export function opKey(op: SyncOp): string | null {
  switch (op.kind) {
    case "topic":
      return `t:${op.topic.topicId}`;
    case "content":
      return `c:${op.content.contentId}`;
    case "preferences":
      return "p";
    default:
      return null;
  }
}

export function opFromMutation(m: Mutation, before: UserSnapshot, after: UserSnapshot): SyncOp | null {
  switch (m.type) {
    case "content/seen":
    case "content/opened":
    case "content/save":
    case "content/hide":
    case "content/signal": {
      const c = after.content[m.contentId];
      return c ? { kind: "content", content: c } : null;
    }
    case "topic/status": {
      const t = after.topics[m.topicId];
      return t ? { kind: "topic", topic: t } : null;
    }
    case "review/record": {
      const state = after.reviews[m.cardId];
      const event = after.events.find((e) => e.id === m.eventId);
      return state && event ? { kind: "review", state, event, expectedVersion: m.expectedVersion } : null;
    }
    case "review/reset": {
      const prev = before.reviews[m.cardId];
      const state = after.reviews[m.cardId];
      return prev && state ? { kind: "reset", state, expectedVersion: prev.version } : null;
    }
    case "preferences/update":
      return { kind: "preferences", preferences: after.preferences };
  }
}

/** Applica a uno snapshot (quello del server) le operazioni ancora in coda: la UI non "torna indietro". */
export function applyPendingOps(s: UserSnapshot, ops: SyncOp[]): UserSnapshot {
  let out = s;
  for (const op of ops) {
    switch (op.kind) {
      case "topic":
        out = { ...out, topics: { ...out.topics, [op.topic.topicId]: op.topic } };
        break;
      case "content":
        out = { ...out, content: { ...out.content, [op.content.contentId]: op.content } };
        break;
      case "review":
        out = {
          ...out,
          reviews: { ...out.reviews, [op.state.cardId]: op.state },
          events: out.events.some((e) => e.id === op.event.id) ? out.events : [...out.events, op.event],
        };
        break;
      case "reset":
        out = { ...out, reviews: { ...out.reviews, [op.state.cardId]: op.state } };
        break;
      case "preferences":
        out = { ...out, preferences: op.preferences };
        break;
      case "import":
        // l'esito dipende dal server: si ricarica dopo l'invio
        break;
    }
  }
  return out;
}

export const cardContentId = (cardId: CardId): string => parseCardId(cardId).contentId;
