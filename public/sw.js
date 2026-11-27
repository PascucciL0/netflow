/*
 * NetFlow — service worker (scritto a mano, nessuna dipendenza).
 * Documentazione: docs/DEPLOYMENT_GUIDE.md § PWA.
 *
 * Strategie:
 *   - asset statici con hash (/_next/static, icone, font): cache-first;
 *   - pagine (navigazioni): network-first con timeout, poi copia salvata, poi /offline;
 *   - tutto il resto (RSC, richieste ad altri domini come Supabase, POST, auth): sempre rete, mai in cache.
 * Le pagine dell'app sono statiche e non contengono dati personali: i progressi arrivano dal client
 * direttamente da Supabase (altro dominio, mai intercettato qui).
 *
 * Aggiornamento controllato: il nuovo service worker resta in attesa finché l'utente non sceglie
 * "Aggiorna" (messaggio SKIP_WAITING). Incrementare VERSION a ogni modifica di questo file.
 */
const VERSION = "2026-11-27.1";
const STATIC_CACHE = `netflow-static-${VERSION}`;
const PAGES_CACHE = `netflow-pages-${VERSION}`;
const OFFLINE_URL = "/offline";
const PRECACHE_PAGES = [OFFLINE_URL, "/", "/review", "/library", "/progress", "/settings"];
const MAX_STATIC = 300;
const MAX_PAGES = 80;
const NETWORK_TIMEOUT_MS = 4000;
const NEVER_CACHE = [/^\/login/, /^\/auth\//, /^\/api\//, /^\/sw\.js$/];

/** Salva solo risposte complete, dello stesso dominio, non reindirizzate e non private. */
function cacheable(res) {
  if (!res || !res.ok || res.type !== "basic" || res.redirected) return false;
  const cc = res.headers.get("Cache-Control") || "";
  return !/no-store|private/i.test(cc);
}

async function trim(cacheName, max) {
  const cache = await caches.open(cacheName);
  const keys = await cache.keys();
  for (let i = 0; i < keys.length - max; i++) await cache.delete(keys[i]);
}

self.addEventListener("install", (event) => {
  event.waitUntil(
    (async () => {
      const cache = await caches.open(PAGES_CACHE);
      // una pagina protetta richiesta prima del login viene reindirizzata: non la si salva
      await Promise.all(
        PRECACHE_PAGES.map(async (url) => {
          try {
            const res = await fetch(url, { redirect: "manual", credentials: "same-origin" });
            if (cacheable(res)) await cache.put(url, res);
          } catch {
            /* offline durante l'installazione: si riproverà alla prossima visita */
          }
        }),
      );
    })(),
  );
});

self.addEventListener("activate", (event) => {
  event.waitUntil(
    (async () => {
      const keep = new Set([STATIC_CACHE, PAGES_CACHE]);
      for (const key of await caches.keys()) if (key.startsWith("netflow-") && !keep.has(key)) await caches.delete(key);
      await self.clients.claim();
    })(),
  );
});

self.addEventListener("message", (event) => {
  if (event.origin && event.origin !== self.location.origin) return;
  const type = event.data && event.data.type;
  if (type === "SKIP_WAITING") self.skipWaiting();
  if (type === "CLEAR_CACHES") event.waitUntil(caches.delete(PAGES_CACHE));
});

function isStaticAsset(url) {
  return url.pathname.startsWith("/_next/static/") || url.pathname.startsWith("/icons/") || /\.(?:woff2?|png|svg|ico)$/.test(url.pathname);
}

async function cacheFirst(request) {
  const cache = await caches.open(STATIC_CACHE);
  const hit = await cache.match(request);
  if (hit) return hit;
  const res = await fetch(request);
  if (cacheable(res)) {
    await cache.put(request, res.clone());
    void trim(STATIC_CACHE, MAX_STATIC);
  }
  return res;
}

function withTimeout(promise, ms) {
  return new Promise((resolve, reject) => {
    const t = setTimeout(() => reject(new Error("timeout")), ms);
    promise.then(
      (v) => {
        clearTimeout(t);
        resolve(v);
      },
      (e) => {
        clearTimeout(t);
        reject(e);
      },
    );
  });
}

async function networkFirstPage(request, url) {
  const cache = await caches.open(PAGES_CACHE);
  const key = url.pathname; // la query non cambia la pagina statica
  const network = fetch(request);
  try {
    const res = await withTimeout(network, NETWORK_TIMEOUT_MS);
    if (cacheable(res)) {
      await cache.put(key, res.clone());
      void trim(PAGES_CACHE, MAX_PAGES);
    }
    return res;
  } catch {
    const hit = (await cache.match(key)) || (await cache.match(OFFLINE_URL));
    if (hit) return hit;
    // nessuna copia: si attende comunque la rete (rete lenta, non assente)
    return network;
  }
}

self.addEventListener("fetch", (event) => {
  const { request } = event;
  if (request.method !== "GET") return;
  const url = new URL(request.url);
  if (url.origin !== self.location.origin) return; // Supabase e altri domini: mai intercettati
  if (NEVER_CACHE.some((re) => re.test(url.pathname))) return;
  if (request.headers.has("Authorization")) return;

  if (request.mode === "navigate") {
    event.respondWith(networkFirstPage(request, url));
    return;
  }
  // richieste RSC della navigazione client: sempre rete (offline Next ripiega su una navigazione completa)
  if (request.headers.has("RSC") || url.searchParams.has("_rsc")) return;
  if (isStaticAsset(url)) event.respondWith(cacheFirst(request));
});
