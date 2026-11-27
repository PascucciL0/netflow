/**
 * Proxy (ex middleware): in modalità Supabase aggiorna i cookie di sessione e chiude l'app agli utenti
 * non autenticati, reindirizzandoli a /login. In modalità locale non fa nulla.
 *
 * L'identità vera è verificata dal database (RLS) a ogni richiesta di dati: qui si decide solo
 * quali pagine mostrare. Le pagine non contengono dati personali (vengono caricati dal client).
 */
import { createServerClient } from "@supabase/ssr";
import { NextResponse, type NextRequest } from "next/server";
import { dataMode, supabaseConfig } from "@/lib/env";

const PUBLIC_PATHS = new Set(["/login", "/offline"]);

export async function proxy(request: NextRequest) {
  if (dataMode !== "supabase") return NextResponse.next();

  let response = NextResponse.next({ request });
  const supabase = createServerClient(supabaseConfig.url, supabaseConfig.publishableKey, {
    cookies: {
      getAll: () => request.cookies.getAll(),
      setAll(cookiesToSet, headers) {
        cookiesToSet.forEach(({ name, value }) => request.cookies.set(name, value));
        response = NextResponse.next({ request });
        cookiesToSet.forEach(({ name, value, options }) => response.cookies.set(name, value, options));
        Object.entries(headers ?? {}).forEach(([k, v]) => response.headers.set(k, v));
      },
    },
  });

  // getClaims verifica la firma del token (non si fida del solo cookie) e lo rinnova se scaduto.
  const { data } = await supabase.auth.getClaims();
  const signedIn = typeof data?.claims?.sub === "string";
  const { pathname, search } = request.nextUrl;

  const redirect = (to: URL) => {
    const r = NextResponse.redirect(to);
    response.cookies.getAll().forEach((c) => r.cookies.set(c));
    r.headers.set("Cache-Control", "private, no-store");
    return r;
  };

  if (!signedIn && !PUBLIC_PATHS.has(pathname)) {
    const to = new URL("/login", request.url);
    if (pathname !== "/") to.searchParams.set("next", `${pathname}${search}`);
    return redirect(to);
  }
  if (signedIn && pathname === "/login") return redirect(new URL("/", request.url));
  return response;
}

export const config = {
  matcher: [
    // Esclusi: asset statici, service worker, manifest, icone e font (devono funzionare anche prima del login).
    "/((?!_next/static|_next/image|sw\\.js|manifest\\.webmanifest|icons/|favicon\\.ico|icon\\.svg|apple-icon\\.png|robots\\.txt|.*\\.(?:png|svg|jpg|jpeg|webp|ico|woff2?)$).*)",
  ],
};
