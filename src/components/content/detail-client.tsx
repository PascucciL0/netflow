"use client";

import { Bookmark, BookmarkCheck } from "lucide-react";
import { useEffect } from "react";
import type { ContentItem } from "@/domain/content";
import { useDispatch, useHydrated, useSnapshot } from "@/data/progress-context";
import { RecallCard } from "./recall-card";

export function OpenTracker({ contentId }: { contentId: string }) {
  const dispatch = useDispatch();
  useEffect(() => {
    dispatch({ type: "content/opened", contentId });
  }, [contentId, dispatch]);
  return null;
}

export function DetailActions({ contentId }: { contentId: string }) {
  const dispatch = useDispatch();
  const hydrated = useHydrated();
  const p = useSnapshot().content[contentId];
  const saved = p?.saved ?? false;
  const signal = p?.signal;
  const chip = (active: boolean) =>
    `inline-flex h-10 items-center gap-1.5 rounded-full border px-3.5 text-[14px] font-medium ${active ? "border-accent/50 bg-accent-soft text-accent-text" : "border-line text-ink-2 hover:text-ink"}`;
  if (!hydrated) return <div className="mt-5 h-10" />;
  return (
    <div className="mt-5 flex flex-wrap gap-2" role="group" aria-label="Azioni sul contenuto">
      <button type="button" aria-pressed={saved} className={chip(saved)} onClick={() => dispatch({ type: "content/save", contentId, saved: !saved })}>
        {saved ? <BookmarkCheck size={16} aria-hidden /> : <Bookmark size={16} aria-hidden />} {saved ? "Salvato" : "Salva"}
      </button>
      <button type="button" aria-pressed={signal === "difficult"} className={chip(signal === "difficult")} onClick={() => dispatch({ type: "content/signal", contentId, signal: signal === "difficult" ? null : "difficult" })}>
        Difficile
      </button>
      <button type="button" aria-pressed={signal === "understood"} className={chip(signal === "understood")} onClick={() => dispatch({ type: "content/signal", contentId, signal: signal === "understood" ? null : "understood" })}>
        Compreso
      </button>
    </div>
  );
}

export function DetailRecall({ item, recallKey }: { item: ContentItem; recallKey: string }) {
  return <RecallCard item={item} recallKey={recallKey} />;
}
