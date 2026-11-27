"use client";

import Link from "next/link";
import { Bookmark, ChevronRight, Search } from "lucide-react";
import { useMemo, useState } from "react";
import { KIND_LABELS, type ContentItem } from "@/domain/content";
import { TOPIC_STATUSES, TOPIC_STATUS_LABELS, type TopicStatus } from "@/domain/progress";
import { tracks } from "@/data/catalog";
import { useDispatch, useHydrated, useSnapshot } from "@/data/progress-context";
import { useAllItems } from "@/components/content/use-learning";

const STATUS_DOT: Record<TopicStatus, string> = {
  not_started: "bg-surface-3 ring-1 ring-line-strong",
  studying: "bg-accent",
  studied: "bg-good/60",
  consolidating: "bg-hard",
  mastered: "bg-easy",
};

const norm = (s: string) => s.toLocaleLowerCase("it").normalize("NFD").replace(/\p{Diacritic}/gu, "");

export function LibraryView() {
  const items = useAllItems();
  const snapshot = useSnapshot();
  const hydrated = useHydrated();
  const dispatch = useDispatch();
  const [query, setQuery] = useState("");
  const [savedOnly, setSavedOnly] = useState(false);
  const [openTopic, setOpenTopic] = useState<string | null>(null);

  const byTopic = useMemo(() => {
    const q = norm(query.trim());
    const m = new Map<string, ContentItem[]>();
    for (const it of items) {
      if (savedOnly && !snapshot.content[it.id]?.saved) continue;
      if (q && !norm(`${it.title} ${it.summary} ${it.tags.join(" ")}`).includes(q)) continue;
      m.set(it.topicId, [...(m.get(it.topicId) ?? []), it]);
    }
    return m;
  }, [items, query, savedOnly, snapshot.content]);

  const filtering = query.trim() !== "" || savedOnly;
  const status = (id: string): TopicStatus => (hydrated ? snapshot.topics[id]?.status : undefined) ?? "not_started";

  return (
    <div>
      <h1 className="text-[24px] font-semibold tracking-[-0.02em] text-ink">Libreria</h1>
      <p className="mt-1 text-[14.5px] text-ink-2">Indica a che punto sei del corso: il feed si adatta allo stato di ogni argomento.</p>

      <div className="sticky top-[calc(3.5rem+env(safe-area-inset-top))] z-20 -mx-4 mt-4 bg-bg/90 px-4 py-2 backdrop-blur-md lg:top-0 lg:mx-0 lg:px-0">
        <div className="flex gap-2">
          <label className="relative flex-1">
            <span className="sr-only">Cerca nella libreria</span>
            <Search size={17} className="pointer-events-none absolute left-3 top-1/2 -translate-y-1/2 text-ink-3" aria-hidden />
            <input
              type="search"
              value={query}
              onChange={(e) => setQuery(e.target.value)}
              placeholder="Cerca: ARP, DHCP, subnet…"
              className="h-11 w-full rounded-[var(--radius-control)] border border-line bg-surface pl-9 pr-3 text-[15px] text-ink placeholder:text-ink-3 focus:border-accent focus:outline-none"
            />
          </label>
          <button
            type="button"
            aria-pressed={savedOnly}
            onClick={() => setSavedOnly((v) => !v)}
            className={`inline-flex h-11 items-center gap-1.5 rounded-[var(--radius-control)] border px-3 text-[14px] font-medium ${savedOnly ? "border-accent/50 bg-accent-soft text-accent-text" : "border-line text-ink-2"}`}
          >
            <Bookmark size={16} aria-hidden /> Salvati
          </button>
        </div>
      </div>

      {tracks.map((track) => (
        <div key={track.id} className="mt-4">
          <p className="meta-strip">{track.title}</p>
          {track.modules.map((mod) => {
            const visibleTopics = mod.topics.filter((t) => !filtering || byTopic.has(t.id));
            if (visibleTopics.length === 0) return null;
            return (
              <section key={mod.id} className="mt-6" aria-labelledby={`m-${mod.id}`}>
                <h2 id={`m-${mod.id}`} className="text-[16px] font-semibold text-ink">{mod.title}</h2>
                <ul className="mt-2 divide-y divide-line overflow-hidden rounded-[var(--radius-card)] border border-line bg-surface">
                  {visibleTopics.map((t) => {
                    const st = status(t.id);
                    const list = byTopic.get(t.id) ?? [];
                    const expanded = openTopic === t.id || filtering;
                    return (
                      <li key={t.id}>
                        <button
                          type="button"
                          onClick={() => setOpenTopic(openTopic === t.id ? null : t.id)}
                          aria-expanded={expanded}
                          className="flex w-full items-center gap-3 px-4 py-3.5 text-left hover:bg-surface-2"
                        >
                          <span className={`size-2.5 shrink-0 rounded-full ${STATUS_DOT[st]}`} aria-hidden />
                          <span className="min-w-0 flex-1">
                            <span className="block font-medium text-ink">{t.title}</span>
                            <span className="block text-[13px] text-ink-3">
                              {TOPIC_STATUS_LABELS[st]} · {list.length} {list.length === 1 ? "contenuto" : "contenuti"}
                            </span>
                          </span>
                          <ChevronRight size={18} className={`shrink-0 text-ink-3 transition-transform ${expanded ? "rotate-90" : ""}`} aria-hidden />
                        </button>
                        {expanded && (
                          <div className="border-t border-line bg-bg/50 px-4 pb-4 pt-3">
                            <p className="text-[14px] leading-relaxed text-ink-2">{t.summary}</p>
                            <fieldset className="mt-3">
                              <legend className="meta-strip mb-2">Stato dell&apos;argomento</legend>
                              <div className="flex flex-wrap gap-1.5">
                                {TOPIC_STATUSES.map((s) => (
                                  <button
                                    key={s}
                                    type="button"
                                    aria-pressed={st === s}
                                    onClick={() => dispatch({ type: "topic/status", topicId: t.id, status: s })}
                                    className={`h-9 rounded-full border px-3 text-[13.5px] ${st === s ? "border-accent bg-accent text-on-accent" : "border-line bg-surface text-ink-2 hover:text-ink"}`}
                                  >
                                    {TOPIC_STATUS_LABELS[s]}
                                  </button>
                                ))}
                              </div>
                            </fieldset>
                            {list.length > 0 && (
                              <ul className="mt-4 space-y-1">
                                {list.map((it) => (
                                  <li key={it.id}>
                                    <Link href={`/c/${it.id}`} className="flex items-baseline justify-between gap-3 rounded-lg px-2 py-2 hover:bg-surface-2">
                                      <span className="text-[14.5px] text-ink">{it.title}</span>
                                      <span className="meta-strip shrink-0">{KIND_LABELS[it.kind]}</span>
                                    </Link>
                                  </li>
                                ))}
                              </ul>
                            )}
                          </div>
                        )}
                      </li>
                    );
                  })}
                </ul>
              </section>
            );
          })}
        </div>
      ))}
      {filtering && byTopic.size === 0 && <p className="mt-6 text-center text-[14.5px] text-ink-3">Nessun contenuto corrisponde alla ricerca.</p>}
    </div>
  );
}
