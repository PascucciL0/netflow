"use client";

import Link from "next/link";
import { Bookmark, BookmarkCheck, Ellipsis, X } from "lucide-react";
import { useState } from "react";
import type { ContentItem } from "@/domain/content";
import { useDispatch, useSnapshot } from "@/data/progress-context";
import { Diagram } from "@/components/diagrams/registry";
import { MetaStrip } from "./meta";
import { useSeen } from "./use-seen";

/** Card del feed per contenuti di lettura. Azioni primarie visibili, secondarie nel menu "altro". */
export function ContentCard({ item, label }: { item: ContentItem; label?: string }) {
  const ref = useSeen<HTMLElement>(item.id);
  const dispatch = useDispatch();
  const p = useSnapshot().content[item.id];
  const [more, setMore] = useState(false);
  const saved = p?.saved ?? false;

  if (p?.hidden) {
    return (
      <div className="flex items-center justify-between rounded-[var(--radius-card)] border border-dashed border-line px-4 py-3 text-[14px] text-ink-3">
        Contenuto nascosto dal feed.
        <button type="button" className="font-medium text-accent-text" onClick={() => dispatch({ type: "content/hide", contentId: item.id, hidden: false })}>
          Annulla
        </button>
      </div>
    );
  }

  return (
    <article ref={ref} className="rounded-[var(--radius-card)] border border-line bg-surface p-4 shadow-[var(--shadow-card)] sm:p-5" aria-labelledby={`t-${item.id}`}>
      <MetaStrip item={item} extra={label} />
      <h3 id={`t-${item.id}`} className="mt-3 text-[18px] font-semibold leading-snug tracking-[-0.015em] text-ink">
        <Link href={`/c/${item.id}`} className="hover:text-accent-text">
          {item.title}
        </Link>
      </h3>
      <p className="mt-2 text-[15px] leading-relaxed text-ink-2">{item.summary}</p>

      {item.diagrams[0] && (
        <div className="mt-4">
          <Diagram id={item.diagrams[0].id} />
        </div>
      )}

      <div className="mt-4 flex items-center gap-2">
        <Link href={`/c/${item.id}`} className="inline-flex h-11 flex-1 items-center justify-center rounded-[var(--radius-control)] bg-surface-2 text-[14.5px] font-medium text-ink hover:bg-surface-3">
          Approfondisci
        </Link>
        <button
          type="button"
          onClick={() => dispatch({ type: "content/save", contentId: item.id, saved: !saved })}
          aria-pressed={saved}
          aria-label={saved ? "Rimuovi dai salvati" : "Salva"}
          className={`grid size-11 place-items-center rounded-[var(--radius-control)] border ${saved ? "border-accent/50 text-accent-text" : "border-line text-ink-2 hover:text-ink"}`}
        >
          {saved ? <BookmarkCheck size={19} aria-hidden /> : <Bookmark size={19} aria-hidden />}
        </button>
        <button
          type="button"
          onClick={() => setMore((v) => !v)}
          aria-expanded={more}
          aria-label="Altre azioni"
          className="grid size-11 place-items-center rounded-[var(--radius-control)] border border-line text-ink-2 hover:text-ink"
        >
          {more ? <X size={19} aria-hidden /> : <Ellipsis size={19} aria-hidden />}
        </button>
      </div>

      {more && (
        <div className="mt-2 grid grid-cols-3 gap-2" role="group" aria-label="Altre azioni">
          <SignalButton active={p?.signal === "difficult"} onClick={() => dispatch({ type: "content/signal", contentId: item.id, signal: p?.signal === "difficult" ? null : "difficult" })}>
            Difficile
          </SignalButton>
          <SignalButton active={p?.signal === "understood"} onClick={() => dispatch({ type: "content/signal", contentId: item.id, signal: p?.signal === "understood" ? null : "understood" })}>
            Compreso
          </SignalButton>
          <SignalButton active={false} onClick={() => dispatch({ type: "content/hide", contentId: item.id, hidden: true })}>
            Nascondi
          </SignalButton>
        </div>
      )}
    </article>
  );
}

function SignalButton({ active, onClick, children }: { active: boolean; onClick: () => void; children: React.ReactNode }) {
  return (
    <button
      type="button"
      aria-pressed={active}
      onClick={onClick}
      className={`h-11 rounded-[var(--radius-control)] border text-[14px] font-medium ${active ? "border-accent/50 bg-accent-soft text-accent-text" : "border-line text-ink-2 hover:text-ink"}`}
    >
      {children}
    </button>
  );
}
