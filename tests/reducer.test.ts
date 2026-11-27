import { describe, expect, it } from "vitest";
import { emptySnapshot } from "@/domain/progress";
import { reduce } from "@/engine/reducer";
import { T0, at, hours } from "./helpers";

const card = "c1#k" as const;
const rec = (eventId: string, expectedVersion: number) =>
  ({ type: "review/record", eventId, cardId: card, rating: "good", contentRevision: 1, expectedVersion }) as const;

describe("reducer", () => {
  it("la visualizzazione non crea stati di ripasso", () => {
    const { snapshot } = reduce(emptySnapshot(), { type: "content/seen", contentId: "c1" }, T0);
    expect(snapshot.content.c1.seenCount).toBe(1);
    expect(Object.keys(snapshot.reviews)).toHaveLength(0);
  });

  it("visualizzazioni ravvicinate non vengono contate due volte", () => {
    let s = reduce(emptySnapshot(), { type: "content/seen", contentId: "c1" }, T0).snapshot;
    s = reduce(s, { type: "content/seen", contentId: "c1" }, at(hours(0.1))).snapshot;
    expect(s.content.c1.seenCount).toBe(1);
    s = reduce(s, { type: "content/seen", contentId: "c1" }, at(hours(2))).snapshot;
    expect(s.content.c1.seenCount).toBe(2);
  });

  it("un evento duplicato (stesso id) è ignorato: idempotenza", () => {
    const a = reduce(emptySnapshot(), rec("e1", 0), T0).snapshot;
    const b = reduce(a, rec("e1", 1), at(hours(1)));
    expect(b.conflict).toBe("duplicate_event");
    expect(b.snapshot.events).toHaveLength(1);
  });

  it("versione obsoleta (altra scheda) viene rifiutata", () => {
    const a = reduce(emptySnapshot(), rec("e1", 0), T0).snapshot;
    const b = reduce(a, rec("e2", 0), at(hours(1)));
    expect(b.conflict).toBe("stale_version");
    expect(b.snapshot).toBe(a);
  });

  it("aggiornare lo stato di un argomento non tocca i ripassi", () => {
    const a = reduce(emptySnapshot(), rec("e1", 0), T0).snapshot;
    const b = reduce(a, { type: "topic/status", topicId: "arp", status: "studying" }, T0).snapshot;
    expect(b.reviews).toBe(a.reviews);
    expect(b.topics.arp.status).toBe("studying");
  });
});
