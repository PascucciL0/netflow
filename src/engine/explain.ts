/**
 * "Perché vedo questa card?": spiegazione leggibile del motivo per cui il feed propone una voce.
 * Pura e deterministica: usa lo stesso motivo calcolato da buildFeed (FeedEntry.reason) e lo stato
 * dell'utente, così la spiegazione non può divergere dalla logica reale del feed.
 */
import type { TopicNode } from "@/domain/catalog";
import { RATING_LABELS, TOPIC_STATUS_LABELS, type UserSnapshot } from "@/domain/progress";
import { FEED_REASON_LABELS, type FeedEntry } from "./feed";
import { retrievability } from "./scheduler";

export interface FeedExplanation {
  /** Titolo breve, uguale all'etichetta mostrata sulla card. */
  title: string;
  /** Frasi di dettaglio, dalla più importante. */
  details: string[];
}

const DAY = 86_400_000;

/** "oggi", "ieri", "3 giorni fa", "tra 2 giorni". */
export function relativeDays(fromIso: string, now: Date): string {
  const days = Math.round((now.getTime() - new Date(fromIso).getTime()) / DAY);
  if (days === 0) return "oggi";
  if (days === 1) return "ieri";
  if (days === -1) return "domani";
  return days > 0 ? `${days} giorni fa` : `tra ${-days} giorni`;
}

export function explainFeedEntry(entry: FeedEntry, ctx: { snapshot: UserSnapshot; topics: TopicNode[]; now: Date }): FeedExplanation {
  const { snapshot, topics, now } = ctx;
  const topic = topics.find((t) => t.id === entry.item.topicId);
  const topicTitle = topic?.title ?? entry.item.topicId;
  const topicStatus = snapshot.topics[entry.item.topicId]?.status ?? "not_started";
  const progress = snapshot.content[entry.item.id];
  const details: string[] = [];
  const lastSeen = progress?.lastSeenAt ? `Ultima lettura: ${relativeDays(progress.lastSeenAt, now)}.` : null;

  switch (entry.reason) {
    case "due_review": {
      const st = entry.cardId ? snapshot.reviews[entry.cardId] : undefined;
      if (st) {
        details.push(`Il ripasso di questa domanda era previsto ${relativeDays(st.due, now)}: è il momento giusto per richiamarla prima di dimenticarla.`);
        const last = [...snapshot.events].reverse().find((e) => e.cardId === entry.cardId);
        if (last) details.push(`Ultima valutazione: "${RATING_LABELS[last.rating]}", ${relativeDays(last.reviewedAt, now)}.`);
        details.push(`Probabilità stimata di ricordarla adesso: ${Math.round(retrievability(st, now) * 100)}%.`);
      } else details.push("Il ripasso di questa domanda è in scadenza.");
      break;
    }
    case "consolidate":
      if (progress?.signal === "difficult") details.push("L'hai segnato come difficile: torna dopo almeno un giorno per consolidarlo.");
      if (topicStatus === "consolidating") details.push(`L'argomento "${topicTitle}" è segnato come da consolidare.`);
      if (lastSeen) details.push(lastSeen);
      break;
    case "studying":
      if (entry.type === "recall") {
        details.push(`Domanda nuova su un contenuto che hai già letto: trasforma la lettura in richiamo attivo.`);
        details.push(`Argomento "${topicTitle}": ${TOPIC_STATUS_LABELS[topicStatus].toLowerCase()}.`);
      } else {
        details.push(`Stai studiando "${topicTitle}" nel corso.`);
        details.push(lastSeen ?? "Non l'hai ancora letto.");
      }
      break;
    case "new": {
      const prereq = (topic?.prerequisites ?? []).map((p) => topics.find((t) => t.id === p)?.title ?? p);
      details.push(
        prereq.length
          ? `Prossimo passo nel percorso: hai già affrontato i prerequisiti (${prereq.join(", ")}).`
          : `Punto di partenza: "${topicTitle}" non richiede prerequisiti.`,
      );
      details.push("Non l'hai ancora letto.");
      break;
    }
    case "explore":
      details.push("Non ci sono ripassi o argomenti in studio da proporre in questo momento: è un contenuto che non vedi da un po'.");
      if (lastSeen) details.push(lastSeen);
      break;
  }
  return { title: FEED_REASON_LABELS[entry.reason], details };
}
