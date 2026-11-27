import { describe, expect, it } from "vitest";
import { cardIdOf } from "@/domain/content";
import { emptySnapshot, type UserSnapshot } from "@/domain/progress";
import { buildFeed, interleave, stableHash, type FeedEntry } from "@/engine/feed";
import { reduce } from "@/engine/reducer";
import { T0, at, hours, item, recall, topic } from "./helpers";

const topics = [topic("a", 0), topic("b", 1, ["a"]), topic("c", 2, ["b"]), topic("d", 3)];
const items = [
  item("a1", "a", { recall: [recall("q")] }),
  item("a2", "a", { kind: "comparison" }),
  item("b1", "b", { recall: [recall("q")] }),
  item("b2", "b"),
  item("c1", "c"),
  item("d1", "d", { kind: "recall", recall: [recall("q")] }),
];

const feed = (snapshot: UserSnapshot, now = T0, extra = {}) => buildFeed({ now, items, topics, snapshot, dayKey: "2026-11-27", ...extra });

describe("feed", () => {
  it("è deterministico", () => {
    const s = emptySnapshot();
    expect(feed(s).entries.map((e) => e.key)).toEqual(feed(s).entries.map((e) => e.key));
  });

  it("cold start: parte dagli argomenti senza prerequisiti", () => {
    const r = feed(emptySnapshot());
    expect(r.coldStart).toBe(true);
    const newOnes = r.entries.filter((e) => e.reason === "new").map((e) => e.item.topicId);
    expect(new Set(newOnes)).toEqual(new Set(["a", "d"]));
    expect(r.entries.length).toBe(items.length); // fallback "explore" riempie il resto
  });

  it("ogni contenuto compare al massimo una volta", () => {
    const ids = feed(emptySnapshot()).entries.map((e) => e.item.id);
    expect(new Set(ids).size).toBe(ids.length);
  });

  it("i ripassi dovuti hanno priorità e vengono per primi", () => {
    let s = reduce(emptySnapshot(), { type: "topic/status", topicId: "b", status: "studying" }, T0).snapshot;
    s = reduce(s, { type: "review/record", eventId: "e", cardId: cardIdOf("d1", "q"), rating: "good", contentRevision: 1, expectedVersion: 0 }, T0).snapshot;
    const r = feed(s, at(hours(24 * 30)));
    expect(r.entries[0]).toMatchObject({ type: "recall", reason: "due_review", cardId: "d1#q" });
  });

  it("gli argomenti in studio entrano nel feed; i prerequisiti sbloccano la frontiera", () => {
    const s = reduce(emptySnapshot(), { type: "topic/status", topicId: "a", status: "studying" }, T0).snapshot;
    const r = feed(s);
    expect(r.coldStart).toBe(false);
    expect(r.entries.filter((e) => e.reason === "studying").map((e) => e.item.topicId)).toContain("a");
    // b ha come prerequisito a (attivo) ⇒ frontiera; c dipende da b (non iniziato) ⇒ non frontiera
    const fresh = r.entries.filter((e) => e.reason === "new").map((e) => e.item.topicId);
    expect(fresh).toContain("b");
    expect(fresh).not.toContain("c");
  });

  it("i contenuti visti di recente non tornano subito (prevenzione ripetizioni)", () => {
    let s = reduce(emptySnapshot(), { type: "topic/status", topicId: "a", status: "studying" }, T0).snapshot;
    s = reduce(s, { type: "content/seen", contentId: "a2" }, T0).snapshot;
    expect(feed(s, at(hours(1))).entries.some((e) => e.item.id === "a2")).toBe(false);
    expect(feed(s, at(hours(13))).entries.some((e) => e.item.id === "a2")).toBe(true);
  });

  it("dopo la lettura, le domande di recall dell'argomento in studio diventano carte nuove", () => {
    let s = reduce(emptySnapshot(), { type: "topic/status", topicId: "a", status: "studying" }, T0).snapshot;
    s = reduce(s, { type: "content/seen", contentId: "a1" }, T0).snapshot;
    const r = feed(s, at(hours(1)));
    expect(r.entries.find((e) => e.type === "recall" && e.cardId === "a1#q")?.reason).toBe("studying");
  });

  it("i contenuti nascosti e in lingue escluse non compaiono", () => {
    let s = reduce(emptySnapshot(), { type: "content/hide", contentId: "a1", hidden: true }, T0).snapshot;
    s = reduce(s, { type: "preferences/update", patch: { languages: ["en"] } }, T0).snapshot;
    expect(feed(s).entries).toHaveLength(0);
    s = reduce(s, { type: "preferences/update", patch: { languages: ["it"] } }, T0).snapshot;
    expect(feed(s).entries.some((e) => e.item.id === "a1")).toBe(false);
  });

  it("feed vuoto senza contenuti (fallback senza errori)", () => {
    expect(buildFeed({ now: T0, items: [], topics, snapshot: emptySnapshot(), dayKey: "x" }).entries).toEqual([]);
  });

  it("rispetta il limite", () => {
    expect(feed(emptySnapshot(), T0, { limit: 2 }).entries).toHaveLength(2);
  });
});

describe("interleave", () => {
  const e = (id: string, topicId: string): FeedEntry => ({ key: id, type: "content", item: item(id, topicId), reason: "studying" });

  it("distribuisce secondo i pesi (smooth weighted round robin)", () => {
    const A = Array.from({ length: 20 }, (_, i) => e(`a${i}`, `ta${i}`));
    const B = Array.from({ length: 20 }, (_, i) => e(`b${i}`, `tb${i}`));
    const out = interleave([{ name: "review", weight: 50, queue: A }, { name: "studying", weight: 30, queue: B }, { name: "new", weight: 0, queue: [] }], [], 16);
    const fromA = out.filter((x) => x.item.id.startsWith("a")).length;
    expect(fromA).toBe(10); // 50/(50+30) di 16
  });

  it("evita lo stesso argomento due volte di fila quando possibile", () => {
    const q = [e("x1", "t1"), e("x2", "t1"), e("x3", "t2")];
    const out = interleave([{ name: "review", weight: 1, queue: q }], [], 3);
    expect(out.map((x) => x.item.id)).toEqual(["x1", "x3", "x2"]);
  });
});

describe("stableHash", () => {
  it("è stabile e varia con l'input", () => {
    expect(stableHash("abc")).toBe(stableHash("abc"));
    expect(stableHash("abc")).not.toBe(stableHash("abd"));
  });
});
