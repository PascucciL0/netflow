"use client";

import Link from "next/link";
import { useHydrated } from "@/data/progress-context";
import { useImportedLibrary } from "@/data/import-store";
import { ContentDetail } from "@/components/content/content-detail";

/**
 * Approfondimento di un contenuto importato. I contenuti importati vivono nel browser,
 * quindi la pagina viene risolta sul client dopo l'idratazione.
 */
export function ImportedDetail({ id }: { id: string }) {
  const hydrated = useHydrated();
  const library = useImportedLibrary();
  if (!hydrated) return <div className="h-64 animate-pulse rounded-[var(--radius-card)] bg-surface-2" aria-busy="true" />;
  const entry = library.items[id];
  if (!entry) {
    return (
      <div className="py-16 text-center">
        <h1 className="text-[20px] font-semibold text-ink">Contenuto non trovato</h1>
        <p className="mt-2 text-[14.5px] text-ink-2">Non esiste nella libreria di sistema né tra i contenuti importati in questo browser.</p>
        <Link href="/library" className="mt-5 inline-flex h-11 items-center rounded-[var(--radius-control)] bg-surface-2 px-4 text-[14.5px] font-medium text-ink hover:bg-surface-3">
          Vai alla libreria
        </Link>
      </div>
    );
  }
  return <ContentDetail item={entry.item} />;
}
