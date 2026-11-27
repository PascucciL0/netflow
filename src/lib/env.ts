/**
 * Configurazione runtime. La modalità è "supabase" solo se entrambe le variabili pubbliche sono presenti;
 * altrimenti l'app usa lo store locale (modalità demo). Nessun segreto passa da qui.
 */
export const supabaseConfig = {
  url: process.env.NEXT_PUBLIC_SUPABASE_URL ?? "",
  publishableKey: process.env.NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY ?? "",
};

export const dataMode: "local" | "supabase" = supabaseConfig.url && supabaseConfig.publishableKey ? "supabase" : "local";
