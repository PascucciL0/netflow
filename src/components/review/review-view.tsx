"use client";

import Link from "next/link";
import { useState } from "react";
import { RecallCard } from "@/components/content/recall-card";
import { useDueCards, type DueCard } from "@/components/content/use-learning";
import { useHydrated } from "@/data/progress-context";

/**
 * Sessione di ripasso programmato: una carta alla volta, nell'ordine di scadenza.
 * La coda viene fissata all'inizio della sessione per evitare salti mentre si valuta.
 */
export function ReviewView() {
  const hydrated = useHydrated();
  const due = useDueCards();
  const [queue, setQueue] = useState<DueCard[] | null>(null);
  const [index, setIndex] = useState(0);
  const [done, setDone] = useState(0);

  if (!hydrated) return <div className="h-48 animate-pulse rounded-[var(--radius-card)] bg-surface-2" aria-busy="true" />;

  if (!queue) {
    return (
      <div>
        <h1 className="text-[24px] font-semibold tracking-[-0.02em] text-ink">Ripasso</h1>
        {due.length === 0 ? (
          <div className="mt-5 rounded-[var(--radius-card)] border border-line bg-surface p-5">
            <p className="text-[16px] font-medium text-ink">Nessun ripasso in scadenza.</p>
            <p className="mt-1 text-[14.5px] leading-relaxed text-ink-2">
              Le domande di active recall entrano in ripasso quando le valuti nel feed o in un approfondimento. NetFlow le ripropone quando stanno per essere dimenticate.
            </p>
            <Link href="/" className="mt-4 inline-flex h-11 items-center rounded-[var(--radius-control)] bg-surface-2 px-4 text-[14.5px] font-medium text-ink">
              Torna al feed
            </Link>
          </div>
        ) : (
          <div className="mt-5 rounded-[var(--radius-card)] border border-line bg-surface p-5">
            <p className="font-mono text-[32px] font-medium leading-none text-ink">{due.length}</p>
            <p className="mt-2 text-[15px] text-ink-2">{due.length === 1 ? "domanda da ripassare" : "domande da ripassare"}. Puoi fermarti quando vuoi: i progressi vengono salvati a ogni valutazione.</p>
            <button type="button" onClick={() => setQueue(due)} className="mt-4 h-11 w-full rounded-[var(--radius-control)] bg-accent text-[15px] font-medium text-on-accent">
              Inizia
            </button>
          </div>
        )}
      </div>
    );
  }

  const current = queue[index];
  const finished = index >= queue.length;

  return (
    <div>
      <div className="mb-4 flex items-center justify-between">
        <h1 className="text-[18px] font-semibold text-ink">Ripasso</h1>
        <span className="font-mono text-[13px] text-ink-3" aria-live="polite">
          {Math.min(index + 1, queue.length)}/{queue.length}
        </span>
      </div>
      <div className="mb-5 h-1 overflow-hidden rounded-full bg-surface-3" aria-hidden>
        <div className="h-full bg-accent transition-[width]" style={{ width: `${(Math.min(index, queue.length) / queue.length) * 100}%` }} />
      </div>
      {finished ? (
        <div className="rounded-[var(--radius-card)] border border-line bg-surface p-5">
          <p className="text-[16px] font-medium text-ink">Sessione completata: {done} {done === 1 ? "valutazione" : "valutazioni"}.</p>
          <div className="mt-4 flex gap-2">
            <Link href="/" className="inline-flex h-11 flex-1 items-center justify-center rounded-[var(--radius-control)] bg-surface-2 text-[14.5px] font-medium text-ink">Torna al feed</Link>
            <button type="button" onClick={() => { setQueue(null); setIndex(0); setDone(0); }} className="h-11 flex-1 rounded-[var(--radius-control)] border border-line-strong text-[14.5px] font-medium text-ink">
              Nuova sessione
            </button>
          </div>
        </div>
      ) : (
        <div>
          <RecallCard key={current.cardId} item={current.item} recallKey={current.recallKey} onRated={() => setDone((d) => d + 1)} />
          <button type="button" onClick={() => setIndex((i) => i + 1)} className="mt-3 h-11 w-full rounded-[var(--radius-control)] border border-line-strong text-[14.5px] font-medium text-ink hover:bg-surface-2">
            Avanti
          </button>
        </div>
      )}
    </div>
  );
}
