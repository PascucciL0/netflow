import { DIFFICULTY_LABELS, KIND_LABELS, type ContentItem } from "@/domain/content";
import { topicById } from "@/data/catalog";

/** Intestazione compatta in stile header di protocollo: TIPO · ARGOMENTO · MINUTI */
export function MetaStrip({ item, extra }: { item: ContentItem; extra?: string }) {
  const topic = topicById.get(item.topicId)?.title ?? item.topicId;
  return (
    <div className="meta-strip flex flex-wrap items-center gap-x-2 gap-y-1">
      <span className="text-accent-text">{KIND_LABELS[item.kind]}</span>
      <span aria-hidden>·</span>
      <span>{topic}</span>
      <span aria-hidden>·</span>
      <span>{item.readingMinutes} min</span>
      {item.difficulty > 1 && (
        <>
          <span aria-hidden>·</span>
          <span>{DIFFICULTY_LABELS[item.difficulty]}</span>
        </>
      )}
      {item.language === "en" && (
        <>
          <span aria-hidden>·</span>
          <span>EN</span>
        </>
      )}
      {extra && (
        <>
          <span aria-hidden>·</span>
          <span>{extra}</span>
        </>
      )}
    </div>
  );
}
