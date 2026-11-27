/**
 * Contratti condivisi dei contenuti didattici.
 *
 * Questo file è l'unica fonte di verità per la forma dei contenuti:
 * lo schema di importazione, il seed, il Learning Engine e l'interfaccia
 * derivano tutti da qui. Non duplicare questi tipi altrove.
 */
import { z } from "zod";

/** ID stabile leggibile (slug). Sopravvive agli aggiornamenti del contenuto. */
export const SlugSchema = z
  .string()
  .regex(/^[a-z0-9][a-z0-9-]{1,78}[a-z0-9]$/, "ID non valido: usa minuscole, cifre e trattini (3-80 caratteri)");

/** ID di un obiettivo del blueprint, es. "ccna-v2:1.3" o "ccna-v2:1.5.a". */
export const ObjectiveIdSchema = z
  .string()
  .regex(/^[a-z0-9-]+:\d+\.\d+(\.[a-z])?$/, "ID obiettivo non valido (atteso es. ccna-v2:1.3)");

export const CONTENT_KINDS = [
  "lesson", // microlezione
  "deep_dive", // approfondimento
  "flashcard", // carta breve domanda/risposta
  "recall", // domanda aperta di active recall
  "command", // comandi Cisco IOS
  "config", // configurazione commentata
  "output_analysis", // analisi di output CLI
  "troubleshooting", // scenario di troubleshooting
  "comparison", // confronto tra tecnologie
  "trivia", // curiosità tecnica
  "enterprise", // applicazione aziendale
  "common_mistake", // errore comune
] as const;
export const ContentKindSchema = z.enum(CONTENT_KINDS);
export type ContentKind = z.infer<typeof ContentKindSchema>;

export const LanguageSchema = z.enum(["it", "en"]);
export type Language = z.infer<typeof LanguageSchema>;

/** 1 = base, 2 = intermedio, 3 = avanzato */
export const DifficultySchema = z.union([z.literal(1), z.literal(2), z.literal(3)]);
export type Difficulty = z.infer<typeof DifficultySchema>;

/**
 * Natura del contenuto (requisito: distinguere informazioni ufficiali,
 * spiegazioni didattiche originali, approfondimenti professionali, esempi ipotetici).
 */
export const ProvenanceSchema = z.enum(["official", "original", "professional", "hypothetical"]);
export type Provenance = z.infer<typeof ProvenanceSchema>;

/** "proposed" = bozza non ancora rivista dallo studente; "approved" = formulazione approvata. */
export const ReviewStatusSchema = z.enum(["proposed", "approved"]);

export const SourceTypeSchema = z.enum(["official", "rfc", "vendor_docs", "standard", "course", "other"]);

export const SourceSchema = z.object({
  title: z.string().min(2).max(200),
  /** Solo https. Mai URL inventati: se non c'è un URL verificato, ometterlo. */
  url: z
    .url({ protocol: /^https$/, hostname: z.regexes.domain })
    .max(500)
    .optional(),
  publisher: z.string().min(2).max(120),
  type: SourceTypeSchema,
  /** Data (YYYY-MM-DD) in cui la fonte è stata realmente consultata. Assente = non verificata. */
  verifiedOn: z.iso.date().optional(),
});
export type Source = z.infer<typeof SourceSchema>;

/** Domanda di active recall. Ogni prompt diventa una carta di spaced repetition. */
export const RecallPromptSchema = z.object({
  /** Chiave stabile all'interno del contenuto: progressi e ripassi sono legati a questa chiave. */
  key: z.string().regex(/^[a-z0-9-]{1,40}$/),
  prompt: z.string().min(5).max(600),
  answer: z.string().min(5).max(4000),
  keyPoints: z.array(z.string().min(2).max(300)).max(10).default([]),
  commonMistakes: z.array(z.string().min(2).max(300)).max(10).default([]),
});
export type RecallPrompt = z.infer<typeof RecallPromptSchema>;

/**
 * Riferimento a un diagramma. I diagrammi sono componenti React interni
 * (registro chiuso): un contenuto importato può solo scegliere un id dal
 * registro, mai fornire SVG, HTML o codice.
 */
export const DiagramRefSchema = z.object({
  id: z.string().regex(/^[a-z0-9-]{2,60}$/),
  caption: z.string().max(300).optional(),
});
export type DiagramRef = z.infer<typeof DiagramRefSchema>;

export const MAX_BODY_CHARS = 20_000;

export const ContentItemSchema = z
  .object({
    id: SlugSchema,
    /** Revisione del contenuto: va incrementata a ogni modifica sostanziale. */
    revision: z.int().min(1).max(10_000),
    kind: ContentKindSchema,
    language: LanguageSchema,
    title: z.string().min(3).max(140),
    summary: z.string().min(10).max(400),
    /** Markdown limitato (GFM). L'HTML grezzo viene ignorato in fase di rendering. */
    body: z.string().max(MAX_BODY_CHARS).default(""),
    trackId: SlugSchema,
    topicId: SlugSchema,
    subtopic: z.string().max(80).optional(),
    difficulty: DifficultySchema,
    /** Argomenti (topic id) che è utile conoscere prima. */
    prerequisites: z.array(SlugSchema).max(10).default([]),
    readingMinutes: z.int().min(1).max(30),
    objectives: z.array(ObjectiveIdSchema).max(10).default([]),
    sources: z.array(SourceSchema).min(1, "Ogni contenuto deve indicare almeno una fonte").max(10),
    provenance: ProvenanceSchema,
    reviewStatus: ReviewStatusSchema.default("proposed"),
    tags: z.array(z.string().regex(/^[a-z0-9-]{2,40}$/)).max(12).default([]),
    diagrams: z.array(DiagramRefSchema).max(4).default([]),
    recall: z.array(RecallPromptSchema).max(8).default([]),
    related: z.array(SlugSchema).max(10).default([]),
    createdAt: z.iso.date(),
    updatedAt: z.iso.date(),
  })
  .superRefine((item, ctx) => {
    const keys = new Set<string>();
    for (const r of item.recall) {
      if (keys.has(r.key)) ctx.addIssue({ code: "custom", message: `Chiave recall duplicata: ${r.key}`, path: ["recall"] });
      keys.add(r.key);
    }
    if ((item.kind === "recall" || item.kind === "flashcard") && item.recall.length === 0) {
      ctx.addIssue({ code: "custom", message: `Un contenuto di tipo ${item.kind} richiede almeno una domanda in "recall"`, path: ["recall"] });
    }
    if (item.updatedAt < item.createdAt) {
      ctx.addIssue({ code: "custom", message: "updatedAt precede createdAt", path: ["updatedAt"] });
    }
    if (item.related.includes(item.id)) {
      ctx.addIssue({ code: "custom", message: "Un contenuto non può essere correlato a sé stesso", path: ["related"] });
    }
  });
export type ContentItem = z.infer<typeof ContentItemSchema>;

/** ID di una carta di ripasso: "<contentId>#<recallKey>". */
export type CardId = `${string}#${string}`;
export const cardIdOf = (contentId: string, key: string): CardId => `${contentId}#${key}`;
export const parseCardId = (id: CardId): { contentId: string; key: string } => {
  const i = id.indexOf("#");
  return { contentId: id.slice(0, i), key: id.slice(i + 1) };
};

export const KIND_LABELS: Record<ContentKind, string> = {
  lesson: "Microlezione",
  deep_dive: "Approfondimento",
  flashcard: "Flashcard",
  recall: "Active recall",
  command: "Comandi IOS",
  config: "Configurazione",
  output_analysis: "Analisi output",
  troubleshooting: "Troubleshooting",
  comparison: "Confronto",
  trivia: "Curiosità",
  enterprise: "In azienda",
  common_mistake: "Errore comune",
};

export const DIFFICULTY_LABELS: Record<Difficulty, string> = { 1: "Base", 2: "Intermedio", 3: "Avanzato" };

export const PROVENANCE_LABELS: Record<Provenance, string> = {
  official: "Informazione ufficiale",
  original: "Spiegazione originale",
  professional: "Approfondimento professionale",
  hypothetical: "Esempio ipotetico",
};
