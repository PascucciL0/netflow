# PROJECT_STATUS — NetFlow

Ultimo aggiornamento: 2026-11-27 · Branch: `main` · Repository: github.com/PascucciL0/netflow (privato)

## Stato in una riga

Fondamenta complete e prima vertical slice funzionante **in modalità locale**: feed personalizzato, approfondimenti con diagrammi, active recall con ripasso FSRS, libreria con stato degli argomenti, progressi reali, tema chiaro/scuro, export JSON. Supabase, import da interfaccia, service worker e la maggior parte dei contenuti sono ancora da fare.

## Completato e verificato

| Funzionalità | Verifica eseguita |
|---|---|
| Contratti zod condivisi (contenuti, catalogo, progressi, mutazioni, import v1) | typecheck, test schema |
| Catalogo CCNA: 7 moduli, 17 argomenti con prerequisiti; 59 obiettivi (incluse le sotto-voci a, b, c…) ufficiali estratti dal PDF | test integrità grafo e riferimenti |
| 14 contenuti originali con 19 domande di recall, fonti RFC consultate il 2026-11-27 | test schema e riferimenti; verifica fonti via web (RFC 768, 791, 792, 826, 1035, 1918, 2131, 3596, 4291, 9293) |
| Learning Engine: feed deterministico (bucket + interleaving + varietà), FSRS, reducer idempotente | 26 unit test (+ 9 test su contenuti e schema di import) |
| Migration PostgreSQL con RLS e `record_review` atomica | 7 test su PostgreSQL in memoria (PGlite): isolamento utenti, IDOR, anon, idempotenza, versione |
| UI: feed, approfondimento, ripasso, libreria (ricerca, salvati, stato argomenti), progressi, impostazioni | Playwright: iPhone 13 chiaro/scuro e desktop 1440px, nessun errore console, nessun overflow orizzontale, persistenza dopo ricarica |
| Build di produzione Next 16 | `npm run build` verde |
| Dipendenze | `npm audit --omit=dev`: 0 vulnerabilità |

Screenshot: `docs/screenshots/`.

## Parziale

- **PWA**: manifest e icone presenti; service worker e fallback offline **non implementati**; installabilità non verificata su dispositivo reale.
- **Esportazione**: backup JSON dei dati personali sì; ripristino da backup no.
- **Sicurezza**: header di base sì; CSP no.
- **Contenuti**: 14 su un obiettivo di 60–100. Fonti IEEE e Cisco citate ma non consultate (segnate "da verificare" nell'interfaccia). Tutti i contenuti sono `reviewStatus: proposed`.

## Non ancora implementato

Importazione da interfaccia · adapter Supabase e autenticazione · seed SQL · prompt di generazione contenuti · news (P2) · test end-to-end automatizzati in CI · DEPLOYMENT_GUIDE.

## Configurazioni mancanti (servono a Lorenzo, da chiedere insieme)

- Progetto Supabase gratuito dedicato a NetFlow (URL + publishable key), con registrazione disattivata.
- Collegamento del repository a Vercel (piano Hobby) per un deploy privato di prova.

## Prossime attività (vedi `docs/WORKSTREAMS.md`)

1. **Content & Import**: schermata di import, prompt per ChatGPT/Claude, ampliamento libreria con fonti verificate.
2. **Learning Engine**: test aggiuntivi (fusi orari, aggiornamento contenuti), bucket news opzionale, "perché vedo questa card".
3. **Database, Auth & PWA**: seed SQL, adapter Supabase, Auth chiusa, service worker.
4. **QA & Review**: Playwright E2E, revisione indipendente, `TEST_REPORT.md`.

## Decisioni chiave

ADR in `docs/adr/0001-0006-decisioni-fondative.md`. Note operative: `ts-fsrs` fissato a 5.4.2 (la 6.x richiede Node 24); Next 16 con Cache Components; font self-hosted.

## Commit

- `db5e276` contratti, catalogo, engine, seed
- `3493930` vertical slice, design system, migration RLS, test
- (questo commit) documentazione e PROJECT_STATUS
