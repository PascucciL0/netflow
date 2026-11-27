/**
 * Learning Engine — costruzione del feed.
 *
 * Deterministico: stesso input ⇒ stesso output. Nessuna casualità, nessuna AI.
 * La "varietà" giornaliera deriva da un hash stabile di (giorno, id), non da Math.random.
 * Algoritmo documentato in docs/adr/0005-feed-ranking.md.
 */
import { cardIdOf, type CardId, type ContentItem } from "@/domain/content";
import type { TopicNode } from "@/domain/catalog";
import type { ContentProgress, TopicStatus, UserSnapshot } from "@/domain/progress";
import { isDue } from "./scheduler";

export type FeedReason = "due_review" | "consolidate" | "studying" | "new" | "explore";

export const FEED_REASON_LABELS: Record<FeedReason, string> = {
  due_review: "Ripasso in scadenza",
  consolidate: "Da consolidare",
  studying: "In studio",
  new: "Prossimo passo",
  explore: "Esplora",
};

export interface FeedEntry {
  /** Chiave univoca nel feed. */
  key: string;
  type: "content" | "recall";
  item: ContentItem;
  /** Presente se type === "recall". */
  cardId?: CardId;
  recallKey?: string;
  reason: FeedReason;
}

export type BucketName = "review" | "studying" | "new";

/** Pesi indicativi (requisito: 50% consolidamento, 30% in studio, 15% nuovi, 5% news). */
export const DEFAULT_MIX: Record<BucketName, number> = { review: 50, studying: 30, new: 15 };

export interface FeedInput {
  now: Date;
  items: ContentItem[];
  topics: TopicNode[];
  snapshot: UserSnapshot;
  /** Giorno locale dell'utente (YYYY-MM-DD), per la rotazione stabile. */
  dayKey: string;
  limit?: number;
  mix?: Record<BucketName, number>;
}

export interface FeedResult {
  entries: FeedEntry[];
  coldStart: boolean;
  /** Dimensione dei bucket prima dell'interleaving (utile per test e trasparenza). */
  bucketSizes: Record<BucketName | "explore", number>;
}

const HOUR = 3_600_000;
/** Un contenuto già visto non torna nel feed prima di questo intervallo (salvo ripasso dovuto). */
export const RESURFACE_AFTER_MS = 12 * HOUR;
/** Un contenuto "da consolidare" torna dopo almeno un giorno. */
export const CONSOLIDATE_AFTER_MS = 24 * HOUR;

/** FNV-1a 32 bit: hash stabile per i pareggi. */
export function stableHash(s: string): number {
  let h = 0x811c9dc5;
  for (let i = 0; i < s.length; i++) {
    h ^= s.charCodeAt(i);
    h = Math.imul(h, 0x01000193);
  }
  return h >>> 0;
}

const ACTIVE_STATUSES: ReadonlySet<TopicStatus> = new Set(["studying", "studied", "consolidating", "mastered"]);

export function buildFeed(input: FeedInput): FeedResult {
  const { now, items, topics, snapshot, dayKey } = input;
  const limit = input.limit ?? 30;
  const mix = input.mix ?? DEFAULT_MIX;
  const nowMs = now.getTime();

  const topicById = new Map(topics.map((t) => [t.id, t]));
  const status = (topicId: string): TopicStatus => snapshot.topics[topicId]?.status ?? "not_started";
  const progress = (id: string): ContentProgress | undefined => snapshot.content[id];
  const seenWithin = (id: string, ms: number): boolean => {
    const last = progress(id)?.lastSeenAt;
    return last !== undefined && nowMs - new Date(last).getTime() < ms;
  };
  const tie = (id: string) => stableHash(`${dayKey}:${id}`);
  const topicOrder = (id: string) => topicById.get(id)?.order ?? Number.MAX_SAFE_INTEGER;

  const langs = new Set(snapshot.preferences.languages);
  const visible = items.filter((it) => !progress(it.id)?.hidden && langs.has(it.language));

  const anyTopicActive = Object.values(snapshot.topics).some((t) => t.status !== "not_started");
  const anyReview = Object.keys(snapshot.reviews).length > 0;
  const coldStart = !anyTopicActive && !anyReview;

  /** Un argomento è "di frontiera" se non iniziato e con tutti i prerequisiti attivi (o senza prerequisiti). */
  const isFrontier = (topicId: string): boolean => {
    const t = topicById.get(topicId);
    if (!t || status(topicId) !== "not_started") return false;
    return t.prerequisites.every((p) => ACTIVE_STATUSES.has(status(p)));
  };

  const byCurriculum = (a: ContentItem, b: ContentItem) =>
    topicOrder(a.topicId) - topicOrder(b.topicId) || a.difficulty - b.difficulty || tie(a.id) - tie(b.id);
  const byLeastRecent = (a: ContentItem, b: ContentItem) =>
    (progress(a.id)?.lastSeenAt ?? "").localeCompare(progress(b.id)?.lastSeenAt ?? "") || tie(a.id) - tie(b.id);

  // ── Bucket "review": carte dovute (ordinate per ritardo relativo), poi contenuti da consolidare.
  const due: { entry: FeedEntry; overdue: number }[] = [];
  for (const it of visible)
    for (const r of it.recall) {
      const cardId = cardIdOf(it.id, r.key);
      const st = snapshot.reviews[cardId];
      if (st && isDue(st, now)) {
        const late = nowMs - new Date(st.due).getTime();
        const overdue = late / Math.max(HOUR, st.scheduledDays * 24 * HOUR);
        due.push({ entry: { key: `r:${cardId}`, type: "recall", item: it, cardId, recallKey: r.key, reason: "due_review" }, overdue });
      }
    }
  due.sort((a, b) => b.overdue - a.overdue || a.entry.key.localeCompare(b.entry.key));

  const consolidate = visible
    .filter((it) => {
      const p = progress(it.id);
      const flagged = p?.signal === "difficult" || status(it.topicId) === "consolidating";
      return flagged && !seenWithin(it.id, CONSOLIDATE_AFTER_MS);
    })
    .sort(byLeastRecent)
    .map((it): FeedEntry => ({ key: `c:${it.id}`, type: "content", item: it, reason: "consolidate" }));

  const review = [...due.map((d) => d.entry), ...consolidate];

  // ── Bucket "studying": contenuti degli argomenti in studio (prima i non visti), poi nuove carte di recall
  //    per contenuti già letti in argomenti attivi (la lettura viene trasformata in studio attivo, non il contrario).
  const studyingItems = visible.filter((it) => status(it.topicId) === "studying" && !seenWithin(it.id, RESURFACE_AFTER_MS));
  const unseen = studyingItems.filter((it) => !progress(it.id)?.lastSeenAt).sort(byCurriculum);
  const seenAgain = studyingItems.filter((it) => progress(it.id)?.lastSeenAt).sort(byLeastRecent);
  const newCards: FeedEntry[] = [];
  for (const it of [...visible].sort(byCurriculum)) {
    if (!ACTIVE_STATUSES.has(status(it.topicId))) continue;
    const readFirst = it.kind !== "recall" && it.kind !== "flashcard";
    if (readFirst && !progress(it.id)?.lastSeenAt) continue;
    for (const r of it.recall) {
      const cardId = cardIdOf(it.id, r.key);
      const st = snapshot.reviews[cardId];
      if (!st || st.reps === 0) newCards.push({ key: `r:${cardId}`, type: "recall", item: it, cardId, recallKey: r.key, reason: "studying" });
    }
  }
  const studying = [
    ...unseen.map((it): FeedEntry => ({ key: `c:${it.id}`, type: "content", item: it, reason: "studying" })),
    ...interleaveTwo(newCards, seenAgain.map((it): FeedEntry => ({ key: `c:${it.id}`, type: "content", item: it, reason: "studying" }))),
  ];

  // ── Bucket "new": argomenti di frontiera (prerequisiti soddisfatti). In cold start: argomenti senza prerequisiti.
  const fresh = visible
    .filter((it) => !progress(it.id)?.lastSeenAt && isFrontier(it.topicId))
    .sort(byCurriculum)
    .map((it): FeedEntry => ({ key: `c:${it.id}`, type: "content", item: it, reason: "new" }));

  // ── Fallback "explore": tutto il resto non visto di recente, dal meno recente.
  const explore = visible
    .filter((it) => !seenWithin(it.id, RESURFACE_AFTER_MS))
    .sort((a, b) => {
      const sa = progress(a.id)?.lastSeenAt ? 1 : 0;
      const sb = progress(b.id)?.lastSeenAt ? 1 : 0;
      // prima i non visti con prerequisiti più "vicini", poi i visti meno recenti
      return sa - sb || (sa === 0 ? byCurriculum(a, b) : byLeastRecent(a, b));
    })
    .map((it): FeedEntry => ({ key: `c:${it.id}`, type: "content", item: it, reason: "explore" }));

  const entries = interleave(
    [
      { name: "review", weight: mix.review, queue: review },
      { name: "studying", weight: mix.studying, queue: studying },
      { name: "new", weight: mix.new, queue: fresh },
    ],
    explore,
    limit,
  );

  return {
    entries,
    coldStart,
    bucketSizes: { review: review.length, studying: studying.length, new: fresh.length, explore: explore.length },
  };
}

function interleaveTwo<T>(a: T[], b: T[]): T[] {
  const out: T[] = [];
  for (let i = 0; i < Math.max(a.length, b.length); i++) {
    if (i < a.length) out.push(a[i]);
    if (i < b.length) out.push(b[i]);
  }
  return out;
}

interface Bucket {
  name: BucketName;
  weight: number;
  queue: FeedEntry[];
}

/** Quanti candidati guardare avanti per rispettare i vincoli di varietà. */
const LOOKAHEAD = 6;

/**
 * Smooth weighted round-robin tra i bucket non vuoti, con vincoli di varietà:
 * - mai lo stesso argomento due volte di fila (se evitabile);
 * - mai lo stesso tipo di contenuto tre volte di fila (se evitabile);
 * - ogni contenuto compare al massimo una volta (come lettura o come recall).
 * Quando i bucket si esauriscono, il feed prosegue con "explore".
 */
export function interleave(buckets: Bucket[], fallback: FeedEntry[], limit: number): FeedEntry[] {
  const out: FeedEntry[] = [];
  const used = new Set<string>();
  const queues = buckets.filter((b) => b.weight > 0).map((b) => ({ ...b, queue: [...b.queue], current: 0 }));
  const fb = [...fallback];

  const okVariety = (e: FeedEntry): boolean => {
    const prev = out[out.length - 1];
    const prev2 = out[out.length - 2];
    if (prev && prev.item.topicId === e.item.topicId) return false;
    if (prev && prev2 && prev.item.kind === e.item.kind && prev2.item.kind === e.item.kind) return false;
    return true;
  };

  const take = (q: FeedEntry[]): FeedEntry | undefined => {
    // scarta i contenuti già usati
    for (let i = q.length - 1; i >= 0; i--) if (used.has(q[i].item.id)) q.splice(i, 1);
    if (q.length === 0) return undefined;
    const idx = q.slice(0, LOOKAHEAD).findIndex(okVariety);
    const [e] = q.splice(idx === -1 ? 0 : idx, 1);
    return e;
  };

  while (out.length < limit) {
    const active = queues.filter((b) => {
      for (let i = b.queue.length - 1; i >= 0; i--) if (used.has(b.queue[i].item.id)) b.queue.splice(i, 1);
      return b.queue.length > 0;
    });
    let picked: FeedEntry | undefined;
    if (active.length > 0) {
      const total = active.reduce((s, b) => s + b.weight, 0);
      for (const b of active) b.current += b.weight;
      const best = active.reduce((a, b) => (b.current > a.current ? b : a));
      best.current -= total;
      picked = take(best.queue);
    } else {
      picked = take(fb);
    }
    if (!picked) break;
    used.add(picked.item.id);
    out.push(picked);
  }
  return out;
}
