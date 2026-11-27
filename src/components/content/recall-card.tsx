"use client";

import Link from "next/link";
import { useId, useMemo, useState } from "react";
import { cardIdOf, type ContentItem } from "@/domain/content";
import { RATING_LABELS, RATINGS, type ReviewRating } from "@/domain/progress";
import { useDispatch, useSnapshot } from "@/data/progress-context";
import { formatInterval, newReviewState, previewIntervals } from "@/engine/scheduler";
import { MetaStrip } from "./meta";

const RATING_STYLE: Record<ReviewRating, string> = {
  again: "text-again border-again/40 hover:bg-again/10",
  hard: "text-hard border-hard/40 hover:bg-hard/10",
  good: "text-good border-good/40 hover:bg-good/10",
  easy: "text-easy border-easy/40 hover:bg-easy/10",
};

/**
 * Active recall: domanda → (risposta scritta facoltativa) → risposta di riferimento → autovalutazione.
 * Nessun confronto automatico del testo: la valutazione è sempre dell'utente.
 */
export function RecallCard({ item, recallKey, label, onRated }: { item: ContentItem; recallKey: string; label?: string; onRated?: (r: ReviewRating) => void }) {
  const prompt = item.recall.find((r) => r.key === recallKey);
  const cardId = cardIdOf(item.id, recallKey);
  const snapshot = useSnapshot();
  const dispatch = useDispatch();
  const [revealed, setRevealed] = useState(false);
  const [draft, setDraft] = useState("");
  const [result, setResult] = useState<{ rating: ReviewRating; due: string } | null>(null);
  const [error, setError] = useState<string | null>(null);
  const answerId = useId();

  const state = snapshot.reviews[cardId];
  const previews = useMemo(() => {
    if (!revealed) return null;
    const now = new Date();
    const p = previewIntervals(state ?? newReviewState(cardId, now, item.revision), now);
    return Object.fromEntries(RATINGS.map((r) => [r, formatInterval(now, p[r])])) as Record<ReviewRating, string>;
  }, [revealed, state, cardId, item.revision]);

  if (!prompt) return null;

  const rate = (rating: ReviewRating) => {
    const res = dispatch({
      type: "review/record",
      eventId: crypto.randomUUID(),
      cardId,
      rating,
      contentRevision: item.revision,
      expectedVersion: state?.version ?? 0,
    });
    if (res.conflict === "stale_version") {
      setError("Questa carta è stata aggiornata in un'altra scheda. Ricarica la pagina per valutarla di nuovo.");
      return;
    }
    const next = res.snapshot.reviews[cardId];
    setResult({ rating, due: next?.due ?? new Date().toISOString() });
    onRated?.(rating);
  };

  return (
    <article className="rounded-[var(--radius-card)] border border-line bg-surface p-4 shadow-[var(--shadow-card)] sm:p-5" aria-labelledby={`${answerId}-q`}>
      <MetaStrip item={item} extra={label} />
      <h3 id={`${answerId}-q`} className="mt-3 text-[17px] font-semibold leading-snug tracking-[-0.01em] text-ink">
        {prompt.prompt}
      </h3>

      {result ? (
        <p className="mt-4 rounded-lg bg-surface-2 px-3 py-2.5 text-[14px] text-ink-2" role="status">
          Valutata <span className="font-medium text-ink">{RATING_LABELS[result.rating]}</span>. Prossimo ripasso tra{" "}
          <span className="font-mono text-ink">{formatInterval(new Date(), new Date(result.due))}</span>.
        </p>
      ) : !revealed ? (
        <div className="mt-4">
          <label htmlFor={`${answerId}-draft`} className="sr-only">
            La tua risposta (facoltativa)
          </label>
          <textarea
            id={`${answerId}-draft`}
            value={draft}
            onChange={(e) => setDraft(e.target.value)}
            rows={3}
            maxLength={4000}
            placeholder="Rispondi mentalmente o scrivi qui (facoltativo)…"
            className="w-full resize-y rounded-[var(--radius-control)] border border-line bg-bg px-3 py-2.5 text-[15px] text-ink placeholder:text-ink-3 focus:border-accent focus:outline-none"
          />
          <button type="button" onClick={() => setRevealed(true)} className="mt-3 h-11 w-full rounded-[var(--radius-control)] bg-accent text-[15px] font-medium text-on-accent">
            Mostra risposta
          </button>
        </div>
      ) : (
        <div className="mt-4 space-y-4">
          {draft.trim() && (
            <div className="rounded-lg border border-line bg-bg px-3 py-2.5">
              <div className="meta-strip mb-1">La tua risposta</div>
              <p className="whitespace-pre-wrap text-[14.5px] text-ink-2">{draft}</p>
            </div>
          )}
          <div>
            <div className="meta-strip mb-1.5">Risposta di riferimento</div>
            <p className="text-[15px] leading-relaxed text-ink">{prompt.answer}</p>
          </div>
          {prompt.keyPoints.length > 0 && (
            <div>
              <div className="meta-strip mb-1.5">Concetti chiave</div>
              <ul className="space-y-1 text-[14.5px] text-ink-2">
                {prompt.keyPoints.map((k) => (
                  <li key={k} className="flex gap-2">
                    <span className="mt-[9px] size-1.5 shrink-0 rounded-full bg-accent" aria-hidden />
                    {k}
                  </li>
                ))}
              </ul>
            </div>
          )}
          {prompt.commonMistakes.length > 0 && (
            <div>
              <div className="meta-strip mb-1.5">Errori comuni</div>
              <ul className="space-y-1 text-[14.5px] text-ink-2">
                {prompt.commonMistakes.map((k) => (
                  <li key={k} className="flex gap-2">
                    <span className="mt-[9px] size-1.5 shrink-0 rounded-full bg-hard" aria-hidden />
                    {k}
                  </li>
                ))}
              </ul>
            </div>
          )}
          <Link href={`/c/${item.id}`} className="inline-block text-[14px] font-medium text-accent-text underline-offset-4 hover:underline">
            Rileggi: {item.title}
          </Link>
          <div>
            <div className="meta-strip mb-2">Quanto bene la ricordavi?</div>
            <div className="grid grid-cols-2 gap-2 sm:grid-cols-4" role="group" aria-label="Autovalutazione">
              {RATINGS.map((r) => (
                <button
                  key={r}
                  type="button"
                  onClick={() => rate(r)}
                  className={`flex h-14 flex-col items-center justify-center rounded-[var(--radius-control)] border bg-surface text-[14px] font-medium transition-colors ${RATING_STYLE[r]}`}
                >
                  {RATING_LABELS[r]}
                  {previews && <span className="font-mono text-[11px] font-normal text-ink-3">{previews[r]}</span>}
                </button>
              ))}
            </div>
          </div>
          {error && <p className="text-[14px] text-again" role="alert">{error}</p>}
        </div>
      )}
    </article>
  );
}
