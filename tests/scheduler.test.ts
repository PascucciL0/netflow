import { describe, expect, it } from "vitest";
import { applyReview, isConsolidated, isDue, newReviewState, resetReviewState } from "@/engine/scheduler";
import { T0, at, hours } from "./helpers";

const card = "c1#k" as const;

describe("scheduler FSRS", () => {
  it("una carta nuova non è dovuta e non ha ripetizioni", () => {
    const s = newReviewState(card, T0, 1);
    expect(s.reps).toBe(0);
    expect(isDue(s, at(hours(1000)))).toBe(false);
  });

  it("le valutazioni ordinano gli intervalli: again < hard < good < easy", () => {
    const base = newReviewState(card, T0, 1);
    const due = (r: "again" | "hard" | "good" | "easy") => new Date(applyReview({ state: base, rating: r, now: T0, eventId: r, contentRevision: 1 }).state.due).getTime();
    expect(due("again")).toBeLessThan(due("hard"));
    expect(due("hard")).toBeLessThanOrEqual(due("good"));
    expect(due("good")).toBeLessThan(due("easy"));
  });

  it("una singola risposta corretta non rende la carta consolidata", () => {
    const s = applyReview({ state: newReviewState(card, T0, 1), rating: "easy", now: T0, eventId: "e1", contentRevision: 1 }).state;
    expect(isConsolidated(s)).toBe(false);
    expect(s.reps).toBe(1);
  });

  it("produce un evento coerente e incrementa la versione", () => {
    const s0 = newReviewState(card, T0, 1);
    const { state, event } = applyReview({ state: s0, rating: "good", now: T0, eventId: "e1", contentRevision: 1 });
    expect(state.version).toBe(1);
    expect(event).toMatchObject({ id: "e1", cardId: card, rating: "good", stateBefore: 0, elapsedDays: 0, dueAfter: state.due });
  });

  it("revisione in ritardo ricordata produce stabilità maggiore di una puntuale", () => {
    let s = newReviewState(card, T0, 1);
    for (let i = 0; i < 3; i++) s = applyReview({ state: s, rating: "good", now: new Date(s.due), eventId: `p${i}`, contentRevision: 1 }).state;
    const onTime = applyReview({ state: s, rating: "good", now: new Date(s.due), eventId: "a", contentRevision: 1 }).state;
    const late = applyReview({ state: s, rating: "good", now: new Date(new Date(s.due).getTime() + hours(24 * 20)), eventId: "b", contentRevision: 1 }).state;
    const early = applyReview({ state: s, rating: "good", now: new Date(s.lastReview!), eventId: "c", contentRevision: 1 }).state;
    expect(late.stability).toBeGreaterThan(onTime.stability);
    expect(early.stability).toBeLessThanOrEqual(onTime.stability);
  });

  it("un orologio che va indietro non produce intervalli negativi", () => {
    const s1 = applyReview({ state: newReviewState(card, T0, 1), rating: "good", now: at(hours(48)), eventId: "1", contentRevision: 1 });
    const s2 = applyReview({ state: s1.state, rating: "good", now: T0, eventId: "2", contentRevision: 1 });
    expect(s2.event.elapsedDays).toBe(0);
    expect(new Date(s2.state.due).getTime()).toBeGreaterThanOrEqual(new Date(s1.state.lastReview!).getTime());
  });

  it("il reset riporta la carta a nuova mantenendo la versione crescente", () => {
    const s1 = applyReview({ state: newReviewState(card, T0, 1), rating: "good", now: T0, eventId: "1", contentRevision: 1 }).state;
    const r = resetReviewState(s1, at(hours(1)));
    expect(r.reps).toBe(0);
    expect(r.version).toBe(s1.version + 1);
  });

  it("i lapse aumentano dopo un again su carta in Review", () => {
    let s = newReviewState(card, T0, 1);
    for (let i = 0; i < 3; i++) s = applyReview({ state: s, rating: "good", now: new Date(s.due), eventId: `g${i}`, contentRevision: 1 }).state;
    expect(s.state).toBe(2);
    const lapsed = applyReview({ state: s, rating: "again", now: new Date(s.due), eventId: "x", contentRevision: 1 }).state;
    expect(lapsed.lapses).toBe(s.lapses + 1);
    expect(lapsed.state).toBe(3);
  });
});
