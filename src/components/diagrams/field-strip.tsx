/**
 * Struttura di un frame/header come sequenza di campi.
 * Su schermi stretti i campi vanno a capo (layout HTML, non SVG) per restare leggibili.
 */
export interface FieldSpec {
  title: string;
  fields: { name: string; size: string; group?: "preamble" | "header" | "payload" | "trailer"; note?: string }[];
}

const GROUP_STYLE: Record<NonNullable<FieldSpec["fields"][number]["group"]>, string> = {
  preamble: "bg-surface-2 text-ink-3 border-line",
  header: "bg-accent-soft text-ink border-accent/30",
  payload: "bg-surface text-ink border-line-strong",
  trailer: "bg-surface-3 text-ink border-line-strong",
};

export function FieldStrip({ spec }: { spec: FieldSpec }) {
  return (
    <figure aria-label={spec.title}>
      <ol className="flex flex-wrap gap-1.5">
        {spec.fields.map((f) => (
          <li
            key={f.name}
            className={`min-w-[72px] flex-1 rounded-lg border px-2.5 py-2 ${GROUP_STYLE[f.group ?? "header"]}`}
          >
            <div className="text-[13px] font-semibold leading-tight">{f.name}</div>
            <div className="mt-0.5 font-mono text-[11px] text-ink-3">{f.size}</div>
          </li>
        ))}
      </ol>
      <div className="mt-2 flex flex-wrap gap-x-4 gap-y-1 font-mono text-[11px] text-ink-3">
        <span><span className="mr-1.5 inline-block size-2 rounded-sm bg-accent-soft ring-1 ring-accent/40" />header</span>
        <span><span className="mr-1.5 inline-block size-2 rounded-sm bg-surface-3 ring-1 ring-line-strong" />trailer</span>
        <span><span className="mr-1.5 inline-block size-2 rounded-sm bg-surface-2 ring-1 ring-line" />sincronizzazione</span>
      </div>
    </figure>
  );
}
