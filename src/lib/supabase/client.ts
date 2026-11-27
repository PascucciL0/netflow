/**
 * Client Supabase per il browser (sessione nei cookie, condivisa con proxy.ts).
 * Usa solo la publishable key: la sicurezza dei dati è garantita dalle policy RLS.
 */
import { createBrowserClient } from "@supabase/ssr";
import type { SupabaseClient } from "@supabase/supabase-js";
import { supabaseConfig } from "@/lib/env";

let client: SupabaseClient | null = null;

export function getSupabaseBrowserClient(): SupabaseClient {
  if (!client) client = createBrowserClient(supabaseConfig.url, supabaseConfig.publishableKey);
  return client;
}
