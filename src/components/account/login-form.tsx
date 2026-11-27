"use client";

import Link from "next/link";
import { useState, type FormEvent } from "react";
import { Logo } from "@/components/shell/logo";
import { dataMode } from "@/lib/env";
import { safeNextPath } from "@/lib/safe-redirect";
import { getSupabaseBrowserClient } from "@/lib/supabase/client";

/** Messaggi comprensibili per gli errori più comuni di Supabase Auth. */
function message(code: string | undefined, fallback: string): string {
  switch (code) {
    case "invalid_credentials":
      return "Email o password non corrette.";
    case "email_not_confirmed":
      return "L'indirizzo email non è ancora confermato.";
    case "over_request_rate_limit":
    case "over_email_send_rate_limit":
      return "Troppi tentativi. Riprova tra qualche minuto.";
    default:
      return /fetch|network/i.test(fallback) ? "Connessione assente. Controlla la rete e riprova." : "Accesso non riuscito. Riprova.";
  }
}

/**
 * Accesso con email e password. La registrazione è chiusa: l'account si crea dal pannello Supabase
 * (docs/DEPLOYMENT_GUIDE.md). Email e password funzionano anche nella PWA installata,
 * dove i magic link aprirebbero il browser invece dell'app.
 * La pagina copre la struttura dell'app (barra di navigazione inclusa) finché non si è entrati.
 */
export function LoginForm() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState<string | null>(null);

  async function onSubmit(e: FormEvent) {
    e.preventDefault();
    setBusy(true);
    setError(null);
    const { error: err } = await getSupabaseBrowserClient().auth.signInWithPassword({ email: email.trim(), password });
    if (err) {
      setError(message(err.code, err.message));
      setBusy(false);
      return;
    }
    // navigazione completa: il proxy vede la nuova sessione e lo store riparte con l'utente giusto
    window.location.replace(safeNextPath(new URLSearchParams(window.location.search).get("next")));
  }

  return (
    <div className="fixed inset-0 z-50 overflow-y-auto bg-bg">
      <div className="mx-auto flex min-h-full w-full max-w-sm flex-col justify-center px-4 py-12">
        <Logo />
        <h1 className="mt-8 text-[24px] font-semibold tracking-[-0.02em] text-ink">Accedi</h1>

        {dataMode === "local" ? (
          <div className="mt-4 space-y-4 text-[15px] leading-relaxed text-ink-2">
            <p>NetFlow è in modalità locale: i progressi restano in questo browser e non serve un account.</p>
            <Link href="/" className="inline-flex h-11 items-center rounded-[var(--radius-control)] bg-accent px-4 font-medium text-on-accent">
              Vai al feed
            </Link>
          </div>
        ) : (
          <form onSubmit={onSubmit} className="mt-6 space-y-4" noValidate>
            <div>
              <label htmlFor="email" className="mb-1.5 block text-[14px] font-medium text-ink">Email</label>
              <input
                id="email"
                type="email"
                autoComplete="username"
                inputMode="email"
                required
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                className="h-12 w-full rounded-[var(--radius-control)] border border-line-strong bg-surface px-3 text-[16px] text-ink outline-none focus:border-accent"
              />
            </div>
            <div>
              <label htmlFor="password" className="mb-1.5 block text-[14px] font-medium text-ink">Password</label>
              <input
                id="password"
                type="password"
                autoComplete="current-password"
                required
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                className="h-12 w-full rounded-[var(--radius-control)] border border-line-strong bg-surface px-3 text-[16px] text-ink outline-none focus:border-accent"
              />
            </div>
            {error && (
              <p role="alert" className="text-[14px] text-again">
                {error}
              </p>
            )}
            <button
              type="submit"
              disabled={busy || !email || !password}
              className="inline-flex h-12 w-full items-center justify-center rounded-[var(--radius-control)] bg-accent text-[15px] font-medium text-on-accent disabled:opacity-40"
            >
              {busy ? "Accesso in corso…" : "Accedi"}
            </button>
            <p className="text-[13px] leading-relaxed text-ink-3">NetFlow è un&apos;app personale: la registrazione non è aperta.</p>
          </form>
        )}
      </div>
    </div>
  );
}
