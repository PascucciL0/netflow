/**
 * Learning Engine — casi limite: fusi orari e confini di giornata, aggiornamento dei contenuti,
 * concorrenza tra schede/dispositivi, spiegazione "perché vedo questa card".
 */
import { describe, expect, it } from "vitest";
import { cardIdOf } from "@/domain/content";
import { emptySnapshot, type UserSnapshot } from "@/domain/progress";
import { explainFeedEntry, relativeDays } from "@/engine/explain";
import { buildFeed, FEED_REASON_LABELS, type FeedEntry } from "@/engine/feed";
import { reduce } from "@/engine/reducer";
import { isDue } from "@/engine/scheduler";
import { localDayKey } from "@/lib/dates";
import { T0, at, hours, item, recall, topic } from "./helpers";

const topics = [topic("a", 0), topic("b", 1, ["a"]), topic("c", 2, ["b"])];
const items = [item("a1", "a", { recall: [recall("q")] }), item("a2", "a"), item("b1", "b", { recall: [recall("q")] }), item("c1", "c")];
const A1Q = cardIdOf("a1", "q");
const rec = (eventId: string, expectedVersion: number, contentRevision = 1, rating: "again" | "hard" | "good" | "easy" = "good") =>
  ({ type: "review/record", eventId, cardId: A1Q, rating, contentRevision, expectedVersion }) as const;

function run(s: UserSnapshot, ...steps: [Parameters<typeof reduce>[1], Date][]): UserSnapshot {
  return steps.reduce((acc, [m, now]) => reduce(acc, m, now).snapshot, s);
}

describe("fusi orari e confini di giornata", () => {
  it("il giorno locale dipende dal fuso dell'utente, non da UTC", () => {
    const lateUtc = new Date("2026-11-27T23:30:00Z");
    expect(localDayKey(lateUtc, "Europe/Rome")).toBe("2026-11-28");
    expect(localDayKey(lateUtc, "America/New_York")).toBe("2026-11-27");
    expect(localDayKey(lateUtc, "UTC")).toBe("2026-11-27");
  });

  it("cambio dell'ora legale (Europe/Rome, 25 ottobre 2026): mezzanotte locale cade su istanti UTC diversi", () => {
    expect(localDayKey(new Date("2026-10-24T22:30:00Z"), "Europe/Rome")).toBe("2026-10-25"); // CEST, UTC+2
    expect(localDayKey(new Date("2026-10-25T22:30:00Z"), "Europe/Rome")).toBe("2026-10-25"); // CET, UTC+1: ancora il 25
    expect(localDayKey(new Date("2026-10-25T23:30:00Z"), "Europe/Rome")).toBe("2026-10-26");
  });

  it("un fuso non valido non blocca l'app: si ripiega sul giorno UTC", () => {
    expect(localDayKey(new Date("2026-11-27T23:30:00Z"), "Mars/Olympus")).toBe("2026-11-27");
  });

  it("la scadenza di un ripasso è un istante: non cambia con il fuso scelto", () => {
    const s = run(emptySnapshot(), [rec("e1", 0), T0]);
    const st = s.reviews[A1Q];
    const justBefore = new Date(new Date(st.due).getTime() - 1);
    expect(isDue(st, justBefore)).toBe(false);
    expect(isDue(st, new Date(st.due))).toBe(true);
    const feedIn = (tz: string) =>
      buildFeed({ now: new Date(st.due), items, topics, snapshot: { ...s, preferences: { ...s.preferences, timeZone: tz } }, dayKey: "2026-11-27" });
    expect(feedIn("Europe/Rome").entries[0].key).toBe(feedIn("Pacific/Auckland").entries[0].key);
  });

  it("nello stesso giorno locale il feed è identico; il giorno dopo cambia solo l'ordine dei pareggi", () => {
    const s = run(emptySnapshot(), [{ type: "topic/status", topicId: "a", status: "studying" }, T0]);
    const f = (dayKey: string, now: Date) => buildFeed({ now, items, topics, snapshot: s, dayKey }).entries.map((e) => e.key);
    expect(f("2026-11-27", at(hours(1)))).toEqual(f("2026-11-27", at(hours(2))));
    expect(new Set(f("2026-11-28", at(hours(1))))).toEqual(new Set(f("2026-11-27", at(hours(1)))));
  });
});

describe("aggiornamento dei contenuti", () => {
  it("una nuova revisione del contenuto mantiene la storia della carta (stessa chiave di recall)", () => {
    let s = run(emptySnapshot(), [rec("e1", 0, 1), T0], [rec("e2", 1, 1), at(hours(48))]);
    const before = s.reviews[A1Q];
    s = reduce(s, rec("e3", 2, 2), at(hours(24 * 10))).snapshot;
    const after = s.reviews[A1Q];
    expect(after.reps).toBe(before.reps + 1);
    expect(after.stability).toBeGreaterThan(before.stability);
    expect(after.contentRevision).toBe(2);
    expect(s.events.map((e) => e.id)).toEqual(["e1", "e2", "e3"]);
  });

  it("una carta dovuta resta nel feed anche se il contenuto è stato aggiornato", () => {
    const s = run(emptySnapshot(), [rec("e1", 0), T0]);
    const updated = items.map((i) => (i.id === "a1" ? { ...i, revision: 2, title: "Titolo aggiornato" } : i));
    const f = buildFeed({ now: at(hours(24 * 30)), items: updated, topics, snapshot: s, dayKey: "2026-12-27" });
    expect(f.entries[0]).toMatchObject({ key: `r:${A1Q}`, reason: "due_review" });
    expect(f.entries[0].item.title).toBe("Titolo aggiornato");
  });

  it("una domanda rimossa dal contenuto non compare più e non rompe il feed", () => {
    const s = run(emptySnapshot(), [rec("e1", 0), T0]);
    const without = items.map((i) => (i.id === "a1" ? { ...i, revision: 2, recall: [] } : i));
    const f = buildFeed({ now: at(hours(24 * 30)), items: without, topics, snapshot: s, dayKey: "2026-12-27" });
    expect(f.entries.some((e) => e.cardId === A1Q)).toBe(false);
  });

  it("un contenuto eliminato dal catalogo: i progressi orfani vengono ignorati", () => {
    const s = run(emptySnapshot(), [{ type: "content/save", contentId: "rimosso", saved: true }, T0], [{ type: "topic/status", topicId: "a", status: "studying" }, T0]);
    expect(() => buildFeed({ now: T0, items, topics, snapshot: s, dayKey: "2026-11-27" })).not.toThrow();
  });
});

describe("concorrenza", () => {
  it("due schede valutano la stessa carta: la seconda, basata su una versione vecchia, viene rifiutata", () => {
    const base = emptySnapshot();
    const tabA = reduce(base, rec("eA", 0), T0);
    const tabB = reduce(tabA.snapshot, rec("eB", 0, 1, "easy"), T0);
    expect(tabB.conflict).toBe("stale_version");
    expect(tabB.snapshot).toBe(tabA.snapshot);
  });

  it("lo stesso evento reinviato più volte (rete instabile) viene applicato una sola volta, anche dopo un reset", () => {
    let s = reduce(emptySnapshot(), rec("e1", 0), T0).snapshot;
    s = reduce(s, { type: "review/reset", cardId: A1Q }, at(hours(1))).snapshot;
    const again = reduce(s, rec("e1", s.reviews[A1Q].version), at(hours(2)));
    expect(again.conflict).toBe("duplicate_event");
    expect(again.snapshot.events).toHaveLength(1);
  });

  it("la versione cresce in modo monotono tra valutazioni e reset", () => {
    let s = emptySnapshot();
    const versions: number[] = [];
    for (let i = 0; i < 3; i++) {
      s = reduce(s, rec(`e${i}`, s.reviews[A1Q]?.version ?? 0), at(hours(24 * i))).snapshot;
      versions.push(s.reviews[A1Q].version);
      s = reduce(s, { type: "review/reset", cardId: A1Q }, at(hours(24 * i + 1))).snapshot;
      versions.push(s.reviews[A1Q].version);
    }
    expect(versions).toEqual([1, 2, 3, 4, 5, 6]);
  });
});

describe("perché vedo questa card", () => {
  const ctx = (snapshot: UserSnapshot, now = T0) => ({ snapshot, topics, now });
  const entry = (reason: FeedEntry["reason"], it = items[0], extra: Partial<FeedEntry> = {}): FeedEntry => ({ key: `c:${it.id}`, type: "content", item: it, reason, ...extra });

  it("il titolo coincide con l'etichetta mostrata sulla card per ogni motivo", () => {
    for (const reason of Object.keys(FEED_REASON_LABELS) as FeedEntry["reason"][])
      expect(explainFeedEntry(entry(reason), ctx(emptySnapshot())).title).toBe(FEED_REASON_LABELS[reason]);
  });

  it("ripasso dovuto: data prevista, ultima valutazione e probabilità di ricordo", () => {
    const s = run(emptySnapshot(), [rec("e1", 0, 1, "hard"), T0]);
    const now = at(hours(24 * 30));
    const e = buildFeed({ now, items, topics, snapshot: s, dayKey: "x" }).entries[0];
    const d = explainFeedEntry(e, ctx(s, now)).details;
    expect(d[0]).toMatch(/era previsto .*giorni fa/);
    expect(d[1]).toBe(`Ultima valutazione: "Difficile", 30 giorni fa.`);
    expect(d[2]).toMatch(/^Probabilità stimata di ricordarla adesso: \d{1,3}%\.$/);
  });

  it("ogni voce del feed reale ha una spiegazione coerente con il proprio motivo", () => {
    let s = run(
      emptySnapshot(),
      [{ type: "topic/status", topicId: "a", status: "consolidating" }, T0],
      [{ type: "content/seen", contentId: "a2" }, T0],
      [{ type: "content/signal", contentId: "a2", signal: "difficult" }, T0],
    );
    s = reduce(s, rec("e1", 0), T0).snapshot;
    const now = at(hours(24 * 30));
    const f = buildFeed({ now, items, topics, snapshot: s, dayKey: "x" });
    expect(new Set(f.entries.map((e) => e.reason))).toEqual(new Set(["due_review", "consolidate", "new", "explore"]));
    // la stessa spiegazione per uno "studying" (contenuto in un argomento in studio)
    const studying = explainFeedEntry(entry("studying", items[1]), ctx({ ...s, topics: { a: { topicId: "a", status: "studying", updatedAt: T0.toISOString() } } }, now));
    expect(studying.details).toEqual(['Stai studiando "a" nel corso.', "Ultima lettura: 30 giorni fa."]);
    for (const e of f.entries) {
      const ex = explainFeedEntry(e, ctx(s, now));
      expect(ex.details.length).toBeGreaterThan(0);
      if (e.reason === "consolidate") expect(ex.details[0]).toMatch(/difficile/);
      if (e.reason === "new") expect(ex.details[0]).toMatch(/prerequisiti \(a\)/);
    }
  });

  it("cold start: punto di partenza senza prerequisiti", () => {
    const f = buildFeed({ now: T0, items, topics, snapshot: emptySnapshot(), dayKey: "x" });
    expect(explainFeedEntry(f.entries[0], ctx(emptySnapshot())).details[0]).toMatch(/Punto di partenza/);
  });

  it("date relative leggibili", () => {
    expect(relativeDays(T0.toISOString(), T0)).toBe("oggi");
    expect(relativeDays(at(-hours(24)).toISOString(), T0)).toBe("ieri");
    expect(relativeDays(at(hours(48)).toISOString(), T0)).toBe("tra 2 giorni");
  });
});
