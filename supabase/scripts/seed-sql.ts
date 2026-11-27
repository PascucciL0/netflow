/**
 * Generatore del seed SQL a partire dai dati versionati in content/ (unica fonte di verità).
 *
 * - Id deterministici (UUID v5): rigenerare e riapplicare il seed non cambia gli id,
 *   quindi i progressi e i ripassi degli utenti restano collegati ai contenuti.
 * - Idempotente: ogni istruzione è un upsert; le tabelle figlie dei contenuti di sistema
 *   vengono riscritte, le domande di recall aggiornate per (content_id, key).
 * - Una domanda di recall rimossa dal repository viene cancellata (e con lei i relativi ripassi):
 *   per non perdere progressi, le chiavi di recall non vanno mai rinominate (docs/IMPORT_FORMAT.md).
 *
 * Uso: npm run db:seed  →  scrive supabase/seed.sql
 */
import { createHash } from "node:crypto";
import type { Blueprint, Track } from "@/domain/catalog";
import type { ContentItem } from "@/domain/content";

/** Namespace fisso di NetFlow per gli UUID v5. Non cambiarlo: cambierebbero tutti gli id. */
export const NETFLOW_NAMESPACE = "6f1c2b9e-4f7a-5d3e-9c1b-2a8e7d4c6b10";

export function uuidV5(name: string, namespace: string = NETFLOW_NAMESPACE): string {
  const ns = Buffer.from(namespace.replace(/-/g, ""), "hex");
  const hash = createHash("sha1").update(Buffer.concat([ns, Buffer.from(name, "utf8")])).digest();
  const b = Buffer.from(hash.subarray(0, 16));
  b[6] = (b[6] & 0x0f) | 0x50;
  b[8] = (b[8] & 0x3f) | 0x80;
  const h = b.toString("hex");
  return `${h.slice(0, 8)}-${h.slice(8, 12)}-${h.slice(12, 16)}-${h.slice(16, 20)}-${h.slice(20)}`;
}

export const systemContentUuid = (slug: string) => uuidV5(`content:${slug}`);
export const systemRecallUuid = (slug: string, key: string) => uuidV5(`recall:${slug}#${key}`);

/** Letterale SQL sicuro: apici raddoppiati (standard_conforming_strings è attivo su PostgreSQL ≥ 9.1). */
export const lit = (v: string | number | boolean | null | undefined): string => {
  if (v === null || v === undefined) return "null";
  if (typeof v === "number") {
    if (!Number.isFinite(v)) throw new Error(`Numero non valido nel seed: ${v}`);
    return String(v);
  }
  if (typeof v === "boolean") return v ? "true" : "false";
  if (v.includes("\u0000")) throw new Error("Carattere NUL non ammesso nel seed");
  return `'${v.replace(/'/g, "''")}'`;
};
const arr = (xs: string[]) => (xs.length ? `array[${xs.map(lit).join(", ")}]::text[]` : "'{}'::text[]");
const jsonb = (v: unknown) => `${lit(JSON.stringify(v))}::jsonb`;
const values = (rows: string[][]) => rows.map((r) => `  (${r.join(", ")})`).join(",\n");

export interface SeedInput {
  blueprint: Blueprint;
  tracks: Track[];
  items: ContentItem[];
}

export function buildSeedSql({ blueprint, tracks, items }: SeedInput): string {
  const out: string[] = [];
  const push = (sql: string) => out.push(sql.trim() + "\n");

  out.push(`-- GENERATO da supabase/scripts/generate-seed.ts: non modificare a mano.\n-- Rigenera con: npm run db:seed\n`);
  push("begin;");

  // ── obiettivi ufficiali del blueprint
  const objectives = blueprint.domains.flatMap((d) => d.objectives.map((o) => [lit(o.id), lit(blueprint.id), lit(o.code), lit(d.code), lit(o.title)]));
  if (objectives.length)
    push(`insert into public.blueprint_objectives (id, blueprint_id, code, domain_code, title) values\n${values(objectives)}
on conflict (id) do update set blueprint_id = excluded.blueprint_id, code = excluded.code, domain_code = excluded.domain_code, title = excluded.title;`);

  // ── percorso, moduli, argomenti
  const trackRows = tracks.map((t, i) => [lit(t.id), lit(t.title), lit(t.summary), lit(t.blueprintId ?? null), lit(i)]);
  push(`insert into public.learning_tracks (id, title, summary, blueprint_id, position) values\n${values(trackRows)}
on conflict (id) do update set title = excluded.title, summary = excluded.summary, blueprint_id = excluded.blueprint_id, position = excluded.position;`);

  const moduleRows = tracks.flatMap((t) => t.modules.map((m, i) => [lit(m.id), lit(t.id), lit(m.title), lit(m.summary), lit(i)]));
  push(`insert into public.modules (id, track_id, title, summary, position) values\n${values(moduleRows)}
on conflict (id) do update set track_id = excluded.track_id, title = excluded.title, summary = excluded.summary, position = excluded.position;`);

  const topics = tracks.flatMap((t) => t.modules.flatMap((m) => m.topics.map((topic, i) => ({ topic, moduleId: m.id, position: i }))));
  push(`insert into public.topics (id, module_id, title, summary, position) values\n${values(topics.map(({ topic, moduleId, position }) => [lit(topic.id), lit(moduleId), lit(topic.title), lit(topic.summary), lit(position)]))}
on conflict (id) do update set module_id = excluded.module_id, title = excluded.title, summary = excluded.summary, position = excluded.position;`);

  const topicIds = topics.map(({ topic }) => lit(topic.id)).join(", ");
  push(`delete from public.topic_prerequisites where topic_id in (${topicIds});`);
  const prereqs = topics.flatMap(({ topic }) => topic.prerequisites.map((p) => [lit(topic.id), lit(p)]));
  if (prereqs.length) push(`insert into public.topic_prerequisites (topic_id, prerequisite_id) values\n${values(prereqs)};`);
  push(`delete from public.topic_objectives where topic_id in (${topicIds});`);
  const topicObjectives = topics.flatMap(({ topic }) => topic.objectives.map((o) => [lit(topic.id), lit(o)]));
  if (topicObjectives.length) push(`insert into public.topic_objectives (topic_id, objective_id) values\n${values(topicObjectives)};`);

  // ── contenuti di sistema (owner_id null)
  if (items.length) {
    const rows = items.map((it) => [
      lit(systemContentUuid(it.id)), "null", lit(it.id), lit(it.revision), lit(it.kind), lit(it.language), lit(it.title), lit(it.summary), lit(it.body),
      lit(it.trackId), lit(it.topicId), lit(it.subtopic ?? null), lit(it.difficulty), lit(it.readingMinutes), lit(it.provenance), lit(it.reviewStatus),
      arr(it.tags), jsonb(it.diagrams), lit(it.createdAt), lit(it.updatedAt),
    ]);
    push(`insert into public.content_items (id, owner_id, slug, revision, kind, language, title, summary, body, track_id, topic_id, subtopic,
  difficulty, reading_minutes, provenance, review_status, tags, diagrams, created_on, updated_on) values\n${values(rows)}
on conflict (id) do update set slug = excluded.slug, revision = excluded.revision, kind = excluded.kind, language = excluded.language,
  title = excluded.title, summary = excluded.summary, body = excluded.body, track_id = excluded.track_id, topic_id = excluded.topic_id,
  subtopic = excluded.subtopic, difficulty = excluded.difficulty, reading_minutes = excluded.reading_minutes, provenance = excluded.provenance,
  review_status = excluded.review_status, tags = excluded.tags, diagrams = excluded.diagrams, created_on = excluded.created_on, updated_on = excluded.updated_on;`);

    const ids = items.map((it) => lit(systemContentUuid(it.id))).join(", ");
    for (const table of ["content_objectives", "content_prerequisites", "content_sources", "content_relations"])
      push(`delete from public.${table} where content_id in (${ids});`);

    const cobj = items.flatMap((it) => it.objectives.map((o) => [lit(systemContentUuid(it.id)), lit(o)]));
    if (cobj.length) push(`insert into public.content_objectives (content_id, objective_id) values\n${values(cobj)};`);
    const cpre = items.flatMap((it) => it.prerequisites.map((p) => [lit(systemContentUuid(it.id)), lit(p)]));
    if (cpre.length) push(`insert into public.content_prerequisites (content_id, topic_id) values\n${values(cpre)};`);
    const csrc = items.flatMap((it) =>
      it.sources.map((s, i) => [lit(systemContentUuid(it.id)), lit(i), lit(s.title), lit(s.url ?? null), lit(s.publisher), lit(s.type), lit(s.verifiedOn ?? null)]),
    );
    if (csrc.length) push(`insert into public.content_sources (content_id, position, title, url, publisher, source_type, verified_on) values\n${values(csrc)};`);
    const known = new Set(items.map((it) => it.id));
    const crel = items.flatMap((it) => it.related.filter((r) => known.has(r)).map((r) => [lit(systemContentUuid(it.id)), lit(systemContentUuid(r))]));
    if (crel.length) push(`insert into public.content_relations (content_id, related_id) values\n${values(crel)};`);

    // domande di recall: upsert per id deterministico, poi rimozione delle chiavi non più presenti
    const recall = items.flatMap((it) =>
      it.recall.map((r, i) => [
        lit(systemRecallUuid(it.id, r.key)), lit(systemContentUuid(it.id)), lit(r.key), lit(i), lit(r.prompt), lit(r.answer), arr(r.keyPoints), arr(r.commonMistakes),
      ]),
    );
    if (recall.length)
      push(`insert into public.recall_prompts (id, content_id, key, position, prompt, answer, key_points, common_mistakes) values\n${values(recall)}
on conflict (id) do update set position = excluded.position, prompt = excluded.prompt, answer = excluded.answer,
  key_points = excluded.key_points, common_mistakes = excluded.common_mistakes;`);
    const keep = items.flatMap((it) => it.recall.map((r) => lit(systemRecallUuid(it.id, r.key))));
    push(`delete from public.recall_prompts where content_id in (${ids})${keep.length ? ` and id not in (${keep.join(", ")})` : ""};`);
  }

  push("commit;");
  return out.join("\n");
}
