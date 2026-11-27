"use client";

import Link from "next/link";
import { AlertTriangle, Check, ClipboardCopy, Download, FileUp, History, RotateCcw, Trash2, X } from "lucide-react";
import { useId, useMemo, useRef, useState } from "react";
import { DIFFICULTY_LABELS, KIND_LABELS } from "@/domain/content";
import { IMPORT_LIMITS } from "@/domain/import-schema";
import { objectives, seedItemById, topicById, topics } from "@/data/catalog";
import { downloadJson } from "@/data/backup";
import { useHydrated } from "@/data/progress-context";
import { exportImportedPackage, parsePackage, planImport, type CatalogRefs, type ImportIssue, type ImportPlan, type ImportRecord, type ParseStage, type PlanAction } from "@/data/import-plan";
import { buildContentPrompt, EXAMPLE_PACKAGE } from "@/data/import-prompt";
import { commitImport, getImportedLibrary, removeImportedPackage, SYSTEM_IDS, useImportedLibrary } from "@/data/import-store";
import { DIAGRAMS } from "@/components/diagrams/registry";

type Phase =
  | { step: "input" }
  | { step: "errors"; stage: ParseStage; errors: ImportIssue[] }
  | { step: "preview"; plan: ImportPlan; warnings: ImportIssue[] }
  | { step: "done"; record: ImportRecord };

const STAGE_TITLE: Record<ParseStage, string> = {
  size: "File troppo grande",
  json: "Il testo non è JSON valido",
  schema: "Il pacchetto non rispetta il formato",
  safety: "Contenuto non sicuro",
  references: "Riferimenti inesistenti",
};

const ACTION_LABEL: Record<PlanAction, string> = {
  create: "Nuovo",
  update: "Aggiornato",
  duplicate: "Già presente",
  outdated: "Versione più vecchia",
  reserved: "Id riservato",
};

const ACTION_STYLE: Record<PlanAction, string> = {
  create: "bg-easy/12 text-easy",
  update: "bg-accent-soft text-accent-text",
  duplicate: "bg-surface-3 text-ink-2",
  outdated: "bg-hard/12 text-hard",
  reserved: "bg-again/12 text-again",
};

const fmtDate = (iso: string) => new Intl.DateTimeFormat("it-IT", { dateStyle: "medium", timeStyle: "short" }).format(new Date(iso));

const plural = (n: number, one: string, many: string) => `${n} ${n === 1 ? one : many}`;

export function ImportView() {
  const hydrated = useHydrated();
  const library = useImportedLibrary();
  const [text, setText] = useState("");
  const [fileName, setFileName] = useState<string | null>(null);
  const [phase, setPhase] = useState<Phase>({ step: "input" });
  const [commitError, setCommitError] = useState<string | null>(null);
  const [copied, setCopied] = useState(false);
  const fileRef = useRef<HTMLInputElement>(null);
  const textId = useId();

  const refs = useMemo<CatalogRefs>(
    () => ({
      topicIds: new Set(topics.map((t) => t.id)),
      objectiveIds: new Set(objectives.map((o) => o.id)),
      diagramIds: new Set(Object.keys(DIAGRAMS)),
      contentIds: new Set([...seedItemById.keys(), ...Object.keys(library.items)]),
    }),
    [library.items],
  );

  const analyze = (source: string) => {
    setCommitError(null);
    const res = parsePackage(source, refs);
    if (!res.ok) {
      setPhase({ step: "errors", stage: res.stage, errors: res.errors });
      return;
    }
    setPhase({ step: "preview", plan: planImport(res.pkg, SYSTEM_IDS, getImportedLibrary()), warnings: res.warnings });
  };

  const onFile = async (file: File) => {
    setFileName(file.name);
    if (file.size > IMPORT_LIMITS.maxFileBytes) {
      setText("");
      setPhase({ step: "errors", stage: "size", errors: [{ path: "", message: `File troppo grande (${(file.size / 1024 / 1024).toFixed(1)} MB). Il limite è 2 MB: dividilo in più pacchetti.` }] });
      return;
    }
    const content = await file.text();
    setText(content);
    analyze(content);
  };

  const confirm = (plan: ImportPlan) => {
    const res = commitImport(plan);
    if (!res.ok) {
      setCommitError(res.reason);
      return;
    }
    setPhase({ step: "done", record: res.record });
    setText("");
    setFileName(null);
  };

  const reset = () => {
    setPhase({ step: "input" });
    setCommitError(null);
  };

  const copyPrompt = async () => {
    const prompt = buildContentPrompt(topics, objectives, Object.keys(DIAGRAMS));
    try {
      await navigator.clipboard.writeText(prompt);
      setCopied(true);
      setTimeout(() => setCopied(false), 2500);
    } catch {
      downloadText("netflow-prompt-contenuti.txt", prompt);
    }
  };

  const importedCount = Object.keys(library.items).length;

  return (
    <div className="space-y-8 pb-6">
      <header>
        <h1 className="text-[24px] font-semibold tracking-[-0.02em] text-ink">Importa contenuti</h1>
        <p className="mt-1 text-[14.5px] leading-relaxed text-ink-2">
          Aggiungi appunti e lezioni in formato <span className="font-mono text-[13.5px]">netflow.content-package</span>. Prima vedi un&apos;anteprima, poi confermi: se un solo contenuto non è valido non viene importato nulla.
        </p>
      </header>

      {phase.step === "done" ? (
        <DonePanel record={phase.record} onAgain={reset} />
      ) : phase.step === "preview" ? (
        <PreviewPanel plan={phase.plan} warnings={phase.warnings} commitError={commitError} onConfirm={() => confirm(phase.plan)} onCancel={reset} />
      ) : (
        <section aria-labelledby="imp-src" className="space-y-3">
          <h2 id="imp-src" className="meta-strip">Pacchetto da importare</h2>
          <div className="flex flex-wrap gap-2">
            <button
              type="button"
              onClick={() => fileRef.current?.click()}
              className="inline-flex h-11 items-center gap-2 rounded-[var(--radius-control)] border border-line-strong bg-surface px-4 text-[14.5px] font-medium text-ink hover:bg-surface-2"
            >
              <FileUp size={16} aria-hidden /> Scegli un file .json
            </button>
            <input
              ref={fileRef}
              type="file"
              accept="application/json,.json"
              className="sr-only"
              tabIndex={-1}
              aria-hidden
              onChange={(e) => {
                const f = e.target.files?.[0];
                if (f) void onFile(f);
                e.target.value = "";
              }}
            />
            {fileName && <span className="self-center font-mono text-[13px] text-ink-3">{fileName}</span>}
          </div>
          <label htmlFor={textId} className="block text-[14px] text-ink-2">
            Oppure incolla qui il JSON
          </label>
          <textarea
            id={textId}
            value={text}
            onChange={(e) => {
              setText(e.target.value);
              setFileName(null);
              if (phase.step === "errors") setPhase({ step: "input" });
            }}
            spellCheck={false}
            rows={9}
            placeholder={'{\n  "format": "netflow.content-package",\n  "schemaVersion": 1,\n  ...\n}'}
            className="block w-full resize-y rounded-[var(--radius-card)] border border-line bg-surface p-3 font-mono text-[13px] leading-relaxed text-ink placeholder:text-ink-3 focus:border-accent focus:outline-none"
          />
          <div className="flex gap-2">
            <button
              type="button"
              disabled={text.trim() === ""}
              onClick={() => analyze(text)}
              className="h-11 flex-1 rounded-[var(--radius-control)] bg-accent px-4 text-[14.5px] font-medium text-on-accent disabled:opacity-40 sm:flex-none"
            >
              Analizza il pacchetto
            </button>
          </div>
          {phase.step === "errors" && <ErrorPanel stage={phase.stage} errors={phase.errors} />}
        </section>
      )}

      <section aria-labelledby="imp-help" className="rounded-[var(--radius-card)] border border-line bg-surface p-4">
        <h2 id="imp-help" className="text-[15.5px] font-semibold text-ink">Preparare un pacchetto con ChatGPT o Claude</h2>
        <p className="mt-1.5 text-[14px] leading-relaxed text-ink-2">
          Copia il prompt, aggiungi in fondo i tuoi appunti e incolla qui la risposta. Il prompt contiene gli argomenti, gli obiettivi del blueprint e i diagrammi che NetFlow riconosce. NetFlow non usa servizi AI: la validazione avviene qui, nel browser.
        </p>
        <div className="mt-3 flex flex-wrap gap-2">
          <button type="button" onClick={() => void copyPrompt()} className="inline-flex h-11 items-center gap-2 rounded-[var(--radius-control)] bg-surface-2 px-4 text-[14.5px] font-medium text-ink hover:bg-surface-3">
            {copied ? <Check size={16} aria-hidden /> : <ClipboardCopy size={16} aria-hidden />} {copied ? "Prompt copiato" : "Copia il prompt"}
          </button>
          <button type="button" onClick={() => downloadJson("netflow-esempio-pacchetto.json", EXAMPLE_PACKAGE)} className="inline-flex h-11 items-center gap-2 rounded-[var(--radius-control)] bg-surface-2 px-4 text-[14.5px] font-medium text-ink hover:bg-surface-3">
            <Download size={16} aria-hidden /> Scarica un esempio
          </button>
        </div>
        <span className="sr-only" aria-live="polite">{copied ? "Prompt copiato negli appunti" : ""}</span>
      </section>

      <HistoryPanel hydrated={hydrated} history={library.history} importedCount={importedCount} activePackages={new Set(Object.values(library.items).map((e) => e.packageId))} />
    </div>
  );
}

function downloadText(filename: string, text: string) {
  const url = URL.createObjectURL(new Blob([text], { type: "text/plain;charset=utf-8" }));
  const a = document.createElement("a");
  a.href = url;
  a.download = filename;
  a.click();
  URL.revokeObjectURL(url);
}

function IssueList({ issues, tone }: { issues: ImportIssue[]; tone: "error" | "warning" }) {
  // Raggruppa per contenuto: chi corregge il file ragiona per contenuto, non per campo.
  const groups = new Map<string, { label: string; issues: ImportIssue[] }>();
  for (const i of issues) {
    const key = i.itemIndex === undefined ? "pkg" : `item-${i.itemIndex}`;
    const label = i.itemIndex === undefined ? "Pacchetto" : `Contenuto ${i.itemIndex + 1}${i.itemTitle ? ` · ${i.itemTitle}` : i.itemId ? ` · ${i.itemId}` : ""}`;
    const g = groups.get(key) ?? { label, issues: [] };
    g.issues.push(i);
    groups.set(key, g);
  }
  return (
    <div className="space-y-3">
      {[...groups.entries()].map(([key, g]) => (
        <div key={key}>
          <p className="text-[13.5px] font-medium text-ink">{g.label}</p>
          <ul className="mt-1 space-y-1">
            {g.issues.map((i, n) => (
              <li key={n} className="text-[14px] leading-snug text-ink-2">
                <span className={tone === "error" ? "text-again" : "text-hard"}>•</span> {i.message}
                {i.path && <span className="ml-1 break-all font-mono text-[12px] text-ink-3">({i.path})</span>}
              </li>
            ))}
          </ul>
        </div>
      ))}
    </div>
  );
}

function ErrorPanel({ stage, errors }: { stage: ParseStage; errors: ImportIssue[] }) {
  return (
    <div role="alert" className="rounded-[var(--radius-card)] border border-again/40 bg-again/5 p-4">
      <p className="flex items-center gap-2 text-[15px] font-semibold text-again">
        <X size={17} aria-hidden /> {STAGE_TITLE[stage]}
      </p>
      <p className="mt-1 text-[13.5px] text-ink-2">Nessun contenuto è stato importato. Correggi {errors.length === 1 ? "il problema" : `i ${errors.length} problemi`} e analizza di nuovo.</p>
      <div className="mt-3">
        <IssueList issues={errors} tone="error" />
      </div>
    </div>
  );
}

function PreviewPanel({ plan, warnings, commitError, onConfirm, onCancel }: { plan: ImportPlan; warnings: ImportIssue[]; commitError: string | null; onConfirm: () => void; onCancel: () => void }) {
  const { pkg, counts } = plan;
  const summary = (["create", "update", "duplicate", "outdated", "reserved"] as const).filter((a) => counts[a] > 0);
  const recallTotal = plan.entries.filter((e) => e.action === "create" || e.action === "update").reduce((n, e) => n + e.item.recall.length, 0);

  return (
    <section aria-labelledby="imp-prev" className="space-y-4">
      <div className="rounded-[var(--radius-card)] border border-line bg-surface p-4">
        <h2 id="imp-prev" className="meta-strip">Anteprima</h2>
        <p className="mt-2 text-[17px] font-semibold text-ink">{pkg.package.title}</p>
        <p className="mt-0.5 font-mono text-[12.5px] text-ink-3">
          {pkg.package.id} · {pkg.package.createdAt}
          {pkg.package.generator ? ` · ${pkg.package.generator}` : ""}
        </p>
        {pkg.package.notes && <p className="mt-2 text-[14px] text-ink-2">{pkg.package.notes}</p>}
        <div className="mt-3 flex flex-wrap gap-1.5">
          {summary.map((a) => (
            <span key={a} className={`rounded-full px-2.5 py-1 text-[12.5px] font-medium ${ACTION_STYLE[a]}`}>
              {ACTION_LABEL[a]}: {counts[a]}
            </span>
          ))}
        </div>
        {plan.writable > 0 && !plan.blocked && (
          <p className="mt-3 text-[14px] text-ink-2">
            Verranno scritti {plural(plan.writable, "contenuto", "contenuti")} con {plural(recallTotal, "domanda", "domande")} di recall. I ripassi già fatti restano legati allo stesso id.
          </p>
        )}
      </div>

      {plan.blocked && (
        <div role="alert" className="rounded-[var(--radius-card)] border border-again/40 bg-again/5 p-4 text-[14px] text-ink-2">
          <p className="font-semibold text-again">Import bloccato</p>
          Alcuni id appartengono alla libreria di sistema e non possono essere sovrascritti. Cambia l&apos;id di questi contenuti (es. con un prefisso personale) e riprova.
        </div>
      )}

      {warnings.length > 0 && (
        <div className="rounded-[var(--radius-card)] border border-hard/40 bg-hard/5 p-4">
          <p className="flex items-center gap-2 text-[14.5px] font-semibold text-hard">
            <AlertTriangle size={16} aria-hidden /> Avvisi (l&apos;import è comunque possibile)
          </p>
          <div className="mt-2">
            <IssueList issues={warnings} tone="warning" />
          </div>
        </div>
      )}

      <ul className="divide-y divide-line rounded-[var(--radius-card)] border border-line bg-surface">
        {plan.entries.map((e) => (
          <li key={e.id} className="px-4 py-3">
            <div className="flex items-start justify-between gap-3">
              <div className="min-w-0">
                <p className="font-medium leading-snug text-ink">{e.title}</p>
                <p className="mt-0.5 text-[13px] text-ink-3">
                  {KIND_LABELS[e.item.kind]} · {topicById.get(e.item.topicId)?.title ?? e.item.topicId} · {DIFFICULTY_LABELS[e.item.difficulty]} · {e.item.language.toUpperCase()}
                  {e.item.recall.length > 0 ? ` · ${plural(e.item.recall.length, "domanda", "domande")}` : ""}
                </p>
                <p className="mt-0.5 break-all font-mono text-[12px] text-ink-3">
                  {e.id} · rev. {e.currentRevision !== undefined && e.action !== "create" ? `${e.currentRevision} → ` : ""}
                  {e.item.revision}
                </p>
              </div>
              <span className={`shrink-0 rounded-full px-2.5 py-1 text-[12px] font-medium ${ACTION_STYLE[e.action]}`}>{ACTION_LABEL[e.action]}</span>
            </div>
            {e.removedRecallKeys.length > 0 && (
              <p className="mt-1.5 text-[13px] text-hard">
                Domande rimosse in questa revisione: {e.removedRecallKeys.join(", ")}. Non compariranno più nei ripassi; lo storico resta.
              </p>
            )}
            {e.changedWithoutRevision && <p className="mt-1.5 text-[13px] text-hard">Il testo è diverso da quello importato ma la revisione è la stessa: per aggiornarlo incrementa &quot;revision&quot;.</p>}
            {e.action === "outdated" && <p className="mt-1.5 text-[13px] text-ink-3">È già importata la revisione {e.currentRevision}: questa versione viene ignorata.</p>}
          </li>
        ))}
      </ul>

      {commitError && (
        <p role="alert" className="rounded-[var(--radius-control)] border border-again/40 bg-again/5 p-3 text-[14px] text-again">
          {commitError}
        </p>
      )}

      <div className="sticky bottom-[calc(4.5rem+env(safe-area-inset-bottom))] z-10 flex gap-2 rounded-[var(--radius-card)] bg-bg/90 py-2 backdrop-blur-md lg:bottom-0">
        <button
          type="button"
          onClick={onConfirm}
          disabled={plan.blocked || plan.writable === 0}
          className="h-11 flex-1 rounded-[var(--radius-control)] bg-accent px-4 text-[14.5px] font-medium text-on-accent disabled:opacity-40"
        >
          {plan.writable === 0 ? "Niente di nuovo da importare" : `Importa ${plural(plan.writable, "contenuto", "contenuti")}`}
        </button>
        <button type="button" onClick={onCancel} className="h-11 rounded-[var(--radius-control)] border border-line-strong px-4 text-[14.5px] font-medium text-ink">
          Annulla
        </button>
      </div>
    </section>
  );
}

function DonePanel({ record, onAgain }: { record: ImportRecord; onAgain: () => void }) {
  return (
    <section role="status" className="rounded-[var(--radius-card)] border border-easy/40 bg-easy/5 p-4">
      <p className="flex items-center gap-2 text-[16px] font-semibold text-easy">
        <Check size={18} aria-hidden /> Import completato
      </p>
      <p className="mt-1.5 text-[14.5px] text-ink-2">
        {record.packageTitle}: {plural(record.created.length, "nuovo", "nuovi")}, {plural(record.updated.length, "aggiornato", "aggiornati")}
        {record.skipped.length > 0 ? `, ${plural(record.skipped.length, "ignorato", "ignorati")}` : ""}. I contenuti compaiono nel feed alla prossima apertura e in libreria.
      </p>
      <div className="mt-3 flex flex-wrap gap-2">
        <Link href="/library" className="inline-flex h-11 items-center rounded-[var(--radius-control)] bg-accent px-4 text-[14.5px] font-medium text-on-accent">
          Apri la libreria
        </Link>
        <button type="button" onClick={onAgain} className="inline-flex h-11 items-center gap-2 rounded-[var(--radius-control)] border border-line-strong px-4 text-[14.5px] font-medium text-ink">
          <RotateCcw size={15} aria-hidden /> Importa un altro pacchetto
        </button>
      </div>
    </section>
  );
}

function HistoryPanel({ hydrated, history, importedCount, activePackages }: { hydrated: boolean; history: ImportRecord[]; importedCount: number; activePackages: Set<string> }) {
  const [confirming, setConfirming] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);
  if (!hydrated) return null;
  return (
    <section aria-labelledby="imp-hist">
      <h2 id="imp-hist" className="meta-strip mb-3 flex items-center gap-1.5">
        <History size={14} aria-hidden /> Storico importazioni
      </h2>
      <p className="mb-3 text-[14px] text-ink-2">
        {importedCount === 0
          ? "Nessun contenuto importato in questo browser."
          : `${plural(importedCount, "contenuto importato", "contenuti importati")} in questo browser. Il backup dei progressi non li contiene: esportali come pacchetto per conservarli o spostarli su un altro dispositivo.`}
      </p>
      {importedCount > 0 && (
        <button
          type="button"
          onClick={() => downloadJson(`netflow-contenuti-importati-${new Date().toISOString().slice(0, 10)}.json`, exportImportedPackage(getImportedLibrary(), new Date()))}
          className="mb-3 inline-flex h-11 items-center gap-2 rounded-[var(--radius-control)] bg-surface-2 px-4 text-[14.5px] font-medium text-ink hover:bg-surface-3"
        >
          <Download size={16} aria-hidden /> Esporta i contenuti importati
        </button>
      )}
      {history.length > 0 && (
        <ul className="divide-y divide-line rounded-[var(--radius-card)] border border-line bg-surface">
          {history.map((h) => (
            <li key={h.id} className="px-4 py-3">
              <div className="flex items-start justify-between gap-3">
                <div className="min-w-0">
                  <p className="font-medium text-ink">{h.packageTitle}</p>
                  <p className="mt-0.5 text-[13px] text-ink-3">
                    {fmtDate(h.at)} · {plural(h.created.length, "nuovo", "nuovi")} · {plural(h.updated.length, "aggiornato", "aggiornati")}{h.skipped.length > 0 ? ` · ${plural(h.skipped.length, "ignorato", "ignorati")}` : ""}
                    {h.generator ? ` · ${h.generator}` : ""}
                  </p>
                </div>
                {activePackages.has(h.packageId) && confirming !== h.id && (
                  <button type="button" onClick={() => setConfirming(h.id)} aria-label={`Rimuovi i contenuti di ${h.packageTitle}`} className="grid h-10 w-10 shrink-0 place-items-center rounded-[var(--radius-control)] text-ink-3 hover:bg-surface-2 hover:text-again">
                    <Trash2 size={17} aria-hidden />
                  </button>
                )}
              </div>
              {confirming === h.id && (
                <div className="mt-2 rounded-[var(--radius-control)] border border-again/30 p-3">
                  <p className="text-[13.5px] text-ink-2">Rimuovo dalla libreria tutti i contenuti del pacchetto «{h.packageId}»? I ripassi già fatti restano nello storico e tornano attivi se reimporti il file.</p>
                  <div className="mt-2 flex gap-2">
                    <button
                      type="button"
                      onClick={() => {
                        const r = removeImportedPackage(h.packageId);
                        setError(r.ok ? null : r.reason);
                        setConfirming(null);
                      }}
                      className="h-10 flex-1 rounded-[var(--radius-control)] bg-again px-3 text-[14px] font-medium text-white"
                    >
                      Rimuovi
                    </button>
                    <button type="button" onClick={() => setConfirming(null)} className="h-10 flex-1 rounded-[var(--radius-control)] border border-line-strong px-3 text-[14px] font-medium text-ink">
                      Annulla
                    </button>
                  </div>
                </div>
              )}
            </li>
          ))}
        </ul>
      )}
      {error && <p role="alert" className="mt-2 text-[14px] text-again">{error}</p>}
    </section>
  );
}
