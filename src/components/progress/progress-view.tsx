"use client";

import { useMemo } from "react";
import { RATING_LABELS, RATINGS, TOPIC_STATUSES, TOPIC_STATUS_LABELS } from "@/domain/progress";
import { objectives, topicById, topics } from "@/data/catalog";
import { useHydrated, useSnapshot } from "@/data/progress-context";
import { useAllItems } from "@/components/content/use-learning";
import { computeStats } from "@/engine/progress-stats";

export function ProgressView() {
  const snapshot = useSnapshot();
  const hydrated = useHydrated();
  const items = useAllItems();
  const stats = useMemo(() => (hydrated ? computeStats(items, topics, objectives, snapshot, new Date()) : null), [hydrated, items, snapshot]);

  if (!stats) return <div className="h-48 animate-pulse rounded-[var(--radius-card)] bg-surface-2" aria-busy="true" />;

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-[24px] font-semibold tracking-[-0.02em] text-ink">Progressi</h1>
        <p className="mt-1 text-[14.5px] text-ink-2">Dati reali del tuo studio. Nessuna di queste cifre stima la probabilità di superare l&apos;esame.</p>
      </div>

      <section aria-labelledby="p-review">
        <h2 id="p-review" className="meta-strip mb-3">Ripasso (active recall)</h2>
        <dl className="grid grid-cols-2 gap-2 sm:grid-cols-4">
          <Stat label="In scadenza" value={stats.cards.due} />
          <Stat label="Carte in ripasso" value={stats.cards.inReview} hint={`su ${stats.cards.total}`} />
          <Stat label="Consolidate" value={stats.cards.consolidated} hint="stabilità ≥ 21 g" />
          <Stat label="Valutazioni" value={stats.reviews.total} />
        </dl>
        {stats.reviews.total > 0 && (
          <div className="mt-3 rounded-[var(--radius-card)] border border-line bg-surface p-4">
            <p className="meta-strip mb-2">Ultimi 7 giorni</p>
            <ul className="grid grid-cols-2 gap-x-4 gap-y-1 text-[14px] sm:grid-cols-4">
              {RATINGS.map((r) => (
                <li key={r} className="flex justify-between gap-2">
                  <span className="text-ink-2">{RATING_LABELS[r]}</span>
                  <span className="font-mono text-ink">{stats.reviews.last7[r]}</span>
                </li>
              ))}
            </ul>
          </div>
        )}
      </section>

      <section aria-labelledby="p-topics">
        <h2 id="p-topics" className="meta-strip mb-3">Argomenti · stato dichiarato</h2>
        <ul className="divide-y divide-line rounded-[var(--radius-card)] border border-line bg-surface">
          {TOPIC_STATUSES.map((s) => (
            <li key={s} className="flex items-center justify-between px-4 py-2.5 text-[14.5px]">
              <span className="text-ink-2">{TOPIC_STATUS_LABELS[s]}</span>
              <span className="font-mono text-ink">{stats.topicsByStatus[s]}</span>
            </li>
          ))}
        </ul>
      </section>

      <section aria-labelledby="p-content">
        <h2 id="p-content" className="meta-strip mb-3">Contenuti</h2>
        <dl className="grid grid-cols-3 gap-2">
          <Stat label="Visualizzati" value={stats.content.seen} hint={`su ${stats.content.total}`} />
          <Stat label="Approfonditi" value={stats.content.opened} />
          <Stat label="Salvati" value={stats.content.saved} />
        </dl>
      </section>

      {stats.hardestTopics.length > 0 && (
        <section aria-labelledby="p-hard">
          <h2 id="p-hard" className="meta-strip mb-3">Argomenti con più difficoltà</h2>
          <ul className="divide-y divide-line rounded-[var(--radius-card)] border border-line bg-surface">
            {stats.hardestTopics.map((t) => (
              <li key={t.topicId} className="flex items-center justify-between px-4 py-2.5 text-[14.5px]">
                <span className="text-ink">{topicById.get(t.topicId)?.title ?? t.topicId}</span>
                <span className="font-mono text-[13px] text-ink-3">{t.again} × da ristudiare</span>
              </li>
            ))}
          </ul>
        </section>
      )}

      <section aria-labelledby="p-cov">
        <h2 id="p-cov" className="meta-strip mb-3">Copertura del blueprint nella libreria</h2>
        <div className="rounded-[var(--radius-card)] border border-line bg-surface p-4">
          <p className="text-[14.5px] text-ink-2">
            <span className="font-mono text-ink">{stats.coverage.covered}</span> obiettivi su <span className="font-mono text-ink">{stats.coverage.total}</span> hanno almeno un contenuto NetFlow. Indica quanto è completa la libreria, non quanto sei preparato.
          </p>
          <div className="mt-3 h-1.5 overflow-hidden rounded-full bg-surface-3" aria-hidden>
            <div className="h-full bg-accent" style={{ width: `${(stats.coverage.covered / Math.max(1, stats.coverage.total)) * 100}%` }} />
          </div>
        </div>
      </section>
    </div>
  );
}

function Stat({ label, value, hint }: { label: string; value: number; hint?: string }) {
  return (
    <div className="rounded-[var(--radius-card)] border border-line bg-surface px-3.5 py-3">
      <dt className="text-[12.5px] text-ink-3">{label}</dt>
      <dd className="mt-1 font-mono text-[22px] font-medium leading-none text-ink">
        {value}
        {hint && <span className="ml-1.5 font-sans text-[12px] font-normal text-ink-3">{hint}</span>}
      </dd>
    </div>
  );
}
