/**
 * Formato di importazione versionato: "netflow.content-package".
 * Documentazione completa: docs/IMPORT_FORMAT.md.
 *
 * Il seed iniziale del repository usa ESATTAMENTE questo formato:
 * ciò che funziona per il seed funziona anche per l'import.
 */
import { z } from "zod";
import { ContentItemSchema, LanguageSchema, SlugSchema } from "./content";

export const PACKAGE_FORMAT = "netflow.content-package" as const;
export const CURRENT_SCHEMA_VERSION = 1 as const;

/** Limiti di sicurezza per l'import. */
export const IMPORT_LIMITS = {
  maxFileBytes: 2 * 1024 * 1024,
  maxItems: 300,
} as const;

export const PackageMetaSchema = z.object({
  id: SlugSchema,
  title: z.string().min(3).max(140),
  language: LanguageSchema,
  /** Chi o cosa ha prodotto il pacchetto, es. "ChatGPT — Translation & Study Notes". */
  generator: z.string().max(120).optional(),
  createdAt: z.iso.date(),
  notes: z.string().max(2000).optional(),
});

export const ContentPackageSchema = z
  .object({
    format: z.literal(PACKAGE_FORMAT),
    schemaVersion: z.literal(CURRENT_SCHEMA_VERSION),
    package: PackageMetaSchema,
    items: z.array(ContentItemSchema).min(1).max(IMPORT_LIMITS.maxItems),
  })
  .strict()
  .superRefine((pkg, ctx) => {
    const seen = new Set<string>();
    pkg.items.forEach((it, i) => {
      if (seen.has(it.id)) ctx.addIssue({ code: "custom", message: `ID duplicato nel pacchetto: ${it.id}`, path: ["items", i, "id"] });
      seen.add(it.id);
    });
  });
export type ContentPackage = z.infer<typeof ContentPackageSchema>;
