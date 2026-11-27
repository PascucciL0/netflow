/** Funzioni pure sul catalogo (grafo argomenti/prerequisiti). */
import type { Track, TopicNode } from "@/domain/catalog";

export function flattenTopics(tracks: Track[]): TopicNode[] {
  const out: TopicNode[] = [];
  for (const t of tracks)
    for (const m of t.modules)
      for (const topic of m.topics) out.push({ ...topic, trackId: t.id, moduleId: m.id, order: out.length });
  return out;
}

/** Restituisce gli errori di integrità del grafo: prerequisiti inesistenti e cicli. */
export function validateTopicGraph(topics: TopicNode[]): string[] {
  const errors: string[] = [];
  const byId = new Map(topics.map((t) => [t.id, t]));
  if (byId.size !== topics.length) errors.push("ID argomento duplicati nel catalogo");
  for (const t of topics)
    for (const p of t.prerequisites) {
      if (!byId.has(p)) errors.push(`Argomento ${t.id}: prerequisito inesistente ${p}`);
      if (p === t.id) errors.push(`Argomento ${t.id}: prerequisito di sé stesso`);
    }
  // rilevamento cicli (DFS a tre colori)
  const color = new Map<string, 0 | 1 | 2>();
  const visit = (id: string, path: string[]): void => {
    const c = color.get(id) ?? 0;
    if (c === 2) return;
    if (c === 1) {
      errors.push(`Ciclo di prerequisiti: ${[...path, id].join(" → ")}`);
      return;
    }
    color.set(id, 1);
    for (const p of byId.get(id)?.prerequisites ?? []) if (byId.has(p)) visit(p, [...path, id]);
    color.set(id, 2);
  };
  for (const t of topics) visit(t.id, []);
  return errors;
}
