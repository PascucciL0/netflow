import type { Metadata } from "next";
import Link from "next/link";

export const metadata: Metadata = { title: "Offline" };

/** Mostrata dal service worker quando manca la rete e la pagina richiesta non è mai stata aperta. */
export default function OfflinePage() {
  return (
    <div className="space-y-4 py-10">
      <h1 className="text-[24px] font-semibold tracking-[-0.02em] text-ink">Sei offline</h1>
      <p className="text-[15px] leading-relaxed text-ink-2">
        Questa pagina non è ancora disponibile senza rete. Le pagine e i contenuti che hai già aperto restano consultabili, e i progressi che registri vengono inviati appena torna la connessione.
      </p>
      <Link href="/" className="inline-flex h-11 items-center rounded-[var(--radius-control)] bg-surface-2 px-4 text-[14.5px] font-medium text-ink hover:bg-surface-3">
        Torna al feed
      </Link>
    </div>
  );
}
