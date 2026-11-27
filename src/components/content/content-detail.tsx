import Link from "next/link";
import { ExternalLink } from "lucide-react";
import { PROVENANCE_LABELS, type ContentItem } from "@/domain/content";
import { objectiveById, seedItemById, topicById } from "@/data/catalog";
import { Diagram } from "@/components/diagrams/registry";
import { Markdown } from "./markdown";
import { MetaStrip } from "./meta";
import { DetailActions, DetailRecall, OpenTracker } from "./detail-client";
import { BackLink } from "./back-link";

/** Pagina di approfondimento. Server component: il Markdown viene renderizzato lato server. */
export function ContentDetail({ item }: { item: ContentItem }) {
  const topic = topicById.get(item.topicId);
  const related = item.related.map((id) => seedItemById.get(id)).filter((x): x is ContentItem => Boolean(x));
  const prereqs = item.prerequisites.map((id) => topicById.get(id)?.title ?? id);

  return (
    <article className="pb-6">
      <OpenTracker contentId={item.id} />
      <BackLink />
      <MetaStrip item={item} />
      <h1 className="mt-3 text-[26px] font-semibold leading-tight tracking-[-0.02em] text-ink sm:text-[30px]">{item.title}</h1>
      <p className="mt-3 text-[16.5px] leading-relaxed text-ink-2">{item.summary}</p>

      <DetailActions contentId={item.id} />

      {item.diagrams.map((d) => (
        <div key={d.id} className="mt-6">
          <Diagram id={d.id} caption={d.caption} />
        </div>
      ))}

      {item.body && (
        <div className="mt-6">
          <Markdown source={item.body} />
        </div>
      )}

      {item.recall.length > 0 && (
        <section className="mt-10" aria-labelledby="recall-h">
          <h2 id="recall-h" className="text-[17px] font-semibold text-ink">Verifica attiva</h2>
          <p className="mt-1 text-[14px] text-ink-3">La valutazione pianifica il prossimo ripasso. La sola lettura non conta come ripasso.</p>
          <div className="mt-4 space-y-4">
            {item.recall.map((r) => (
              <DetailRecall key={r.key} item={item} recallKey={r.key} />
            ))}
          </div>
        </section>
      )}

      <section className="mt-10 space-y-5 border-t border-line pt-6 text-[14px]" aria-label="Informazioni sul contenuto">
        <dl className="grid grid-cols-[auto_1fr] gap-x-4 gap-y-2">
          <dt className="text-ink-3">Argomento</dt>
          <dd className="text-ink">{topic?.title ?? item.topicId}</dd>
          {prereqs.length > 0 && (
            <>
              <dt className="text-ink-3">Prerequisiti</dt>
              <dd className="text-ink">{prereqs.join(", ")}</dd>
            </>
          )}
          <dt className="text-ink-3">Natura</dt>
          <dd className="text-ink">{PROVENANCE_LABELS[item.provenance]}{item.reviewStatus === "proposed" && <span className="text-ink-3"> · bozza da rivedere</span>}</dd>
          <dt className="text-ink-3">Aggiornato</dt>
          <dd className="font-mono text-[13px] text-ink">{item.updatedAt} · rev. {item.revision}</dd>
        </dl>

        {item.objectives.length > 0 && (
          <div>
            <h2 className="meta-strip mb-2">Obiettivi del blueprint CCNA v2.0</h2>
            <ul className="space-y-1.5">
              {item.objectives.map((o) => (
                <li key={o} className="flex gap-2">
                  <span className="font-mono text-[13px] text-accent-text">{o.split(":")[1]}</span>
                  <span className="text-ink-2" lang="en">{objectiveById.get(o)?.title}</span>
                </li>
              ))}
            </ul>
          </div>
        )}

        <div>
          <h2 className="meta-strip mb-2">Fonti</h2>
          <ul className="space-y-1.5">
            {item.sources.map((s) => (
              <li key={s.title} className="text-ink-2">
                {s.url ? (
                  <a href={s.url} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-1 text-accent-text underline-offset-4 hover:underline">
                    {s.title} <ExternalLink size={13} aria-hidden />
                  </a>
                ) : (
                  <span className="text-ink">{s.title}</span>
                )}
                <span className="text-ink-3"> · {s.publisher}</span>
                <span className="text-ink-3"> · {s.verifiedOn ? `consultata il ${s.verifiedOn}` : "da verificare"}</span>
              </li>
            ))}
          </ul>
        </div>

        {related.length > 0 && (
          <div>
            <h2 className="meta-strip mb-2">Contenuti correlati</h2>
            <ul className="divide-y divide-line rounded-[var(--radius-card)] border border-line bg-surface">
              {related.map((r) => (
                <li key={r.id}>
                  <Link href={`/c/${r.id}`} className="block px-4 py-3 hover:bg-surface-2">
                    <span className="block font-medium text-ink">{r.title}</span>
                    <span className="block text-[13px] text-ink-3">{topicById.get(r.topicId)?.title}</span>
                  </Link>
                </li>
              ))}
            </ul>
          </div>
        )}
      </section>
    </article>
  );
}
