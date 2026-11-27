"use client";

import Link from "next/link";
import { RotateCcw } from "lucide-react";
import { ContentCard } from "@/components/content/content-card";
import { RecallCard } from "@/components/content/recall-card";
import { useFeed } from "@/components/content/use-learning";
import { FEED_REASON_LABELS } from "@/engine/feed";
import { WhyThis } from "@/components/explain/why-this";

export function FeedView() {
  const { feed, refresh } = useFeed();

  if (!feed) return <FeedSkeleton />;

  return (
    <div>
      <h1 className="sr-only">Feed</h1>
      {feed.coldStart && (
        <section className="mb-5 rounded-[var(--radius-card)] border border-accent/30 bg-accent-soft p-4 sm:p-5" aria-label="Primi passi">
          <p className="meta-strip text-accent-text">Primi passi</p>
          <p className="mt-2 text-[15px] leading-relaxed text-ink">
            Il feed parte dai fondamenti. Indica nella Libreria cosa stai studiando nel corso: NetFlow adatterà ripassi e contenuti a quel punto del percorso.
          </p>
          <Link href="/library" className="mt-3 inline-flex h-11 items-center rounded-[var(--radius-control)] bg-accent px-4 text-[14.5px] font-medium text-on-accent">
            Scegli gli argomenti
          </Link>
        </section>
      )}

      {feed.entries.length === 0 ? (
        <div className="rounded-[var(--radius-card)] border border-line bg-surface p-6 text-center">
          <p className="text-[16px] font-medium text-ink">Per ora hai visto tutto.</p>
          <p className="mt-1 text-[14.5px] text-ink-2">I contenuti già letti tornano dopo qualche ora; i ripassi quando scadono.</p>
        </div>
      ) : (
        <ol className="space-y-4">
          {feed.entries.map((e) => (
            <li key={e.key}>
              {e.type === "recall" && e.recallKey ? (
                <RecallCard item={e.item} recallKey={e.recallKey} label={FEED_REASON_LABELS[e.reason]} />
              ) : (
                <ContentCard item={e.item} label={FEED_REASON_LABELS[e.reason]} />
              )}
              <WhyThis entry={e} />
            </li>
          ))}
        </ol>
      )}

      <div className="mt-8 flex flex-col items-center gap-2 pb-4 text-center">
        <p className="text-[13px] text-ink-3">Fine del feed per ora. Nessuno scorrimento infinito.</p>
        <button type="button" onClick={refresh} className="inline-flex h-11 items-center gap-2 rounded-[var(--radius-control)] border border-line-strong px-4 text-[14.5px] font-medium text-ink hover:bg-surface-2">
          <RotateCcw size={16} aria-hidden /> Aggiorna il feed
        </button>
      </div>
    </div>
  );
}

function FeedSkeleton() {
  return (
    <div className="space-y-4" aria-busy="true" aria-label="Caricamento del feed">
      {[0, 1, 2].map((i) => (
        <div key={i} className="rounded-[var(--radius-card)] border border-line bg-surface p-5">
          <div className="h-3 w-40 animate-pulse rounded bg-surface-3" />
          <div className="mt-4 h-5 w-3/4 animate-pulse rounded bg-surface-3" />
          <div className="mt-3 h-4 w-full animate-pulse rounded bg-surface-2" />
          <div className="mt-2 h-4 w-5/6 animate-pulse rounded bg-surface-2" />
        </div>
      ))}
    </div>
  );
}
