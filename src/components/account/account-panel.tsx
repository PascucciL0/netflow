"use client";

import { CloudOff, Cloud, LogOut, RefreshCw, TriangleAlert } from "lucide-react";
import { useState } from "react";
import { useSyncStatus, useSyncStore } from "@/data/progress-context";
import type { SyncStatus } from "@/data/sync-store";
import { getSupabaseBrowserClient } from "@/lib/supabase/client";

const PHASE_LABEL: Record<SyncStatus["phase"], string> = {
  loading: "Caricamento…",
  synced: "Sincronizzato",
  syncing: "Sincronizzazione in corso…",
  offline: "Offline: le modifiche verranno inviate al ritorno della rete",
  error: "Errore di sincronizzazione",
  signed_out: "Non hai effettuato l'accesso",
};

function time(iso: string | undefined): string {
  if (!iso) return "";
  return new Intl.DateTimeFormat("it-IT", { hour: "2-digit", minute: "2-digit", day: "numeric", month: "short" }).format(new Date(iso));
}

/** Account e stato della sincronizzazione (solo in modalità Supabase). */
export function AccountPanel() {
  const status = useSyncStatus();
  const store = useSyncStore();
  const [confirmLogout, setConfirmLogout] = useState(false);
  if (!status || !store) return null;

  async function logout() {
    store?.clearDeviceCache();
    await getSupabaseBrowserClient().auth.signOut();
    // svuota anche le pagine salvate dal service worker
    navigator.serviceWorker?.controller?.postMessage({ type: "CLEAR_CACHES" });
    window.location.replace("/login");
  }

  const Icon = status.phase === "offline" ? CloudOff : status.phase === "error" ? TriangleAlert : Cloud;

  return (
    <section aria-labelledby="s-account">
      <h2 id="s-account" className="meta-strip mb-3">Account e sincronizzazione</h2>
      <div className="rounded-[var(--radius-card)] border border-line bg-surface p-4">
        {status.email && <p className="text-[14.5px] font-medium text-ink">{status.email}</p>}
        <p className="mt-1 flex items-center gap-2 text-[14px] text-ink-2" role="status">
          <Icon size={16} aria-hidden /> {PHASE_LABEL[status.phase]}
          {status.pending > 0 && ` · ${status.pending} in attesa`}
        </p>
        {status.lastSyncedAt && <p className="mt-1 text-[13px] text-ink-3">Ultima sincronizzazione: {time(status.lastSyncedAt)}</p>}
        {status.conflicts > 0 && (
          <p className="mt-2 text-[13px] text-ink-3">
            {status.conflicts === 1 ? "Un ripasso è stato ignorato" : `${status.conflicts} ripassi sono stati ignorati`} perché la stessa carta era già stata valutata su un altro dispositivo.
          </p>
        )}
        {status.error && <p className="mt-2 text-[13px] text-again">{status.error}</p>}

        {status.localDataAvailable && (
          <div className="mt-3 rounded-[var(--radius-control)] bg-surface-2 p-3">
            <p className="text-[14px] text-ink-2">Su questo dispositivo ci sono progressi salvati prima dell&apos;accesso. Puoi unirli al tuo account: i dati già presenti nell&apos;account hanno la precedenza.</p>
            <button type="button" onClick={() => store.importLocalData()} className="mt-2 h-11 rounded-[var(--radius-control)] bg-accent px-4 text-[14.5px] font-medium text-on-accent">
              Unisci al mio account
            </button>
          </div>
        )}

        <div className="mt-3 flex flex-wrap gap-2">
          <button type="button" onClick={() => void store.refresh()} className="inline-flex h-11 items-center gap-2 rounded-[var(--radius-control)] bg-surface-2 px-4 text-[14.5px] font-medium text-ink hover:bg-surface-3">
            <RefreshCw size={16} aria-hidden /> Sincronizza ora
          </button>
          {confirmLogout ? (
            <>
              <button type="button" onClick={() => void logout()} className="h-11 rounded-[var(--radius-control)] border border-again/40 px-4 text-[14.5px] font-medium text-again">
                {status.pending > 0 ? `Esci e perdi ${status.pending} modifiche non inviate` : "Conferma uscita"}
              </button>
              <button type="button" onClick={() => setConfirmLogout(false)} className="h-11 rounded-[var(--radius-control)] border border-line-strong px-4 text-[14.5px] font-medium text-ink">
                Annulla
              </button>
            </>
          ) : (
            <button type="button" onClick={() => setConfirmLogout(true)} className="inline-flex h-11 items-center gap-2 rounded-[var(--radius-control)] border border-line-strong px-4 text-[14.5px] font-medium text-ink">
              <LogOut size={16} aria-hidden /> Esci
            </button>
          )}
        </div>
      </div>
    </section>
  );
}
