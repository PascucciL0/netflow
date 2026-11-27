import type { ContentItem } from "@/domain/content";
import type { TopicNode } from "@/domain/catalog";

export const T0 = new Date("2026-11-27T08:00:00Z");
export const hours = (n: number) => n * 3_600_000;
export const at = (ms: number) => new Date(T0.getTime() + ms);

export function topic(id: string, order: number, prerequisites: string[] = []): TopicNode {
  return { id, title: id, summary: id, prerequisites, objectives: [], trackId: "ccna", moduleId: "m", order };
}

export function item(id: string, topicId: string, extra: Partial<ContentItem> = {}): ContentItem {
  return {
    id,
    revision: 1,
    kind: "lesson",
    language: "it",
    title: `Titolo ${id}`,
    summary: "Riassunto di prova sufficientemente lungo",
    body: "",
    trackId: "ccna",
    topicId,
    difficulty: 1,
    prerequisites: [],
    readingMinutes: 2,
    objectives: [],
    sources: [{ title: "RFC 0000", publisher: "Test", type: "rfc" }],
    provenance: "original",
    reviewStatus: "proposed",
    tags: [],
    diagrams: [],
    recall: [],
    related: [],
    createdAt: "2026-11-27",
    updatedAt: "2026-11-27",
    ...extra,
  };
}

export const recall = (key: string) => ({ key, prompt: "Domanda di prova?", answer: "Risposta di prova.", keyPoints: [], commonMistakes: [] });
