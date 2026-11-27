/**
 * Test della migration e delle policy RLS su PostgreSQL reale (PGlite, WASM), senza Supabase.
 * Simula i ruoli anon/authenticated e auth.uid() tramite supabase/tests/auth-stub.sql.
 */
import { PGlite } from "@electric-sql/pglite";
import { readdirSync, readFileSync } from "node:fs";
import path from "node:path";
import { beforeAll, describe, expect, it } from "vitest";

const root = path.resolve(__dirname, "..");
const A = "00000000-0000-0000-0000-00000000000a";
const B = "00000000-0000-0000-0000-00000000000b";
let db: PGlite;

async function as<T>(user: string | null, fn: () => Promise<T>): Promise<T> {
  await db.exec(user ? `set role authenticated; select set_config('request.jwt.claim.sub', '${user}', false);` : `set role anon; select set_config('request.jwt.claim.sub', '', false);`);
  try {
    return await fn();
  } finally {
    await db.exec("reset role;");
  }
}

const q = (sql: string, params: unknown[] = []) => db.query<Record<string, unknown>>(sql, params);

beforeAll(async () => {
  db = new PGlite();
  await db.exec(readFileSync(path.join(root, "supabase/tests/auth-stub.sql"), "utf8"));
  for (const f of readdirSync(path.join(root, "supabase/migrations")).sort()) await db.exec(readFileSync(path.join(root, "supabase/migrations", f), "utf8"));
  await db.exec(`
    insert into auth.users values ('${A}'), ('${B}');
    insert into public.learning_tracks (id, title) values ('ccna', 'CCNA');
    insert into public.modules (id, track_id, title, position) values ('mod', 'ccna', 'Mod', 0);
    insert into public.topics (id, module_id, title, position) values ('arp', 'mod', 'ARP', 0);
    insert into public.content_items (id, owner_id, slug, kind, language, title, summary, track_id, topic_id, difficulty, reading_minutes, provenance, created_on, updated_on)
      values ('11111111-1111-1111-1111-111111111111', null, 'sys-item', 'lesson', 'it', 'Sistema', 'Contenuto di sistema', 'ccna', 'arp', 1, 2, 'original', '2026-11-27', '2026-11-27');
    insert into public.recall_prompts (id, content_id, key, prompt, answer)
      values ('22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'k', 'Domanda?', 'Risposta.');
  `);
}, 60_000);

const insertOwned = (owner: string, slug: string) =>
  q(
    `insert into public.content_items (owner_id, slug, kind, language, title, summary, track_id, topic_id, difficulty, reading_minutes, provenance, created_on, updated_on)
     values ($1, $2, 'lesson', 'it', 'Titolo', 'Riassunto importato', 'ccna', 'arp', 1, 2, 'original', '2026-11-27', '2026-11-27') returning id`,
    [owner, slug],
  );

const review = (eventId: string, expected: number) =>
  q(
    `select public.record_review($1, '22222222-2222-2222-2222-222222222222', $2, 'good', now(), 0::smallint, null, now() + interval '1 day', 3.2, 5.1, 1, 0, 0, 1, 0, 2::smallint, 1) as r`,
    [eventId, expected],
  );

describe("RLS", () => {
  it("anon non legge nulla", async () => {
    await expect(as(null, () => q("select * from public.content_items"))).rejects.toThrow(/permission denied/);
  });

  it("un utente vede i contenuti di sistema e solo i propri importati", async () => {
    await as(A, () => insertOwned(A, "a-private"));
    const seenByB = await as(B, () => q("select slug from public.content_items order by slug"));
    expect(seenByB.rows.map((r) => r.slug)).toEqual(["sys-item"]);
    const seenByA = await as(A, () => q("select slug from public.content_items order by slug"));
    expect(seenByA.rows.map((r) => r.slug)).toEqual(["a-private", "sys-item"]);
  });

  it("non si possono creare contenuti a nome di altri né modificare quelli di sistema", async () => {
    await expect(as(B, () => insertOwned(A, "spoof"))).rejects.toThrow(/row-level security/);
    const upd = await as(A, () => q("update public.content_items set title = 'hack' where owner_id is null returning id"));
    expect(upd.rows).toHaveLength(0);
  });

  it("i progressi sono isolati per utente (no IDOR)", async () => {
    await as(A, () => q("insert into public.user_topic_progress (user_id, topic_id, status) values ($1, 'arp', 'studying')", [A]));
    await expect(as(B, () => q("insert into public.user_topic_progress (user_id, topic_id, status) values ($1, 'arp', 'mastered')", [A]))).rejects.toThrow(/row-level security/);
    const rowsB = await as(B, () => q("select * from public.user_topic_progress"));
    expect(rowsB.rows).toHaveLength(0);
  });

  it("record_review: atomico, idempotente e con controllo di versione", async () => {
    expect((await as(A, () => review("33333333-3333-3333-3333-333333333331", 0))).rows[0].r).toBe("ok");
    expect((await as(A, () => review("33333333-3333-3333-3333-333333333331", 1))).rows[0].r).toBe("duplicate_event");
    expect((await as(A, () => review("33333333-3333-3333-3333-333333333332", 0))).rows[0].r).toBe("stale_version");
    expect((await as(A, () => review("33333333-3333-3333-3333-333333333333", 1))).rows[0].r).toBe("ok");
    const st = await as(A, () => q("select version from public.review_states"));
    expect(st.rows).toEqual([{ version: 2 }]);
    expect((await as(B, () => q("select * from public.review_events"))).rows).toHaveLength(0);
  });

  it("review_events è append-only e review_states non è scrivibile direttamente", async () => {
    const upd = await as(A, () => q("update public.review_events set rating = 'easy' returning id"));
    expect(upd.rows).toHaveLength(0);
    await expect(
      as(A, () => q(`insert into public.review_states (user_id, recall_id, due, stability, difficulty, scheduled_days, state, content_revision) values ($1, '22222222-2222-2222-2222-222222222222', now(), 1, 1, 1, 2, 1)`, [B])),
    ).rejects.toThrow(/row-level security/);
  });

  it("record_review rifiuta utenti non autenticati e domande non visibili", async () => {
    await expect(as(null, () => review("44444444-4444-4444-4444-444444444444", 0))).rejects.toThrow();
    const bContent = await as(B, () => insertOwned(B, "b-private"));
    const rid = (await q("insert into public.recall_prompts (content_id, key, prompt, answer) values ($1, 'k', 'Domanda?', 'Risposta.') returning id", [bContent.rows[0].id])).rows[0].id;
    await expect(
      as(A, () => q(`select public.record_review(gen_random_uuid(), $1, 0, 'good', now(), 0::smallint, null, now(), 1, 1, 1, 0, 0, 1, 0, 2::smallint, 1)`, [rid])),
    ).rejects.toThrow(/recall not found/);
  });
});
