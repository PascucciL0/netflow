/**
 * Contratto delle notizie tecniche (P2).
 *
 * Decisione (ADR 0007): le news NON sono un ContentKind. Non hanno domande di recall,
 * non entrano nello spaced repetition, non hanno revisioni né prerequisiti e scadono.
 * Sono un tipo separato che il feed può mescolare in un bucket opzionale (peso indicativo 5%):
 * se la lista è vuota o il recupero fallisce, il feed didattico non cambia.
 *
 * Sicurezza: le fonti sono un'allowlist statica nel codice (NEWS_SOURCES). Nessun URL di feed
 * viene mai fornito dall'utente o da contenuti importati (protezione SSRF).
 */
import { z } from "zod";
import { SlugSchema } from "./content";

export const NewsCategorySchema = z.enum(["networking", "network-security", "cybersecurity", "vendor"]);
export type NewsCategory = z.infer<typeof NewsCategorySchema>;

export const NEWS_CATEGORY_LABELS: Record<NewsCategory, string> = {
  networking: "Networking",
  "network-security": "Network Security",
  cybersecurity: "Cybersecurity",
  vendor: "Vendor",
};

const HttpsUrl = z.url({ protocol: /^https$/, hostname: z.regexes.domain }).max(500);

/** Una fonte dell'allowlist. L'elenco vive nel codice del modulo news, non nei dati utente. */
export const NewsSourceSchema = z.object({
  id: SlugSchema,
  name: z.string().min(2).max(80),
  /** URL del feed RSS/Atom. Solo https; l'host deve coincidere con allowedHost. */
  feedUrl: HttpsUrl,
  /** Host consentito per feed e link agli articoli (es. "blog.talosintelligence.com"). */
  allowedHost: z.string().regex(z.regexes.domain),
  category: NewsCategorySchema,
});
export type NewsSource = z.infer<typeof NewsSourceSchema>;

export const NewsItemSchema = z.object({
  /** Hash stabile di (sourceId, url canonico): serve per la deduplicazione. */
  id: z.string().regex(/^[a-z0-9-]{3,80}:[a-f0-9]{16,64}$/),
  sourceId: SlugSchema,
  title: z.string().min(3).max(200),
  /** Link all'articolo originale. Mai ripubblicare l'articolo. */
  url: HttpsUrl,
  publishedAt: z.iso.datetime(),
  /** Breve descrizione così come fornita dal feed, solo testo, troncata. */
  excerpt: z.string().max(300).default(""),
  category: NewsCategorySchema,
  fetchedAt: z.iso.datetime(),
});
export type NewsItem = z.infer<typeof NewsItemSchema>;

/** Le notizie più vecchie di così non entrano nel feed. */
export const NEWS_MAX_AGE_DAYS = 14;
