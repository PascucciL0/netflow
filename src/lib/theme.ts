import { STORAGE_KEY } from "@/data/local-store";

/**
 * Script eseguito prima del primo paint: imposta data-theme per evitare il "flash" di tema.
 * Contenuto statico (nessun dato utente interpolato). Se si introduce una CSP, va consentito tramite hash.
 */
export const THEME_BOOT_SCRIPT = `(function(){try{var p=JSON.parse(localStorage.getItem(${JSON.stringify(
  STORAGE_KEY,
)})||"{}");var t=(p.preferences&&p.preferences.theme)||"system";if(t==="system"){t=matchMedia("(prefers-color-scheme: dark)").matches?"dark":"light"}document.documentElement.dataset.theme=t}catch(e){document.documentElement.dataset.theme="light"}})()`;

export function resolveTheme(pref: "system" | "light" | "dark"): "light" | "dark" {
  if (pref !== "system") return pref;
  return window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light";
}
