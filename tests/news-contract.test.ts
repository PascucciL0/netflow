import { describe, expect, it } from "vitest";
import { NewsItemSchema, NewsSourceSchema } from "@/domain/news";

const item = {
  id: "cisco-talos:0123456789abcdef",
  sourceId: "cisco-talos",
  title: "Titolo di prova",
  url: "https://example.com/articolo",
  publishedAt: "2026-11-27T10:00:00Z",
  excerpt: "Breve descrizione",
  category: "cybersecurity",
  fetchedAt: "2026-11-27T11:00:00Z",
};

describe("contratto news", () => {
  it("accetta una notizia valida", () => {
    expect(NewsItemSchema.safeParse(item).success).toBe(true);
  });
  it("rifiuta link non https e javascript:", () => {
    expect(NewsItemSchema.safeParse({ ...item, url: "http://example.com" }).success).toBe(false);
    expect(NewsItemSchema.safeParse({ ...item, url: "javascript:alert(1)" }).success).toBe(false);
  });
  it("rifiuta estratti troppo lunghi (niente ripubblicazione di articoli)", () => {
    expect(NewsItemSchema.safeParse({ ...item, excerpt: "x".repeat(301) }).success).toBe(false);
  });
  it("una fonte richiede feed https e host consentito valido", () => {
    expect(NewsSourceSchema.safeParse({ id: "cisco-talos", name: "Cisco Talos", feedUrl: "https://example.com/feed", allowedHost: "example.com", category: "cybersecurity" }).success).toBe(true);
    expect(NewsSourceSchema.safeParse({ id: "x-y", name: "X", feedUrl: "file:///etc/passwd", allowedHost: "localhost", category: "vendor" }).success).toBe(false);
  });
});
