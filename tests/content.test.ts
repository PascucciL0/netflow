import { describe, expect, it } from "vitest";
import { readdirSync, readFileSync } from "node:fs";
import path from "node:path";
import { ContentPackageSchema } from "@/domain/import-schema";
import { objectiveById, seedItemById, seedItems, topicById, topics } from "@/data/catalog";
import { validateTopicGraph } from "@/engine/catalog";
import { DIAGRAMS } from "@/components/diagrams/registry";

const dir = path.resolve(__dirname, "../content/ccna/items");

describe("seed dei contenuti", () => {
  it("ogni pacchetto rispetta lo schema di importazione", () => {
    for (const f of readdirSync(dir).filter((x) => x.endsWith(".json"))) {
      const res = ContentPackageSchema.safeParse(JSON.parse(readFileSync(path.join(dir, f), "utf8")));
      expect(res.success, `${f}: ${res.success ? "" : JSON.stringify(res.error.issues.slice(0, 3))}`).toBe(true);
    }
  });

  it("il grafo degli argomenti è valido (nessun ciclo, nessun prerequisito mancante)", () => {
    expect(validateTopicGraph(topics)).toEqual([]);
  });

  it("riferimenti interni validi: argomenti, prerequisiti, obiettivi, diagrammi, correlati", () => {
    const errors: string[] = [];
    for (const it of seedItems) {
      if (!topicById.has(it.topicId)) errors.push(`${it.id}: topic ${it.topicId}`);
      for (const p of it.prerequisites) if (!topicById.has(p)) errors.push(`${it.id}: prerequisito ${p}`);
      for (const o of it.objectives) if (!objectiveById.has(o)) errors.push(`${it.id}: obiettivo ${o}`);
      for (const d of it.diagrams) if (!(d.id in DIAGRAMS)) errors.push(`${it.id}: diagramma ${d.id}`);
      for (const r of it.related) if (!seedItemById.has(r)) errors.push(`${it.id}: correlato ${r}`);
    }
    for (const t of topics) for (const o of t.objectives) if (!objectiveById.has(o)) errors.push(`topic ${t.id}: obiettivo ${o}`);
    expect(errors).toEqual([]);
  });

  it("ID dei contenuti univoci tra tutti i pacchetti", () => {
    expect(seedItemById.size).toBe(seedItems.length);
  });

  it("gli URL delle fonti sono solo https", () => {
    for (const it of seedItems) for (const s of it.sources) if (s.url) expect(s.url.startsWith("https://")).toBe(true);
  });
});

describe("schema di importazione: input malevoli o non validi", () => {
  const valid = JSON.parse(readFileSync(path.join(dir, "core-001.json"), "utf8"));
  const withItem = (patch: Record<string, unknown>) => ({ ...valid, items: [{ ...valid.items[0], ...patch }] });

  it("rifiuta URL javascript: e http:", () => {
    expect(ContentPackageSchema.safeParse(withItem({ sources: [{ title: "x x", publisher: "pp", type: "other", url: "javascript:alert(1)" }] })).success).toBe(false);
    expect(ContentPackageSchema.safeParse(withItem({ sources: [{ title: "x x", publisher: "pp", type: "other", url: "http://example.com" }] })).success).toBe(false);
  });

  it("rifiuta campi sconosciuti a livello di pacchetto, versioni non supportate e ID non validi", () => {
    expect(ContentPackageSchema.safeParse({ ...valid, extra: 1 }).success).toBe(false);
    expect(ContentPackageSchema.safeParse({ ...valid, schemaVersion: 2 }).success).toBe(false);
    expect(ContentPackageSchema.safeParse(withItem({ id: "../etc/passwd" })).success).toBe(false);
  });

  it("rifiuta ID duplicati nel pacchetto", () => {
    expect(ContentPackageSchema.safeParse({ ...valid, items: [valid.items[0], valid.items[0]] }).success).toBe(false);
  });

  it("rifiuta contenuti senza fonti e body troppo lunghi", () => {
    expect(ContentPackageSchema.safeParse(withItem({ sources: [] })).success).toBe(false);
    expect(ContentPackageSchema.safeParse(withItem({ body: "x".repeat(20_001) })).success).toBe(false);
  });
});
