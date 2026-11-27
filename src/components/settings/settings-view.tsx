"use client";

import { Download, Monitor, Moon, Sun } from "lucide-react";
import { useState } from "react";
import { emptySnapshot, type UserPreferences } from "@/domain/progress";
import { downloadJson, makeBackup } from "@/data/backup";
import { useDispatch, useHydrated, useSnapshot, useStoreApi } from "@/data/progress-context";
import { localDayKey } from "@/lib/dates";
import { dataMode } from "@/lib/env";
import { AccountPanel } from "@/components/account/account-panel";

const THEMES: { value: UserPreferences["theme"]; label: string; icon: typeof Sun }[] = [
  { value: "system", label: "Sistema", icon: Monitor },
  { value: "light", label: "Chiaro", icon: Sun },
  { value: "dark", label: "Scuro", icon: Moon },
];

export function SettingsView() {
  const snapshot = useSnapshot();
  const hydrated = useHydrated();
  const dispatch = useDispatch();
  const store = useStoreApi();
  const [confirmReset, setConfirmReset] = useState(false);
  const prefs = snapshot.preferences;

  const toggleLang = (l: "it" | "en") => {
    const has = prefs.languages.includes(l);
    const next = has ? prefs.languages.filter((x) => x !== l) : [...prefs.languages, l];
    if (next.length > 0) dispatch({ type: "preferences/update", patch: { languages: next } });
  };

  return (
    <div className="space-y-8">
      <h1 className="text-[24px] font-semibold tracking-[-0.02em] text-ink">Impostazioni</h1>

      <section aria-labelledby="s-theme">
        <h2 id="s-theme" className="meta-strip mb-3">Tema</h2>
        <div className="grid grid-cols-3 gap-2" role="radiogroup" aria-labelledby="s-theme">
          {THEMES.map(({ value, label, icon: Icon }) => {
            const active = hydrated && prefs.theme === value;
            return (
              <button
                key={value}
                type="button"
                role="radio"
                aria-checked={active}
                onClick={() => dispatch({ type: "preferences/update", patch: { theme: value } })}
                className={`flex h-16 flex-col items-center justify-center gap-1 rounded-[var(--radius-control)] border text-[14px] font-medium ${active ? "border-accent bg-accent-soft text-accent-text" : "border-line bg-surface text-ink-2"}`}
              >
                <Icon size={18} aria-hidden /> {label}
              </button>
            );
          })}
        </div>
      </section>

      <section aria-labelledby="s-lang">
        <h2 id="s-lang" className="meta-strip mb-3">Lingua dei contenuti nel feed</h2>
        <div className="flex gap-2">
          {(["it", "en"] as const).map((l) => (
            <button
              key={l}
              type="button"
              aria-pressed={hydrated && prefs.languages.includes(l)}
              onClick={() => toggleLang(l)}
              className={`h-11 rounded-full border px-4 text-[14px] font-medium ${hydrated && prefs.languages.includes(l) ? "border-accent bg-accent-soft text-accent-text" : "border-line text-ink-2"}`}
            >
              {l === "it" ? "Italiano" : "English"}
            </button>
          ))}
        </div>
        <p className="mt-2 text-[13px] text-ink-3">
          Fuso orario per le scadenze: {prefs.timeZone} (oggi {hydrated ? localDayKey(new Date(), prefs.timeZone) : "…"}).
        </p>
      </section>

      <AccountPanel />

      <section aria-labelledby="s-data">
        <h2 id="s-data" className="meta-strip mb-3">I tuoi dati</h2>
        <div className="rounded-[var(--radius-card)] border border-line bg-surface p-4">
          <p className="text-[14.5px] leading-relaxed text-ink-2">
            {dataMode === "supabase"
              ? "I progressi sono salvati nel tuo account e sincronizzati tra i dispositivi. Il backup JSON resta utile come copia personale: contiene stato degli argomenti, interazioni, ripassi e storico delle valutazioni."
              : "In modalità locale i progressi restano solo in questo browser. Esporta un backup regolarmente: contiene stato degli argomenti, interazioni, ripassi e storico delle valutazioni."}
          </p>
          <button
            type="button"
            onClick={() => downloadJson(`netflow-backup-${new Date().toISOString().slice(0, 10)}.json`, makeBackup(store.getSnapshot(), new Date()))}
            className="mt-3 inline-flex h-11 items-center gap-2 rounded-[var(--radius-control)] bg-surface-2 px-4 text-[14.5px] font-medium text-ink hover:bg-surface-3"
          >
            <Download size={16} aria-hidden /> Esporta backup JSON
          </button>
        </div>
        <div className="mt-3 rounded-[var(--radius-card)] border border-again/30 p-4">
          <p className="text-[14.5px] text-ink-2">{dataMode === "supabase" ? "Cancella tutti i progressi dal tuo account, su tutti i dispositivi." : "Cancella tutti i progressi locali."} L&apos;operazione non si può annullare.</p>
          {confirmReset ? (
            <div className="mt-3 flex gap-2">
              <button type="button" onClick={() => { store.replace(emptySnapshot()); setConfirmReset(false); }} className="h-11 flex-1 rounded-[var(--radius-control)] bg-again text-[14.5px] font-medium text-white">
                Conferma cancellazione
              </button>
              <button type="button" onClick={() => setConfirmReset(false)} className="h-11 flex-1 rounded-[var(--radius-control)] border border-line-strong text-[14.5px] font-medium text-ink">
                Annulla
              </button>
            </div>
          ) : (
            <button type="button" onClick={() => setConfirmReset(true)} className="mt-3 h-11 rounded-[var(--radius-control)] border border-again/40 px-4 text-[14.5px] font-medium text-again">
              Cancella progressi
            </button>
          )}
        </div>
      </section>

      <section aria-labelledby="s-about">
        <h2 id="s-about" className="meta-strip mb-3">Informazioni</h2>
        <p className="text-[14px] leading-relaxed text-ink-2">
          NetFlow funziona senza servizi AI e senza abbonamenti. Modalità attuale: <span className="font-medium text-ink">{dataMode === "supabase" ? "account sincronizzato (Supabase)" : "locale (demo)"}</span>. I contenuti segnati come &quot;bozza da rivedere&quot; sono proposte non ancora approvate.
        </p>
      </section>
    </div>
  );
}
