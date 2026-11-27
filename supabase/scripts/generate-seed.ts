/** Scrive supabase/seed.sql dai contenuti versionati. Uso: npm run db:seed */
import { writeFileSync } from "node:fs";
import path from "node:path";
import { blueprint, seedItems, tracks } from "@/data/catalog";
import { buildSeedSql } from "./seed-sql";

const target = path.resolve(import.meta.dirname, "..", "seed.sql");
writeFileSync(target, buildSeedSql({ blueprint, tracks, items: seedItems }), "utf8");
console.log(`Seed scritto in ${path.relative(process.cwd(), target)}: ${seedItems.length} contenuti, ${seedItems.reduce((n, i) => n + i.recall.length, 0)} domande.`);
