"use client";

import { useEffect, useState } from "react";

/** Si ricarica la pagina solo dopo un aggiornamento chiesto dall'utente, non alla prima installazione. */
let updateRequested = false;

/**
 * Registra il service worker (solo in produzione) e propone l'aggiornamento quando
 * è disponibile una nuova versione, invece di cambiarla sotto i piedi dell'utente.
 */
export function ServiceWorkerRegistration() {
  const [waiting, setWaiting] = useState<ServiceWorker | null>(null);

  useEffect(() => {
    if (process.env.NODE_ENV !== "production" || !("serviceWorker" in navigator)) return;
    let reloaded = false;
    const onControllerChange = () => {
      if (reloaded || !updateRequested) return;
      reloaded = true;
      window.location.reload();
    };
    let registration: ServiceWorkerRegistration | undefined;
    const onVisible = () => {
      if (document.visibilityState === "visible") void registration?.update().catch(() => undefined);
    };

    navigator.serviceWorker
      .register("/sw.js", { scope: "/", updateViaCache: "none" })
      .then((reg) => {
        registration = reg;
        if (reg.waiting && navigator.serviceWorker.controller) setWaiting(reg.waiting);
        reg.addEventListener("updatefound", () => {
          const sw = reg.installing;
          sw?.addEventListener("statechange", () => {
            // c'era già un service worker attivo: è un aggiornamento, non la prima installazione
            if (sw.state === "installed" && navigator.serviceWorker.controller) setWaiting(sw);
          });
        });
      })
      .catch(() => undefined);

    navigator.serviceWorker.addEventListener("controllerchange", onControllerChange);
    document.addEventListener("visibilitychange", onVisible);
    return () => {
      navigator.serviceWorker.removeEventListener("controllerchange", onControllerChange);
      document.removeEventListener("visibilitychange", onVisible);
    };
  }, []);

  if (!waiting) return null;
  return (
    <div role="status" className="fixed inset-x-3 bottom-[calc(5rem+env(safe-area-inset-bottom))] z-40 mx-auto flex max-w-md items-center gap-3 rounded-[var(--radius-card)] border border-line bg-surface p-3 shadow-[var(--shadow-card)] lg:bottom-6">
      <p className="flex-1 text-[14px] text-ink-2">È disponibile una nuova versione di NetFlow.</p>
      <button type="button" onClick={() => {
          updateRequested = true;
          waiting.postMessage({ type: "SKIP_WAITING" });
        }} className="h-10 rounded-[var(--radius-control)] bg-accent px-3 text-[14px] font-medium text-on-accent">
        Aggiorna
      </button>
      <button type="button" onClick={() => setWaiting(null)} className="h-10 rounded-[var(--radius-control)] px-2 text-[14px] text-ink-3" aria-label="Più tardi">
        Più tardi
      </button>
    </div>
  );
}
