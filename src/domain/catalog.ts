/**
 * Catalogo: learning track → moduli → argomenti, più gli obiettivi ufficiali del blueprint.
 * Il catalogo è dato di sistema (versionato nel repository), non importabile dall'utente.
 */
import { z } from "zod";
import { ObjectiveIdSchema, SlugSchema } from "./content";

export const BlueprintObjectiveSchema = z.object({
  id: ObjectiveIdSchema,
  /** Codice ufficiale così come appare nel blueprint, es. "1.5.a". */
  code: z.string().regex(/^\d+\.\d+(\.[a-z])?$/),
  /** Testo ufficiale in inglese, copiato dal blueprint senza modifiche. */
  title: z.string().min(3),
});
export type BlueprintObjective = z.infer<typeof BlueprintObjectiveSchema>;

export const BlueprintDomainSchema = z.object({
  code: z.string().regex(/^\d+\.0$/),
  title: z.string(),
  /** Peso ufficiale in percentuale. */
  weight: z.number().int().min(0).max(100),
  objectives: z.array(BlueprintObjectiveSchema),
});

export const BlueprintSchema = z.object({
  id: SlugSchema,
  exam: z.string(),
  version: z.string(),
  sourceDocument: z.string(),
  domains: z.array(BlueprintDomainSchema),
});
export type Blueprint = z.infer<typeof BlueprintSchema>;

export const TopicSchema = z.object({
  id: SlugSchema,
  title: z.string(),
  summary: z.string(),
  prerequisites: z.array(SlugSchema).default([]),
  /** Obiettivi del blueprint coperti in tutto o in parte dall'argomento. */
  objectives: z.array(ObjectiveIdSchema).default([]),
});
export type Topic = z.infer<typeof TopicSchema>;

export const ModuleSchema = z.object({
  id: SlugSchema,
  title: z.string(),
  summary: z.string(),
  topics: z.array(TopicSchema),
});
export type Module = z.infer<typeof ModuleSchema>;

export const TrackSchema = z.object({
  id: SlugSchema,
  title: z.string(),
  summary: z.string(),
  blueprintId: SlugSchema.optional(),
  modules: z.array(ModuleSchema),
});
export type Track = z.infer<typeof TrackSchema>;

/** Argomento arricchito con posizione e modulo, comodo per engine e UI. */
export interface TopicNode extends Topic {
  trackId: string;
  moduleId: string;
  /** Ordine globale nel percorso (0-based). */
  order: number;
}
