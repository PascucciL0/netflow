/**
 * Catalogo e contenuti di sistema, caricati dal repository e validati all'avvio.
 * Se un file del seed non è valido l'app fallisce subito (meglio che mostrare dati corrotti).
 */
import { BlueprintSchema, TrackSchema, type Blueprint, type BlueprintObjective, type TopicNode, type Track } from "@/domain/catalog";
import type { ContentItem } from "@/domain/content";
import { ContentPackageSchema } from "@/domain/import-schema";
import { flattenTopics } from "@/engine/catalog";
import blueprintJson from "../../content/ccna/blueprint.json";
import trackJson from "../../content/ccna/track.json";
import core001 from "../../content/ccna/items/core-001.json";

const SEED_PACKAGES: unknown[] = [core001];

export const blueprint: Blueprint = BlueprintSchema.parse(blueprintJson);
export const tracks: Track[] = [TrackSchema.parse(trackJson)];
export const topics: TopicNode[] = flattenTopics(tracks);
export const topicById = new Map(topics.map((t) => [t.id, t]));

export const objectives: BlueprintObjective[] = blueprint.domains.flatMap((d) => d.objectives);
export const objectiveById = new Map(objectives.map((o) => [o.id, o]));

export const seedItems: ContentItem[] = SEED_PACKAGES.flatMap((p) => ContentPackageSchema.parse(p).items);
export const seedItemById = new Map(seedItems.map((i) => [i.id, i]));

export const moduleTitle = (moduleId: string): string =>
  tracks.flatMap((t) => t.modules).find((m) => m.id === moduleId)?.title ?? moduleId;
