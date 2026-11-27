/** Logotipo: tre "hop" collegati, richiamo a un percorso di rete. */
export function Logo({ compact = false }: { compact?: boolean }) {
  return (
    <span className="inline-flex items-center gap-2.5">
      <svg width="22" height="22" viewBox="0 0 24 24" aria-hidden>
        <path d="M5 17 L12 7 L19 17" fill="none" stroke="var(--accent)" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" />
        <circle cx="5" cy="17" r="2.6" fill="var(--text)" />
        <circle cx="12" cy="7" r="2.6" fill="var(--accent)" />
        <circle cx="19" cy="17" r="2.6" fill="var(--text)" />
      </svg>
      {!compact && <span className="text-[17px] font-semibold tracking-[-0.02em] text-ink">NetFlow</span>}
    </span>
  );
}
