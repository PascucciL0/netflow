# Architettura di NetFlow

NetFlow è una web app Next.js (App Router) installabile come PWA. Il cuore didattico (feed, spaced repetition, progressi) è **codice TypeScript puro e deterministico**, eseguibile senza server e senza AI.

## Livelli e cartelle

```
content/                 Dati di sistema versionati nel repository
  ccna/blueprint.json    Obiettivi ufficiali CCNA v2.0 (estratti dal PDF Cisco)
  ccna/track.json        Learning track → moduli → argomenti → prerequisiti
  ccna/items/*.json      Contenuti, nello stesso formato dell'import (netflow.content-package v1)
src/
  domain/                CONTRATTI CONDIVISI (zod + tipi). Unica fonte di verità.
    content.ts           ContentItem, RecallPrompt, Source, etichette
    catalog.ts           Track, Module, Topic, Blueprint
    progress.ts          TopicStatus, ReviewState, ReviewEvent, UserSnapshot, preferenze
    mutations.ts         Mutation: l'unico modo di modificare i dati personali
    import-schema.ts     ContentPackageSchema, limiti di import
  engine/                LEARNING ENGINE: funzioni pure, nessun I/O, "now" sempre passato come parametro
    scheduler.ts         Wrapper FSRS (ts-fsrs), mapping valutazioni, reset, retrievability
    reducer.ts           (snapshot, mutation, now) → snapshot. Idempotenza e controllo versione
    feed.ts              Costruzione del feed (bucket + interleaving pesato + varietà)
    progress-stats.ts    Statistiche reali per la sezione Progressi
    catalog.ts           Grafo argomenti, validazione cicli/prerequisiti
  data/                  ACCESSO AI DATI
    catalog.ts           Carica e valida catalogo e seed all'avvio
    local-store.ts       ProgressStore su localStorage (modalità locale/demo)
    progress-context.tsx Provider React + hook (useSnapshot, useDispatch)
    backup.ts            Export JSON versionato (netflow.user-backup v1)
  components/            PRESENTAZIONE (React)
    shell/ ui/ content/ diagrams/ feed/ review/ library/ progress/ settings/
  app/                   Route Next.js (sottili: delegano ai componenti)
  lib/                   Utilità trasversali (date/fusi orari, tema, env)
supabase/
  migrations/            Migration SQL versionate (schema + RLS + record_review)
  tests/auth-stub.sql    Stub di auth.* per testare le policy in locale con PGlite
tests/                   Vitest: engine, reducer, contenuti, schema import, RLS
```

Regola delle dipendenze: `app → components → data → engine → domain`. `engine` e `domain` non importano mai React, Next o Supabase.

## Flusso dei dati

1. All'avvio `data/catalog.ts` valida con zod catalogo e contenuti: un seed non valido blocca la build (fail fast).
2. Lo stato personale è uno `UserSnapshot` (argomenti, contenuti, stati di ripasso, eventi, preferenze).
3. Ogni azione dell'utente è una `Mutation` passata a `ProgressStore.dispatch`, che applica il reducer condiviso.
4. Il feed è calcolato da `buildFeed()` **una volta per sessione** (e su "Aggiorna il feed"), non a ogni interazione: le card non si spostano mentre si scorre.

## Modalità locale e Supabase

- **Locale (attiva oggi)**: nessuna credenziale. Dati in `localStorage`, sincronizzati tra schede con l'evento `storage`, esportabili in JSON.
- **Supabase (da collegare)**: stessa interfaccia `ProgressStore`. L'adapter remoto applica la mutazione in modo ottimistico con lo stesso reducer, poi la persiste. Le revisioni passano dalla funzione SQL `record_review` (atomica, idempotente sull'id evento, con controllo di versione). Il calcolo FSRS resta nel client per non duplicare la logica: il server garantisce proprietà, idempotenza e concorrenza. Vedi `docs/DATABASE_SCHEMA.md`.
- La scelta della modalità è in `src/lib/env.ts` (`dataMode`).

## Next.js 16: note che contano

- `cacheComponents` e `partialPrefetching` sono attivi. I valori instabili (`new Date()`) nei client component vanno calcolati dopo l'idratazione (`useHydrated`) o in effetti, altrimenti la build fallisce.
- Le route dinamiche usano `generateStaticParams` e leggono `params` dentro `<Suspense>`. `dynamicParams` non è supportato.
- Con Cache Components la navigazione mantiene montate le route recenti (`<Activity>`): tornando al feed la posizione di scorrimento resta.
- `middleware.ts` si chiama ora `proxy.ts` (servirà per la sessione Supabase).
- Prima di scrivere codice Next, leggere `node_modules/next/dist/docs/` (vedi `AGENTS.md`).

## Sicurezza by design

- Contenuti: Markdown senza HTML grezzo, URL filtrati, immagini disattivate. I diagrammi sono un registro chiuso di componenti: un contenuto importato può solo citarne l'id.
- Schema di import rigoroso (`.strict()` sul pacchetto, regex sugli id, solo https, limiti di dimensione).
- Database: RLS su tutte le tabelle, `anon` senza privilegi, `review_events` append-only. Dettagli in `SECURITY.md`.

## Decisioni significative

Gli ADR sono in `docs/adr/`. Indice:

| ADR | Decisione |
|---|---|
| 0001 | Stack: Next.js 16 + TS strict + Tailwind 4 + Supabase, modalità locale prima |
| 0002 | Contratti zod in `src/domain` come unica fonte di verità; seed = formato di import |
| 0003 | Modello dati: contenuti di sistema + importati per utente, recall con chiave stabile |
| 0004 | Spaced repetition con FSRS (ts-fsrs 5.4.2), mapping valutazioni, lettura ≠ revisione |
| 0005 | Feed deterministico: bucket, interleaving pesato, vincoli di varietà, niente infinito |
| 0006 | Diagrammi come registro chiuso di componenti React/SVG (niente Mermaid/SVG importati) |
