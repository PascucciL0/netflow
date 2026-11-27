"use client";

import { Info } from "lucide-react";
import { useState } from "react";
import { topics } from "@/data/catalog";
import { useStoreApi } from "@/data/progress-context";
import { explainFeedEntry, type FeedExplanation } from "@/engine/explain";
import type { FeedEntry } from "@/engine/feed";

/** Pulsante discreto "Perché la vedo?" sotto una voce del feed: mostra il motivo calcolato dal Learning Engine. */
export function WhyThis({ entry }: { entry: FeedEntry }) {
  const store = useStoreApi();
  const [explanation, setExplanation] = useState<FeedExplanation | null>(null);

  // calcolata al clic: usa lo stato attuale ed evita new Date() durante il render
  const toggle = () => setExplanation((cur) => (cur ? null : explainFeedEntry(entry, { snapshot: store.getSnapshot(), topics, now: new Date() })));

  return (
    <div className="mt-1.5 px-1">
      <button type="button" onClick={toggle} aria-expanded={explanation !== null} className="inline-flex min-h-9 items-center gap-1.5 text-[13px] text-ink-3 hover:text-ink-2">
        <Info size={14} aria-hidden /> Perché la vedo?
      </button>
      {explanation && (
        <div className="mb-1 rounded-[var(--radius-control)] bg-surface-2 px-3 py-2.5 text-[13.5px] leading-relaxed text-ink-2">
          <p className="font-medium text-ink">{explanation.title}</p>
          <ul className="mt-1 space-y-0.5">
            {explanation.details.map((d) => (
              <li key={d}>{d}</li>
            ))}
          </ul>
        </div>
      )}
    </div>
  );
}
