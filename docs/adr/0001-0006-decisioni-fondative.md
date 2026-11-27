# ADR 0001–0006 — Decisioni fondative

Data: 2026-11-27 · Stato: accettate

Gli ADR sono raccolti in un unico file per brevità. Le decisioni successive vanno in file separati (`0007-*.md`, …).

## 0001 — Stack e modalità locale prima

**Contesto.** Serve un MVP stabile, gratuito, senza dipendenze AI, mantenibile da una persona sola.
**Decisione.** Next.js 16.4 (App Router, Cache Components), TypeScript strict, Tailwind CSS 4, zod 4, Supabase (Postgres + Auth + RLS), Vercel. L'app funziona prima **in modalità locale** (localStorage) e poi con Supabase tramite la stessa interfaccia `ProgressStore`.
**Alternative scartate.** SPA Vite (perde rendering server dei contenuti e routing integrato); IndexedDB/Dexie da subito (complessità non necessaria per ~MB di dati); backend dedicato (inutile).
**Conseguenze.** Si può usare l'app subito e senza costi; il passaggio a Supabase non tocca engine e UI.

## 0002 — Contratti condivisi e seed nel formato di import

**Decisione.** Tutti i tipi nascono da schemi zod in `src/domain/`. Il seed in `content/` usa esattamente il formato `netflow.content-package` v1: ogni test sul seed è anche un test dell'import.
**Conseguenze.** Una modifica di schema rompe subito i test se il seed non è conforme. Nessuna duplicazione dei tipi.

## 0003 — Modello dati

**Decisione.**
- Catalogo (track/moduli/argomenti/obiettivi) = dato di sistema, sola lettura per gli utenti.
- `content_items.owner_id` nullo = contenuto di sistema; valorizzato = contenuto importato dall'utente, visibile solo a lui. Slug unico per proprietario (`UNIQUE NULLS NOT DISTINCT`).
- Ogni domanda di recall ha chiave stabile `(content, key)`: aggiornare un contenuto (nuova `revision`) **non perde** stati di ripasso né storico. Il reset è un'azione esplicita.
- Preferiti, nascosti e segnali di lettura sono colonne di `user_content_progress` (niente tabelle `bookmarks`/`feed_interactions` separate: sarebbero duplicazioni).
- `review_events` append-only con id generato dal client (idempotenza).

## 0004 — Spaced repetition: FSRS

**Decisione.** FSRS tramite `ts-fsrs` **5.4.2** (fissata: la 6.x richiede Node 24). Parametri: retention 0,9, intervallo massimo 365 giorni, fuzz disattivato (riproducibilità), learning steps brevi attivi.
**Mapping.** Da ristudiare → Again · Difficile → Hard · Compreso → Good · Padroneggiato → Easy.
**Regole.**
- Solo una valutazione esplicita di una domanda di recall è una revisione. Leggere o aprire un contenuto aggiorna solo `user_content_progress`.
- "Consolidata" = stato Review, stabilità ≥ 21 giorni, almeno 3 ripetizioni. Una risposta corretta non basta mai.
- Revisioni anticipate e in ritardo: FSRS usa il tempo reale trascorso. Un orologio che torna indietro viene normalizzato all'ultima revisione.
- Fusi orari: tutto in UTC; il fuso dell'utente serve solo per i confini di giornata (`localDayKey`).
- Concorrenza: `version` sullo stato + `expectedVersion` nella mutazione; conflitto ⇒ nessuna scrittura e messaggio all'utente.

## 0005 — Feed deterministico

**Decisione.** Tre bucket con pesi indicativi 50/30/15 (le news, 5%, arriveranno come bucket separato e opzionale):
1. **review**: carte di recall scadute (ordinate per ritardo relativo), poi contenuti segnati "Difficile" o di argomenti "Da consolidare" non visti nelle ultime 24 h;
2. **studying**: contenuti degli argomenti "In studio" (prima i non visti), poi nuove carte di recall per contenuti già letti in argomenti attivi;
3. **new**: argomenti "di frontiera" (non iniziati, prerequisiti già attivi). In cold start = argomenti senza prerequisiti.
Fallback **explore**: tutto il resto non visto nelle ultime 12 h.
Interleaving con *smooth weighted round-robin*; vincoli: niente stesso argomento due volte di fila, niente stesso tipo tre volte di fila, ogni contenuto al massimo una volta. Pareggi risolti con un hash stabile di (giorno, id): varietà quotidiana senza casualità.
**Anti-manipolazione.** Il feed è finito (30 elementi), termina con un messaggio esplicito e un pulsante di aggiornamento. Niente streak, niente obiettivi giornalieri.

## 0006 — Diagrammi

**Decisione.** Registro chiuso di componenti React/SVG (`src/components/diagrams/registry.tsx`) con componenti generici riutilizzabili: diagramma di sequenza, struttura di campi, stack di livelli, visualizzazione interattiva MAC learning. I contenuti citano solo l'id.
**Alternative scartate.** Mermaid (bundle pesante, stile poco controllabile, parsing di input esterno); SVG importati (rischio XSS).
**Conseguenze.** Nuovi diagrammi richiedono codice, ma restano accessibili, coerenti con il tema e sicuri.
