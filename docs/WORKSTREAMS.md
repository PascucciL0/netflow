# Flussi di lavoro, proprietà dei file e criteri di accettazione

## Convenzioni (valgono per tutti)

- TypeScript `strict`. Niente `any`, niente `as` per aggirare i tipi (consentito solo su JSON già validato da zod).
- I tipi condivisi si importano da `@/domain/*`; non si ridefiniscono.
- `src/engine/*` resta puro: niente React/Next/Supabase/I-O, `now` passato come parametro, test deterministici.
- Ogni modifica ai dati personali passa da una `Mutation` + reducer.
- UI: solo token del design system; testi in italiano naturale, terminologia secondo `03_NETWORKING_GLOSSARY` (es. "MAC address di origine", "flooding", "Routing Table").
- Next 16: leggere `node_modules/next/dist/docs/` prima di usare API Next; niente `new Date()` nel render prima dell'idratazione.
- Prima di ogni commit: `npm run check` (typecheck + lint + test) e `npm run build`.
- Commit piccoli e descrittivi in italiano; un branch per flusso (`ws/<nome>`), PR verso `main`.

## Mappa di proprietà dei file

| Flusso | Possiede (scrive) | Legge / non modifica senza accordo |
|---|---|---|
| **Fondamenta (questo thread)** | `src/domain/**`, `docs/ARCHITECTURE.md`, `docs/adr/**`, `PROJECT_STATUS.md` | tutto |
| **A. Learning Engine** | `src/engine/feed.ts`, `scheduler.ts`, `reducer.ts`, `progress-stats.ts`, `tests/feed|scheduler|reducer*.test.ts` | `src/domain/**` (proposte di modifica via PR dedicata) |
| **B. Content & Import** | `content/**`, `src/components/diagrams/**`, `src/app/import/**`, `src/components/import/**`, `src/data/import*.ts`, `docs/IMPORT_FORMAT.md`, `docs/CONTENT_GENERATION_PROMPT.md`, `tests/content*.test.ts`, `tests/import*.test.ts` | `src/domain/content.ts`, `import-schema.ts` |
| **C. Database, Auth & PWA** | `supabase/**`, `src/data/supabase*.ts`, `src/lib/supabase/**`, `src/proxy.ts`, `src/app/(auth)/**`, `public/sw.js`, `src/app/manifest.ts`, `docs/DATABASE_SCHEMA.md`, `SECURITY.md`, `docs/DEPLOYMENT_GUIDE.md`, `tests/db-*.test.ts` | `src/data/progress-context.tsx` (punto di innesto dell'adapter) |
| **D. QA & Review** | `tests/e2e/**`, `docs/TEST_REPORT.md`, `playwright.config.ts` | tutto (solo lettura + issue/PR di correzione mirate) |

UI condivisa (`src/components/shell|ui|content|feed|review|library|progress|settings/**`, `globals.css`): resta al thread delle fondamenta finché non viene aperto un flusso frontend dedicato; gli altri flussi possono aggiungere componenti nelle proprie cartelle.

## Criteri di accettazione

**Generali (ogni PR)**: `npm run check` verde, build di produzione verde, nessun segreto, nessuna regressione nei test esistenti, documentazione aggiornata se cambia un contratto.

**A. Learning Engine**
- Feed: test per cold start, fallback, varietà, deduplicazione, priorità ripassi, prerequisiti, contenuti salvati/difficili, preferenze di lingua.
- Bucket news opzionale (peso 5%) che non blocca il feed se vuoto.
- FSRS: test per ritardo, anticipo, fusi orari (confine di giornata), reset, aggiornamento contenuto (nuova revisione mantiene lo stato), concorrenza.
- Spiegazione "perché vedo questa card" coerente con il motivo calcolato.

**B. Content & Import**
- Schermata Import: incolla/carica file → anteprima → errori leggibili per campo → conferma → storico. Atomico.
- Duplicati e aggiornamenti secondo `docs/IMPORT_FORMAT.md`; ripassi non persi dopo aggiornamento (test).
- File > 2 MB e contenuti malevoli rifiutati (test).
- Libreria iniziale ampliata a 60–100 contenuti di qualità sui temi prioritari, con fonti verificate (`verifiedOn` solo se consultate) e obiettivi solo dal blueprint.
- `CONTENT_GENERATION_PROMPT.md` per ChatGPT/Claude con esempi validi che superano la validazione.

**C. Database, Auth & PWA**
- Seed SQL generato da `content/`; adapter Supabase di `ProgressStore` con fallback locale; migrazione dei dati locali al primo accesso.
- Supabase Auth con registrazione chiusa; sessione via `proxy.ts`; test RLS aggiornati.
- Service worker: fallback offline, cache degli asset statici e dei contenuti già visti, nessuna cache di risposte autenticate; aggiornamento controllato.
- Richiede da Lorenzo: creazione progetto Supabase (gratuito) e collegamento Vercel. Da chiedere in un unico messaggio.

**D. QA & Review**
- Playwright sui 15 flussi del brief (quelli verificabili), screenshot mobile/desktop chiaro/scuro.
- Revisione indipendente di sicurezza, accessibilità, contenuti; problemi classificati per gravità; `docs/TEST_REPORT.md` con solo test realmente eseguiti.
