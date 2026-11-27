import { describe, expect, it } from "vitest";
import { readFileSync } from "node:fs";
import path from "node:path";
import { cardIdOf, type ContentItem } from "@/domain/content";
import { ContentPackageSchema } from "@/domain/import-schema";
import { emptySnapshot } from "@/domain/progress";
import { objectives, seedItemById, topics } from "@/data/catalog";
import {
  applyImport,
  emptyLibrary,
  exportImportedPackage,
  jsonErrorOffset,
  parsePackage,
  planImport,
  removePackage,
  reviveLibrary,
  type CatalogRefs,
  type ImportedLibrary,
} from "@/data/import-plan";
import { buildContentPrompt, EXAMPLE_PACKAGE, PROMPT_TEMPLATE } from "@/data/import-prompt";
import { reduce } from "@/engine/reducer";
import { DIAGRAMS } from "@/components/diagrams/registry";
import { item, recall, T0 } from "./helpers";

const refs: CatalogRefs = {
  topicIds: new Set(topics.map((t) => t.id)),
  objectiveIds: new Set(objectives.map((o) => o.id)),
  diagramIds: new Set(Object.keys(DIAGRAMS)),
  contentIds: new Set(seedItemById.keys()),
};
const SYSTEM = new Set(seedItemById.keys());

const pkg = (items: ContentItem[], id = "pacchetto-test") => ({
  format: "netflow.content-package",
  schemaVersion: 1,
  package: { id, title: "Pacchetto di test", language: "it", createdAt: "2026-11-27" },
  items,
});
const text = (v: unknown) => JSON.stringify(v);
const mine = (id: string, extra: Partial<ContentItem> = {}) => item(id, "vlans", { recall: [recall("a"), recall("b")], ...extra });

function parseOk(v: unknown) {
  const r = parsePackage(text(v), refs);
  if (!r.ok) throw new Error(JSON.stringify(r.errors));
  return r;
}

function importInto(lib: ImportedLibrary, v: unknown, at = T0) {
  const plan = planImport(parseOk(v).pkg, SYSTEM, lib);
  const res = applyImport(lib, plan, at, `rec-${at.getTime()}`);
  if (!res.ok) throw new Error(res.reason);
  return { plan, lib: res.library };
}

describe("parsePackage: validazione e messaggi leggibili", () => {
  it("accetta un pacchetto valido", () => {
    const r = parsePackage(text(pkg([mine("mio-vlan-1")])), refs);
    expect(r.ok).toBe(true);
  });

  it("rifiuta file oltre 2 MB prima di leggerli come JSON", () => {
    const big = text(pkg([mine("mio-big", { body: "x".repeat(100) })])).padEnd(2 * 1024 * 1024 + 1, " ");
    const r = parsePackage(big, refs);
    expect(r.ok).toBe(false);
    if (!r.ok) {
      expect(r.stage).toBe("size");
      expect(r.errors[0].message).toMatch(/2 MB/);
    }
  });

  it("segnala JSON non valido con riga e colonna", () => {
    const r = parsePackage('{\n  "format": "netflow.content-package",\n  "items": [,]\n}', refs);
    expect(r.ok).toBe(false);
    if (!r.ok) {
      expect(r.stage).toBe("json");
      expect(r.errors[0].message).toMatch(/riga 3/);
    }
  });

  it("il localizzatore di errori JSON concorda con JSON.parse", () => {
    const valid = [readFileSync(path.resolve(__dirname, "../content/ccna/items/core-001.json"), "utf8"), '{"a":"\\u00e8\\n","b":[1,-2.5e3,true,null]}', "[]", ' "x" '];
    for (const v of valid) expect(jsonErrorOffset(v)).toBe(-1);
    const invalid: [string, number][] = [["{,}", 1], ['{"a":1,}', 7], ["[1 2]", 3], ['{"a":"x', 7], ["{} x", 3], ["", 0], ["{'a':1}", 1]];
    for (const [v, at] of invalid) expect(jsonErrorOffset(v), v).toBe(at);
  });

  it("errori di schema in italiano, con percorso del campo e titolo del contenuto", () => {
    const bad = pkg([mine("mio-ok"), { ...mine("mio-bad"), title: "Titolo del secondo", difficulty: 7 as 1, sources: [] }]);
    const r = parsePackage(text(bad), refs);
    expect(r.ok).toBe(false);
    if (!r.ok) {
      expect(r.stage).toBe("schema");
      const diff = r.errors.find((e) => e.path === "items[1].difficulty");
      expect(diff?.itemIndex).toBe(1);
      expect(diff?.itemTitle).toBe("Titolo del secondo");
      expect(diff?.message).toMatch(/^Difficoltà:/);
      const src = r.errors.find((e) => e.path === "items[1].sources");
      expect(src?.message).toMatch(/almeno una fonte/);
    }
  });

  it("segnala i campi obbligatori mancanti e i campi sconosciuti del pacchetto", () => {
    const noTitle: Partial<ContentItem> = mine("mio-no-title");
    delete noTitle.title;
    const r = parsePackage(text({ ...pkg([noTitle as ContentItem]), extra: true }), refs);
    expect(r.ok).toBe(false);
    if (!r.ok) {
      expect(r.errors.some((e) => e.path === "items[0].title" && /mancante/.test(e.message))).toBe(true);
      expect(r.errors.some((e) => /Campi non previsti: extra/.test(e.message))).toBe(true);
    }
  });

  it("rifiuta più di 300 contenuti", () => {
    const many = Array.from({ length: 301 }, (_, i) => mine(`mio-${i}-x`));
    const r = parsePackage(text(pkg(many)), refs);
    expect(r.ok).toBe(false);
    if (!r.ok) expect(r.errors[0].message).toMatch(/300/);
  });

  it("rifiuta contenuti malevoli: script, gestori di eventi, URL javascript: nel Markdown", () => {
    for (const body of ["Testo <script>alert(1)</script>", '<img src=x onerror="alert(1)">', "[clic](javascript:alert(1))", "[x](data:text/html;base64,AAAA)"]) {
      const r = parsePackage(text(pkg([mine("mio-evil", { body })])), refs);
      expect(r.ok, body).toBe(false);
      if (!r.ok) expect(r.stage).toBe("safety");
    }
    const inRecall = mine("mio-evil-2", { recall: [{ ...recall("a"), answer: "<iframe src='https://x.y'></iframe>" }] });
    expect(parsePackage(text(pkg([inRecall])), refs).ok).toBe(false);
  });

  it("rifiuta argomenti, obiettivi e diagrammi inesistenti (niente obiettivi inventati)", () => {
    const r = parsePackage(text(pkg([mine("mio-ref", { topicId: "bgp", objectives: ["ccna-v2:9.9"], diagrams: [{ id: "custom-svg" }] })])), refs);
    expect(r.ok).toBe(false);
    if (!r.ok) {
      expect(r.stage).toBe("references");
      expect(r.errors.map((e) => e.path).sort()).toEqual(["items[0].diagrams[0].id", "items[0].objectives[0]", "items[0].topicId"]);
    }
  });

  it("i correlati sconosciuti sono un avviso, non un errore", () => {
    const r = parseOk(pkg([mine("mio-rel", { related: ["non-esiste", "router-vs-switch"] })]));
    expect(r.warnings).toHaveLength(1);
    expect(r.warnings[0].path).toBe("items[0].related[0]");
  });

  it("scarta i campi sconosciuti dentro un contenuto (nessun dato extra arriva allo store)", () => {
    const r = parseOk(pkg([{ ...mine("mio-strip"), html: "<b>x</b>" } as ContentItem]));
    expect("html" in r.pkg.items[0]).toBe(false);
  });
});

describe("planImport: nuovi, aggiornamenti, duplicati", () => {
  it("classifica ogni contenuto secondo le regole di IMPORT_FORMAT.md", () => {
    let lib = emptyLibrary();
    lib = importInto(lib, pkg([mine("mio-a"), mine("mio-b"), mine("mio-c", { revision: 3 })])).lib;
    const next = pkg([mine("mio-a"), mine("mio-b", { revision: 2 }), mine("mio-c", { revision: 2 }), mine("mio-d")]);
    const plan = planImport(parseOk(next).pkg, SYSTEM, lib);
    expect(Object.fromEntries(plan.entries.map((e) => [e.id, e.action]))).toEqual({ "mio-a": "duplicate", "mio-b": "update", "mio-c": "outdated", "mio-d": "create" });
    expect(plan.writable).toBe(2);
    expect(plan.blocked).toBe(false);
  });

  it("blocca gli id riservati ai contenuti di sistema", () => {
    const plan = planImport(parseOk(pkg([mine("router-vs-switch"), mine("mio-x")])).pkg, SYSTEM, emptyLibrary());
    expect(plan.blocked).toBe(true);
    expect(plan.entries[0].action).toBe("reserved");
    expect(applyImport(emptyLibrary(), plan, T0, "r").ok).toBe(false);
  });

  it("segnala domande rimosse e testo cambiato senza incremento di revisione", () => {
    const lib = importInto(emptyLibrary(), pkg([mine("mio-a"), mine("mio-b")])).lib;
    const plan = planImport(parseOk(pkg([mine("mio-a", { revision: 2, recall: [recall("a")] }), mine("mio-b", { summary: "Riassunto cambiato ma stessa revisione" })])).pkg, SYSTEM, lib);
    expect(plan.entries[0].removedRecallKeys).toEqual(["b"]);
    expect(plan.entries[1].action).toBe("duplicate");
    expect(plan.entries[1].changedWithoutRevision).toBe(true);
  });
});

describe("applyImport: atomicità e storico", () => {
  it("non modifica la libreria originale e registra lo storico", () => {
    const before = emptyLibrary();
    const { lib } = importInto(before, pkg([mine("mio-a"), mine("mio-b")]));
    expect(before.items).toEqual({});
    expect(Object.keys(lib.items).sort()).toEqual(["mio-a", "mio-b"]);
    expect(lib.history[0]).toMatchObject({ packageId: "pacchetto-test", created: ["mio-a", "mio-b"], updated: [], skipped: [] });
  });

  it("rifiuta un piano diventato obsoleto (altra scheda ha importato nel frattempo)", () => {
    const plan = planImport(parseOk(pkg([mine("mio-a")])).pkg, SYSTEM, emptyLibrary());
    const other = importInto(emptyLibrary(), pkg([mine("mio-a")])).lib;
    const res = applyImport(other, plan, T0, "r2");
    expect(res.ok).toBe(false);
  });

  it("niente da scrivere → nessuna modifica", () => {
    const { lib } = importInto(emptyLibrary(), pkg([mine("mio-a")]));
    const plan = planImport(parseOk(pkg([mine("mio-a")])).pkg, SYSTEM, lib);
    expect(applyImport(lib, plan, T0, "r3").ok).toBe(false);
  });

  it("i ripassi non si perdono dopo un aggiornamento del contenuto", () => {
    let { lib } = importInto(emptyLibrary(), pkg([mine("mio-a")]));
    let snapshot = emptySnapshot();
    const cardId = cardIdOf("mio-a", "a");
    snapshot = reduce(snapshot, { type: "review/record", eventId: "e1", cardId, rating: "good", contentRevision: 1, expectedVersion: 0 }, T0).snapshot;
    const stateBefore = snapshot.reviews[cardId];
    expect(stateBefore).toBeDefined();

    lib = importInto(lib, pkg([mine("mio-a", { revision: 2, title: "Titolo nuovo" })]), new Date(T0.getTime() + 86_400_000)).lib;
    const updated = lib.items["mio-a"].item;
    expect(updated.revision).toBe(2);
    // stessa chiave recall → stessa carta: lo stato FSRS è ancora quello di prima
    expect(updated.recall.some((r) => cardIdOf(updated.id, r.key) === cardId)).toBe(true);
    expect(snapshot.reviews[cardId]).toBe(stateBefore);
    expect(snapshot.events).toHaveLength(1);
  });

  it("rimuovere un pacchetto toglie i contenuti ma conserva lo storico", () => {
    let { lib } = importInto(emptyLibrary(), pkg([mine("mio-a")], "pkg-uno"));
    lib = importInto(lib, pkg([mine("mio-b")], "pkg-due")).lib;
    const after = removePackage(lib, "pkg-uno");
    expect(Object.keys(after.items)).toEqual(["mio-b"]);
    expect(after.history).toHaveLength(2);
  });
});

describe("persistenza ed esportazione", () => {
  it("reviveLibrary scarta voci corrotte, id di sistema e dati non validi", () => {
    const { lib } = importInto(emptyLibrary(), pkg([mine("mio-a")]));
    const tampered = JSON.parse(JSON.stringify(lib)) as Record<string, unknown> & { items: Record<string, unknown> };
    tampered.items["mio-evil"] = { item: { id: "mio-evil" }, packageId: "x", importedAt: "y" };
    tampered.items["router-vs-switch"] = { item: { ...lib.items["mio-a"].item, id: "router-vs-switch" }, packageId: "x", importedAt: "y" };
    tampered.items["mio-mismatch"] = lib.items["mio-a"];
    const revived = reviveLibrary(tampered, SYSTEM);
    expect(Object.keys(revived.items)).toEqual(["mio-a"]);
    expect(reviveLibrary("spazzatura", SYSTEM)).toEqual(emptyLibrary());
    expect(reviveLibrary({ version: 2 }, SYSTEM)).toEqual(emptyLibrary());
  });

  it("l'esportazione dei contenuti importati è un pacchetto valido e reimportabile", () => {
    const { lib } = importInto(emptyLibrary(), pkg([mine("mio-b"), mine("mio-a")]));
    const exported = exportImportedPackage(lib, T0);
    expect(ContentPackageSchema.safeParse(exported).success).toBe(true);
    expect(exported.items.map((i) => i.id)).toEqual(["mio-a", "mio-b"]);
    const plan = planImport(parseOk(exported).pkg, SYSTEM, lib);
    expect(plan.counts.duplicate).toBe(2);
  });
});

describe("prompt di generazione ed esempio", () => {
  it("il pacchetto di esempio supera la validazione completa", () => {
    expect(parsePackage(text(EXAMPLE_PACKAGE), refs).ok).toBe(true);
  });

  it("il prompt contiene argomenti e obiettivi reali del catalogo", () => {
    const p = buildContentPrompt(topics, objectives, Object.keys(DIAGRAMS));
    for (const t of topics) expect(p).toContain(`- ${t.id} — `);
    for (const o of objectives) expect(p).toContain(o.id);
  });

  it("docs/CONTENT_GENERATION_PROMPT.md contiene il testo fisso del prompt", () => {
    const doc = readFileSync(path.resolve(__dirname, "../docs/CONTENT_GENERATION_PROMPT.md"), "utf8");
    expect(doc).toContain(PROMPT_TEMPLATE);
  });
});
