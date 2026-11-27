/**
 * Seed generato da content/ e funzioni di sincronizzazione (reset_review_state, import_progress)
 * su PostgreSQL reale in memoria (PGlite).
 */
import type { PGlite } from "@electric-sql/pglite";
import { readFileSync } from "node:fs";
import path from "node:path";
import { beforeAll, describe, expect, it } from "vitest";
import { blueprint, seedItems, tracks } from "@/data/catalog";
import { buildSeedSql, systemContentUuid, systemRecallUuid, uuidV5 } from "../supabase/scripts/seed-sql";
import { actor, createDb, root } from "./db-helpers";

const A = "00000000-0000-0000-0000-00000000000a";
const B = "00000000-0000-0000-0000-00000000000b";
let db: PGlite;
let as: ReturnType<typeof actor>;
const q = (sql: string, params: unknown[] = []) => db.query<Record<string, unknown>>(sql, params);

const firstWithRecall = seedItems.find((i) => i.recall.length > 0)!;
const CONTENT = systemContentUuid(firstWithRecall.id);
const RECALL = systemRecallUuid(firstWithRecall.id, firstWithRecall.recall[0].key);

const review = (eventId: string, expected: number) =>
  q(
    `select public.record_review($1, $2, $3, 'good', now(), 0::smallint, null, now() + interval '1 day', 3.2, 5.1, 1, 0, 0, 1, 0, 2::smallint, 1) as r`,
    [eventId, RECALL, expected],
  );

beforeAll(async () => {
  db = await createDb({ seed: true });
  as = actor(db);
  await db.exec(`insert into auth.users values ('${A}'), ('${B}');`);
}, 60_000);

describe("seed SQL", () => {
  it("è aggiornato rispetto a content/ (rigenerare con npm run db:seed)", () => {
    const committed = readFileSync(path.join(root, "supabase/seed.sql"), "utf8");
    expect(committed).toBe(buildSeedSql({ blueprint, tracks, items: seedItems }));
  });

  it("UUID v5 conforme (vettore noto RFC 4122: DNS, www.example.com)", () => {
    expect(uuidV5("www.example.com", "6ba7b810-9dad-11d1-80b4-00c04fd430c8")).toBe("2ed6657d-e927-568b-95e1-2665a8aea6a2");
  });

  it("carica catalogo, contenuti e domande", async () => {
    const counts = await q(`select
      (select count(*)::int from public.topics) as topics,
      (select count(*)::int from public.content_items where owner_id is null) as items,
      (select count(*)::int from public.recall_prompts) as prompts,
      (select count(*)::int from public.blueprint_objectives) as objectives`);
    expect(counts.rows[0]).toEqual({
      topics: tracks.flatMap((t) => t.modules.flatMap((m) => m.topics)).length,
      items: seedItems.length,
      prompts: seedItems.reduce((n, i) => n + i.recall.length, 0),
      objectives: blueprint.domains.flatMap((d) => d.objectives).length,
    });
  });

  it("gli utenti autenticati leggono i contenuti di sistema, anon no", async () => {
    const rows = await as(A, () => q("select count(*)::int as n from public.recall_prompts"));
    expect(rows.rows[0].n).toBeGreaterThan(0);
    await expect(as(null, () => q("select * from public.recall_prompts"))).rejects.toThrow(/permission denied/);
  });

  it("riapplicare il seed è idempotente e non perde i ripassi", async () => {
    expect((await as(A, () => review("10000000-0000-0000-0000-000000000001", 0))).rows[0].r).toBe("ok");
    await db.exec(readFileSync(path.join(root, "supabase/seed.sql"), "utf8"));
    const st = await as(A, () => q("select version from public.review_states where recall_id = $1", [RECALL]));
    expect(st.rows).toEqual([{ version: 1 }]);
    const n = await q("select count(*)::int as n from public.content_items");
    expect(n.rows[0].n).toBe(seedItems.length);
  });

  it("un contenuto aggiornato (nuova revisione) mantiene id e stato di ripasso", async () => {
    const updated = seedItems.map((i) => (i.id === firstWithRecall.id ? { ...i, revision: i.revision + 1, title: "Titolo aggiornato di prova" } : i));
    await db.exec(buildSeedSql({ blueprint, tracks, items: updated }));
    const c = await q("select revision, title from public.content_items where id = $1", [CONTENT]);
    expect(c.rows[0]).toEqual({ revision: firstWithRecall.revision + 1, title: "Titolo aggiornato di prova" });
    expect((await as(A, () => q("select count(*)::int as n from public.review_states"))).rows[0].n).toBe(1);
    await db.exec(readFileSync(path.join(root, "supabase/seed.sql"), "utf8"));
  });
});

describe("reset_review_state", () => {
  it("azzera la carta incrementando la versione, con controllo di versione", async () => {
    expect((await as(A, () => q("select public.reset_review_state($1, 0, now(), 1) as r", [RECALL]))).rows[0].r).toBe("stale_version");
    expect((await as(A, () => q("select public.reset_review_state($1, 1, now(), 1) as r", [RECALL]))).rows[0].r).toBe("ok");
    const st = await as(A, () => q("select version, reps, state, stability from public.review_states where recall_id = $1", [RECALL]));
    expect(st.rows[0]).toEqual({ version: 2, reps: 0, state: 0, stability: 0 });
    // lo storico resta
    expect((await as(A, () => q("select count(*)::int as n from public.review_events"))).rows[0].n).toBe(1);
    // dopo il reset la revisione successiva usa la nuova versione
    expect((await as(A, () => review("10000000-0000-0000-0000-000000000002", 2))).rows[0].r).toBe("ok");
  });

  it("non tocca le carte di altri utenti", async () => {
    expect((await as(B, () => q("select public.reset_review_state($1, 3, now(), 1) as r", [RECALL]))).rows[0].r).toBe("not_found");
    await expect(as(null, () => q("select public.reset_review_state($1, 3, now(), 1) as r", [RECALL]))).rejects.toThrow();
  });
});

describe("import_progress", () => {
  const payload = (extra: Record<string, unknown> = {}) => ({
    topics: [
      { topic_id: firstWithRecall.topicId, status: "studying", updated_at: "2026-11-20T10:00:00Z" },
      { topic_id: "argomento-inesistente", status: "studying" },
    ],
    content: [
      { content_id: CONTENT, first_seen_at: "2026-11-20T10:00:00Z", last_seen_at: "2026-11-21T10:00:00Z", seen_count: 3, open_count: 1, saved: true, hidden: false, signal: "difficult" },
    ],
    states: [
      { recall_id: RECALL, due: "2026-11-25T10:00:00Z", stability: 4, difficulty: 5, scheduled_days: 4, learning_steps: 0, reps: 2, lapses: 0, state: 2, last_review: "2026-11-21T10:00:00Z", content_revision: 1, version: 2 },
    ],
    events: [
      { id: "20000000-0000-0000-0000-000000000001", recall_id: RECALL, rating: "good", reviewed_at: "2026-11-21T10:00:00Z", state_before: 1, due_before: null, due_after: "2026-11-25T10:00:00Z", stability_after: 4, difficulty_after: 5, scheduled_days: 4, elapsed_days: 1 },
      { id: "20000000-0000-0000-0000-000000000002", recall_id: RECALL, rating: "good", reviewed_at: "2099-01-01T00:00:00Z", state_before: 2, due_before: null, due_after: "2099-01-05T00:00:00Z", stability_after: 4, difficulty_after: 5, scheduled_days: 4, elapsed_days: 1 },
    ],
    preferences: { theme: "dark", time_zone: "Europe/Rome", languages: ["it"] },
    ...extra,
  });

  it("unione: importa i dati validi, scarta quelli non validi e non duplica se ripetuta", async () => {
    const r1 = await as(B, () => q("select public.import_progress($1::jsonb, false) as r", [JSON.stringify(payload())]));
    expect(r1.rows[0].r).toEqual({ topics: 1, content: 1, states: 1, events: 1, skipped: 2 });
    const r2 = await as(B, () => q("select public.import_progress($1::jsonb, false) as r", [JSON.stringify(payload())]));
    expect(r2.rows[0].r).toMatchObject({ topics: 0, content: 0, states: 0, events: 0 });
    const prefs = await as(B, () => q("select theme, languages from public.user_preferences"));
    expect(prefs.rows[0]).toEqual({ theme: "dark", languages: ["it"] });
  });

  it("unione: i dati già presenti sul server vincono", async () => {
    await as(B, () => q("select public.import_progress($1::jsonb, false) as r", [JSON.stringify(payload({ preferences: { theme: "light", time_zone: "UTC", languages: ["en"] } }))]));
    const prefs = await as(B, () => q("select theme from public.user_preferences"));
    expect(prefs.rows[0].theme).toBe("dark");
  });

  it("scrive solo per l'utente autenticato e mai per gli altri", async () => {
    const rowsA = await as(A, () => q("select count(*)::int as n from public.user_content_progress"));
    expect(rowsA.rows[0].n).toBe(0);
    await expect(as(null, () => q("select public.import_progress('{}'::jsonb, true)"))).rejects.toThrow();
  });

  it("non importa ripassi su domande di contenuti privati di altri", async () => {
    const own = await as(A, () =>
      q(`insert into public.content_items (owner_id, slug, kind, language, title, summary, track_id, topic_id, difficulty, reading_minutes, provenance, created_on, updated_on)
         values ($1, 'privato-a', 'lesson', 'it', 'Titolo', 'Riassunto importato', 'ccna', $2, 1, 2, 'original', '2026-11-27', '2026-11-27') returning id`, [A, firstWithRecall.topicId]),
    );
    const rid = (await as(A, () => q("insert into public.recall_prompts (content_id, key, prompt, answer) values ($1, 'k', 'Domanda?', 'Risposta.') returning id", [own.rows[0].id]))).rows[0].id;
    const p = payload({ topics: [], content: [{ content_id: own.rows[0].id, seen_count: 1 }], states: [{ ...payload().states[0], recall_id: rid }], events: [] });
    const r = await as(B, () => q("select public.import_progress($1::jsonb, false) as r", [JSON.stringify(p)]));
    expect(r.rows[0].r).toMatchObject({ content: 0, states: 0, skipped: 2 });
  });

  it("sostituzione: cancella tutto e reimporta; payload vuoto = cancellazione completa", async () => {
    const r = await as(B, () => q("select public.import_progress($1::jsonb, true) as r", [JSON.stringify(payload({ preferences: { theme: "light", time_zone: "UTC", languages: ["en"] } }))]));
    expect(r.rows[0].r).toMatchObject({ topics: 1, content: 1, states: 1, events: 1 });
    expect((await as(B, () => q("select theme from public.user_preferences"))).rows[0].theme).toBe("light");
    await as(B, () => q("select public.import_progress('{}'::jsonb, true)"));
    const left = await as(B, () =>
      q(`select (select count(*)::int from public.review_events) + (select count(*)::int from public.review_states)
              + (select count(*)::int from public.user_content_progress) + (select count(*)::int from public.user_topic_progress) as n`),
    );
    expect(left.rows[0].n).toBe(0);
    // i dati di A non sono stati toccati
    expect((await as(A, () => q("select count(*)::int as n from public.review_events"))).rows[0].n).toBe(2);
  });

  it("rifiuta payload troppo grandi", async () => {
    const events = Array.from({ length: 100001 }, () => ({}));
    await expect(as(B, () => q("select public.import_progress($1::jsonb, false)", [JSON.stringify({ events })]))).rejects.toThrow(/too large/);
  });
});
