/** Utilità condivise dai test su PostgreSQL in memoria (PGlite): migration, ruoli e auth.uid() simulati. */
import { PGlite } from "@electric-sql/pglite";
import { readdirSync, readFileSync } from "node:fs";
import path from "node:path";

export const root = path.resolve(__dirname, "..");

export async function createDb(opts: { seed?: boolean } = {}): Promise<PGlite> {
  const db = new PGlite();
  await db.exec(readFileSync(path.join(root, "supabase/tests/auth-stub.sql"), "utf8"));
  for (const f of readdirSync(path.join(root, "supabase/migrations")).sort()) await db.exec(readFileSync(path.join(root, "supabase/migrations", f), "utf8"));
  if (opts.seed) await db.exec(readFileSync(path.join(root, "supabase/seed.sql"), "utf8"));
  return db;
}

export function actor(db: PGlite) {
  return async function as<T>(user: string | null, fn: () => Promise<T>): Promise<T> {
    await db.exec(
      user
        ? `set role authenticated; select set_config('request.jwt.claim.sub', '${user}', false);`
        : `set role anon; select set_config('request.jwt.claim.sub', '', false);`,
    );
    try {
      return await fn();
    } finally {
      await db.exec("reset role;");
    }
  };
}
