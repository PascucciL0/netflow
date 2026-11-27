/**
 * Importazione di pacchetti di contenuti: logica pura e testabile.
 *
 *   testo  ──parsePackage──▶  pacchetto valido + avvisi   (oppure errori leggibili, nulla viene importato)
 *          ──planImport───▶   piano: nuovo / aggiornato / duplicato / più vecchio / riservato
 *          ──applyImport──▶   nuova libreria importata + voce di storico   (tutto o niente)
 *
 * Nessun I/O qui: lo store (import-store.ts) si occupa di leggere e scrivere localStorage.
 * Regole di aggiornamento: docs/IMPORT_FORMAT.md.
 */
import { z } from "zod";
import { ContentItemSchema, type ContentItem } from "@/domain/content";
import { ContentPackageSchema, IMPORT_LIMITS, type ContentPackage } from "@/domain/import-schema";

/* ------------------------------------------------------------------ tipi */

export interface ImportIssue {
  /** Percorso leggibile del campo, es. "items[2].sources[0].url". Vuoto = intero pacchetto. */
  path: string;
  message: string;
  /** Indice del contenuto nel pacchetto, se l'errore riguarda un contenuto. */
  itemIndex?: number;
  /** id e titolo del contenuto (letti dal testo grezzo, utili anche se non validi). */
  itemId?: string;
  itemTitle?: string;
}

export type ParseStage = "size" | "json" | "schema" | "safety" | "references";

export type ParseOutcome =
  | { ok: true; pkg: ContentPackage; warnings: ImportIssue[] }
  | { ok: false; stage: ParseStage; errors: ImportIssue[] };

/** Riferimenti che un contenuto importato può citare. Passati dall'esterno: la funzione resta pura. */
export interface CatalogRefs {
  topicIds: ReadonlySet<string>;
  objectiveIds: ReadonlySet<string>;
  diagramIds: ReadonlySet<string>;
  /** Contenuti già noti (sistema + importati): servono solo per verificare i "related". */
  contentIds: ReadonlySet<string>;
}

export type PlanAction = "create" | "update" | "duplicate" | "outdated" | "reserved";

export interface PlanEntry {
  id: string;
  title: string;
  action: PlanAction;
  item: ContentItem;
  /** Revisione già presente (aggiornamenti, duplicati, versioni più vecchie). */
  currentRevision?: number;
  /** Chiavi recall presenti prima e assenti nella nuova revisione: le carte spariscono, lo storico resta. */
  removedRecallKeys: string[];
  /** Stessa revisione ma testo diverso: probabilmente manca l'incremento di "revision". */
  changedWithoutRevision?: boolean;
}

export interface ImportPlan {
  pkg: ContentPackage;
  entries: PlanEntry[];
  counts: Record<PlanAction, number>;
  /** true se il pacchetto contiene id riservati ai contenuti di sistema: l'import è bloccato. */
  blocked: boolean;
  /** Numero di contenuti che verranno scritti (nuovi + aggiornati). */
  writable: number;
}

export interface ImportedEntry {
  item: ContentItem;
  packageId: string;
  importedAt: string;
}

export interface ImportRecord {
  id: string;
  at: string;
  packageId: string;
  packageTitle: string;
  generator?: string;
  created: string[];
  updated: string[];
  skipped: string[];
}

export interface ImportedLibrary {
  version: 1;
  items: Record<string, ImportedEntry>;
  history: ImportRecord[];
}

export const emptyLibrary = (): ImportedLibrary => ({ version: 1, items: {}, history: [] });

export const MAX_HISTORY = 50;

/* --------------------------------------------------------- messaggi zod */

const FIELD_LABELS: Record<string, string> = {
  format: "formato",
  schemaVersion: "versione dello schema",
  package: "dati del pacchetto",
  items: "contenuti",
  id: "id",
  revision: "revisione",
  kind: "tipo",
  language: "lingua",
  title: "titolo",
  summary: "riassunto",
  body: "testo",
  trackId: "percorso",
  topicId: "argomento",
  subtopic: "sotto-argomento",
  difficulty: "difficoltà",
  prerequisites: "prerequisiti",
  readingMinutes: "minuti di lettura",
  objectives: "obiettivi",
  sources: "fonti",
  url: "URL",
  publisher: "editore",
  type: "tipo di fonte",
  verifiedOn: "data di verifica",
  provenance: "natura",
  reviewStatus: "stato di revisione",
  tags: "tag",
  diagrams: "diagrammi",
  caption: "didascalia",
  recall: "domande di recall",
  key: "chiave",
  prompt: "domanda",
  answer: "risposta",
  keyPoints: "punti chiave",
  commonMistakes: "errori comuni",
  related: "correlati",
  createdAt: "data di creazione",
  updatedAt: "data di aggiornamento",
  generator: "generatore",
  notes: "note",
};

const TYPE_LABELS: Record<string, string> = {
  string: "un testo",
  number: "un numero",
  int: "un numero intero",
  boolean: "vero/falso",
  array: "un elenco",
  object: "un oggetto",
  undefined: "assente",
  null: "null",
};

const lengthUnit = (origin: string) => (origin === "string" ? "caratteri" : origin === "array" ? "elementi" : "");

/** Messaggi in italiano naturale per i casi più frequenti; per il resto la traduzione di zod. */
function italianMessage(iss: z.core.$ZodRawIssue): string | undefined {
  switch (iss.code) {
    case "invalid_type": {
      if (iss.input === undefined) return "Campo obbligatorio mancante";
      return `Valore non valido: atteso ${TYPE_LABELS[iss.expected] ?? iss.expected}`;
    }
    case "too_small": {
      const unit = lengthUnit(iss.origin);
      if (iss.origin === "array" && iss.minimum === 1) return "Serve almeno un elemento";
      return unit ? `Troppo corto: minimo ${String(iss.minimum)} ${unit}` : `Valore troppo basso: minimo ${String(iss.minimum)}`;
    }
    case "too_big": {
      const unit = lengthUnit(iss.origin);
      return unit ? `Troppo lungo: massimo ${String(iss.maximum)} ${unit}` : `Valore troppo alto: massimo ${String(iss.maximum)}`;
    }
    case "invalid_value":
      return `Valore non ammesso. Valori possibili: ${iss.values.map((v) => JSON.stringify(v)).join(", ")}`;
    case "invalid_union":
      return "Valore non ammesso";
    case "unrecognized_keys":
      return `Campi non previsti: ${iss.keys.join(", ")}`;
    case "invalid_format": {
      if (iss.format === "url") return "URL non valido: sono ammessi solo indirizzi https://";
      if (iss.format === "date") return "Data non valida: usa il formato AAAA-MM-GG";
      if (iss.format === "regex") return undefined; // il messaggio dello schema è già in italiano quando presente
      return undefined;
    }
    default:
      return undefined;
  }
}

const itLocale = z.locales.it().localeError;
const errorMap = (iss: z.core.$ZodRawIssue) => italianMessage(iss) ?? itLocale(iss);

/* ----------------------------------------------------------- utilità */

const formatPath = (path: readonly PropertyKey[]): string =>
  path.reduce<string>((acc, seg) => (typeof seg === "number" ? `${acc}[${seg}]` : acc ? `${acc}.${String(seg)}` : String(seg)), "");

const fieldLabel = (path: readonly PropertyKey[]): string | undefined => {
  for (let i = path.length - 1; i >= 0; i--) {
    const seg = path[i];
    if (typeof seg === "string") return FIELD_LABELS[seg];
  }
  return undefined;
};

const isRecord = (v: unknown): v is Record<string, unknown> => typeof v === "object" && v !== null && !Array.isArray(v);

function rawItemInfo(raw: unknown, index: number): { itemId?: string; itemTitle?: string } {
  if (!isRecord(raw) || !Array.isArray(raw.items)) return {};
  const it: unknown = raw.items[index];
  if (!isRecord(it)) return {};
  return {
    itemId: typeof it.id === "string" ? it.id.slice(0, 80) : undefined,
    itemTitle: typeof it.title === "string" ? it.title.slice(0, 140) : undefined,
  };
}

function issueFor(raw: unknown, path: readonly PropertyKey[], message: string): ImportIssue {
  const itemIndex = path[0] === "items" && typeof path[1] === "number" ? path[1] : undefined;
  const label = fieldLabel(path);
  return {
    path: formatPath(path),
    message: label && !message.toLowerCase().startsWith(label) ? `${capitalize(label)}: ${lowerFirst(message)}` : message,
    itemIndex,
    ...(itemIndex !== undefined ? rawItemInfo(raw, itemIndex) : {}),
  };
}

const capitalize = (s: string) => s.charAt(0).toUpperCase() + s.slice(1);
const lowerFirst = (s: string) => (/^[A-Z][a-z]/.test(s) ? s.charAt(0).toLowerCase() + s.slice(1) : s);

/** Posizione (riga, colonna) di un offset nel testo, per gli errori di sintassi JSON. */
function lineCol(text: string, offset: number): { line: number; col: number } {
  const before = text.slice(0, offset);
  const line = before.split("\n").length;
  return { line, col: offset - before.lastIndexOf("\n") };
}

/**
 * Trova l'offset del primo errore di sintassi JSON. I messaggi di JSON.parse cambiano da browser
 * a browser (V8 non indica più la posizione), quindi la posizione la calcoliamo noi.
 * Restituisce -1 se il testo è sintatticamente valido.
 */
export function jsonErrorOffset(text: string): number {
  let i = 0;
  const ws = () => {
    while (i < text.length && " \t\n\r".includes(text[i])) i++;
  };
  const fail = (): never => {
    throw i;
  };
  const lit = (word: string) => {
    if (text.startsWith(word, i)) i += word.length;
    else fail();
  };
  const str = () => {
    i++; // "
    while (i < text.length) {
      const c = text[i];
      if (c === '"') {
        i++;
        return;
      }
      if (c === "\\") {
        const n = text[i + 1];
        if (n === "u") {
          if (!/^[0-9a-fA-F]{4}$/.test(text.slice(i + 2, i + 6))) fail();
          i += 6;
        } else if (n !== undefined && '"\\/bfnrt'.includes(n)) i += 2;
        else fail();
      } else if (c < " ") fail();
      else i++;
    }
    fail();
  };
  const num = () => {
    const m = /^-?(0|[1-9]\d*)(\.\d+)?([eE][+-]?\d+)?/.exec(text.slice(i));
    if (!m) fail();
    else i += m[0].length;
  };
  const value = (): void => {
    ws();
    const c = text[i];
    if (c === "{") {
      i++;
      ws();
      if (text[i] === "}") {
        i++;
        return;
      }
      for (;;) {
        ws();
        if (text[i] !== '"') fail();
        str();
        ws();
        if (text[i] !== ":") fail();
        i++;
        value();
        ws();
        if (text[i] === ",") i++;
        else if (text[i] === "}") {
          i++;
          return;
        } else fail();
      }
    } else if (c === "[") {
      i++;
      ws();
      if (text[i] === "]") {
        i++;
        return;
      }
      for (;;) {
        value();
        ws();
        if (text[i] === ",") i++;
        else if (text[i] === "]") {
          i++;
          return;
        } else fail();
      }
    } else if (c === '"') str();
    else if (c === "t") lit("true");
    else if (c === "f") lit("false");
    else if (c === "n") lit("null");
    else if (c === "-" || (c !== undefined && c >= "0" && c <= "9")) num();
    else fail();
  };
  try {
    value();
    ws();
    return i < text.length ? i : -1;
  } catch (pos) {
    return typeof pos === "number" ? Math.min(pos, text.length) : 0;
  }
}

function jsonErrorMessage(text: string): string {
  const offset = jsonErrorOffset(text);
  const hint = "Controlla virgole, virgolette e parentesi.";
  if (offset < 0) return `Il testo non è JSON valido. ${hint}`;
  const { line, col } = lineCol(text, offset);
  const near = text.slice(offset, offset + 24).split("\n")[0];
  return `Il testo non è JSON valido (riga ${line}, colonna ${col}${near ? `, vicino a «${near}»` : ""}). ${hint}`;
}

/* --------------------------------------------- controlli di sicurezza */

/**
 * Il renderer Markdown scarta già l'HTML grezzo e filtra gli URL pericolosi.
 * Questo controllo è una seconda barriera: un pacchetto che prova a inserire
 * script, iframe, gestori di eventi o URL javascript:/data:/vbscript: viene rifiutato
 * per intero, perché è segno di un file manipolato o generato male.
 */
const DANGEROUS_PATTERNS: { re: RegExp; reason: string }[] = [
  { re: /<\s*(script|iframe|object|embed|style|link|meta|svg|math|form|base)\b/i, reason: "contiene un tag HTML non ammesso" },
  { re: /<[^>]+\son[a-z]+\s*=/i, reason: "contiene un gestore di eventi HTML (es. onclick=)" },
  { re: /\b(javascript|vbscript|data)\s*:/i, reason: "contiene un URL javascript:, vbscript: o data:" },
];

function scanStrings(value: unknown, path: (string | number)[], out: ImportIssue[], raw: unknown): void {
  if (out.length >= 20) return;
  if (typeof value === "string") {
    for (const { re, reason } of DANGEROUS_PATTERNS) {
      if (re.test(value)) {
        out.push(issueFor(raw, path, `Contenuto rifiutato: il testo ${reason}`));
        return;
      }
    }
  } else if (Array.isArray(value)) {
    value.forEach((v, i) => scanStrings(v, [...path, i], out, raw));
  } else if (isRecord(value)) {
    for (const [k, v] of Object.entries(value)) scanStrings(v, [...path, k], out, raw);
  }
}

/* --------------------------------------------------------- parse */

export function byteLength(text: string): number {
  return new TextEncoder().encode(text).length;
}

/**
 * Valida un pacchetto a partire dal testo (incollato o letto da file).
 * Ordine: dimensione → sintassi JSON → schema → sicurezza → riferimenti.
 * Si ferma alla prima fase che fallisce: gli errori successivi sarebbero solo rumore.
 */
export function parsePackage(text: string, refs: CatalogRefs): ParseOutcome {
  const size = byteLength(text);
  if (size > IMPORT_LIMITS.maxFileBytes) {
    const mb = (size / 1024 / 1024).toFixed(1);
    return { ok: false, stage: "size", errors: [{ path: "", message: `File troppo grande (${mb} MB). Il limite è 2 MB: dividilo in più pacchetti.` }] };
  }
  if (text.trim() === "") return { ok: false, stage: "json", errors: [{ path: "", message: "Nessun contenuto da importare: incolla il JSON o scegli un file." }] };

  let raw: unknown;
  try {
    raw = JSON.parse(text);
  } catch {
    return { ok: false, stage: "json", errors: [{ path: "", message: jsonErrorMessage(text) }] };
  }

  if (isRecord(raw) && Array.isArray(raw.items) && raw.items.length > IMPORT_LIMITS.maxItems) {
    return { ok: false, stage: "schema", errors: [{ path: "items", message: `Troppi contenuti (${raw.items.length}). Il limite è ${IMPORT_LIMITS.maxItems} per pacchetto.` }] };
  }

  const parsed = ContentPackageSchema.safeParse(raw, { error: errorMap });
  if (!parsed.success) {
    const errors = parsed.error.issues.slice(0, 100).map((i) => issueFor(raw, i.path, i.message));
    return { ok: false, stage: "schema", errors };
  }

  const unsafe: ImportIssue[] = [];
  scanStrings(raw, [], unsafe, raw);
  if (unsafe.length > 0) return { ok: false, stage: "safety", errors: unsafe };

  const pkg = parsed.data;
  const errors: ImportIssue[] = [];
  const warnings: ImportIssue[] = [];
  const inPackage = new Set(pkg.items.map((i) => i.id));
  pkg.items.forEach((it, idx) => {
    const at = (path: (string | number)[], message: string) => issueFor(raw, ["items", idx, ...path], message);
    if (!refs.topicIds.has(it.topicId)) errors.push(at(["topicId"], `argomento "${it.topicId}" inesistente nel catalogo`));
    it.prerequisites.forEach((p, j) => {
      if (!refs.topicIds.has(p)) errors.push(at(["prerequisites", j], `argomento "${p}" inesistente nel catalogo`));
    });
    it.objectives.forEach((o, j) => {
      if (!refs.objectiveIds.has(o)) errors.push(at(["objectives", j], `"${o}" non è un obiettivo del blueprint CCNA v2.0`));
    });
    it.diagrams.forEach((d, j) => {
      if (!refs.diagramIds.has(d.id)) errors.push(at(["diagrams", j, "id"], `diagramma "${d.id}" non presente nel registro`));
    });
    it.related.forEach((r, j) => {
      if (!refs.contentIds.has(r) && !inPackage.has(r)) warnings.push(at(["related", j], `contenuto correlato "${r}" non trovato: il collegamento non verrà mostrato`));
    });
    if (it.trackId !== "ccna") errors.push(at(["trackId"], `percorso "${it.trackId}" non disponibile (oggi solo "ccna")`));
  });
  if (errors.length > 0) return { ok: false, stage: "references", errors };
  return { ok: true, pkg, warnings };
}

/* ---------------------------------------------------------- piano */

/** Confronto del contenuto ignorando le date: serve a capire se la stessa revisione è cambiata. */
const fingerprint = (it: ContentItem) => JSON.stringify({ ...it, createdAt: undefined, updatedAt: undefined });

export function planImport(pkg: ContentPackage, systemIds: ReadonlySet<string>, library: ImportedLibrary): ImportPlan {
  const entries: PlanEntry[] = pkg.items.map((item) => {
    const base = { id: item.id, title: item.title, item, removedRecallKeys: [] as string[] };
    if (systemIds.has(item.id)) return { ...base, action: "reserved" };
    const current = library.items[item.id]?.item;
    if (!current) return { ...base, action: "create" };
    const removedRecallKeys = current.recall.map((r) => r.key).filter((k) => !item.recall.some((r) => r.key === k));
    if (item.revision > current.revision) return { ...base, action: "update", currentRevision: current.revision, removedRecallKeys };
    if (item.revision === current.revision) {
      return { ...base, action: "duplicate", currentRevision: current.revision, changedWithoutRevision: fingerprint(item) !== fingerprint(current) };
    }
    return { ...base, action: "outdated", currentRevision: current.revision };
  });
  const counts: Record<PlanAction, number> = { create: 0, update: 0, duplicate: 0, outdated: 0, reserved: 0 };
  for (const e of entries) counts[e.action]++;
  return { pkg, entries, counts, blocked: counts.reserved > 0, writable: counts.create + counts.update };
}

/* -------------------------------------------------------- applica */

/**
 * Applica un piano in modo atomico: restituisce una NUOVA libreria (quella vecchia non viene toccata).
 * Se il piano è bloccato o non c'è nulla da scrivere, restituisce un errore e nessuna modifica.
 * Gli stati di ripasso non sono qui: restano nello UserSnapshot legati a (id, recall.key),
 * quindi un aggiornamento non li tocca.
 */
export function applyImport(
  library: ImportedLibrary,
  plan: ImportPlan,
  now: Date,
  recordId: string,
): { ok: true; library: ImportedLibrary; record: ImportRecord } | { ok: false; reason: string } {
  if (plan.blocked) return { ok: false, reason: "Il pacchetto usa id riservati ai contenuti di sistema." };
  if (plan.writable === 0) return { ok: false, reason: "Nessun contenuto nuovo o aggiornato da importare." };

  // Rilegge lo stato attuale: se nel frattempo (altra scheda) qualcosa è cambiato, il piano non vale più.
  for (const e of plan.entries) {
    const cur = library.items[e.id]?.item;
    if (e.action === "create" && cur) return { ok: false, reason: "La libreria è cambiata dopo l'anteprima. Analizza di nuovo il pacchetto." };
    if (e.action === "update" && cur?.revision !== e.currentRevision) return { ok: false, reason: "La libreria è cambiata dopo l'anteprima. Analizza di nuovo il pacchetto." };
  }

  const importedAt = now.toISOString();
  const items = { ...library.items };
  const record: ImportRecord = {
    id: recordId,
    at: importedAt,
    packageId: plan.pkg.package.id,
    packageTitle: plan.pkg.package.title,
    generator: plan.pkg.package.generator,
    created: [],
    updated: [],
    skipped: [],
  };
  for (const e of plan.entries) {
    if (e.action === "create" || e.action === "update") {
      items[e.id] = { item: e.item, packageId: plan.pkg.package.id, importedAt };
      (e.action === "create" ? record.created : record.updated).push(e.id);
    } else {
      record.skipped.push(e.id);
    }
  }
  return { ok: true, library: { version: 1, items, history: [record, ...library.history].slice(0, MAX_HISTORY) }, record };
}

/** Rimuove dalla libreria i contenuti importati con un certo pacchetto (lo storico resta). */
export function removePackage(library: ImportedLibrary, packageId: string): ImportedLibrary {
  const items = Object.fromEntries(Object.entries(library.items).filter(([, e]) => e.packageId !== packageId));
  return { ...library, items };
}

/**
 * Legge una libreria salvata, scartando le voci corrotte invece di fallire.
 * Ogni contenuto viene rivalidato: localStorage è modificabile dall'utente o da estensioni.
 */
export function reviveLibrary(raw: unknown, systemIds: ReadonlySet<string>): ImportedLibrary {
  if (!isRecord(raw) || raw.version !== 1) return emptyLibrary();
  const items: Record<string, ImportedEntry> = {};
  if (isRecord(raw.items)) {
    for (const [id, entry] of Object.entries(raw.items)) {
      if (!isRecord(entry) || systemIds.has(id)) continue;
      const parsed = ContentItemSchema.safeParse(entry.item);
      if (!parsed.success || parsed.data.id !== id) continue;
      if (typeof entry.packageId !== "string" || typeof entry.importedAt !== "string") continue;
      items[id] = { item: parsed.data, packageId: entry.packageId, importedAt: entry.importedAt };
    }
  }
  const history: ImportRecord[] = [];
  if (Array.isArray(raw.history)) {
    for (const h of raw.history.slice(0, MAX_HISTORY)) {
      if (!isRecord(h) || typeof h.id !== "string" || typeof h.at !== "string" || typeof h.packageId !== "string" || typeof h.packageTitle !== "string") continue;
      const ids = (v: unknown) => (Array.isArray(v) ? v.filter((x): x is string => typeof x === "string") : []);
      history.push({
        id: h.id,
        at: h.at,
        packageId: h.packageId,
        packageTitle: h.packageTitle,
        generator: typeof h.generator === "string" ? h.generator : undefined,
        created: ids(h.created),
        updated: ids(h.updated),
        skipped: ids(h.skipped),
      });
    }
  }
  return { version: 1, items, history };
}

/** Esporta i contenuti importati come pacchetto valido e reimportabile (stesso formato dell'import). */
export function exportImportedPackage(library: ImportedLibrary, now: Date): ContentPackage {
  const day = now.toISOString().slice(0, 10);
  return {
    format: "netflow.content-package",
    schemaVersion: 1,
    package: { id: `export-importati-${day}`, title: `Contenuti importati — esportazione del ${day}`, language: "it", generator: "NetFlow — esportazione", createdAt: day },
    items: Object.values(library.items)
      .map((e) => e.item)
      .sort((a, b) => a.id.localeCompare(b.id)),
  };
}
