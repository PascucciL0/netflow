# Schema del database (Supabase / PostgreSQL)

Migration: `supabase/migrations/20261127000001_init.sql` (schema, RLS, `record_review`) e `20261127000002_sync.sql` (`reset_review_state`, `import_progress`). Seed: `supabase/seed.sql`, generato da `content/`. Testate in locale con PGlite (`tests/db-rls.test.ts`, `tests/db-sync.test.ts`). **Non ancora applicate a un progetto Supabase reale.**

## Tabelle

**Catalogo (sola lettura per gli utenti)**
- `learning_tracks`, `modules`, `topics`, `topic_prerequisites`
- `blueprint_objectives` (testo ufficiale), `topic_objectives`

**Contenuti**
- `content_items` — `owner_id` null = sistema, altrimenti importato dall'utente. `unique nulls not distinct (owner_id, slug)`.
- `content_objectives`, `content_prerequisites`, `content_sources`, `content_relations`
- `recall_prompts` — `unique (content_id, key)`: chiave stabile tra le revisioni.

**Import**
- `import_batches` — storico con conteggi ed errori. Le righe non si modificano.

**Dati personali**
- `profiles`, `user_preferences`
- `user_topic_progress` — stato dichiarato dell'argomento
- `user_content_progress` — visto/aperto/salvato/nascosto/segnale (sostituisce bookmarks e feed_interactions)
- `review_states` — stato FSRS per (utente, recall) con `version` per la concorrenza
- `review_events` — storico append-only, id generato dal client

## Policy RLS (riassunto)

| Tabella | select | insert/update/delete |
|---|---|---|
| catalogo | authenticated | nessuno (solo migration) |
| `content_items` | sistema + propri | solo propri |
| figlie dei contenuti | se il padre è leggibile | se il padre è proprio |
| `import_batches` | propri | insert propri |
| `user_*`, `profiles` | propri | propri |
| `review_states` | propri | solo `delete` (reset); scrittura via `record_review` |
| `review_events` | propri | solo via `record_review` |

`anon` non ha alcun privilegio. **Ogni migration futura che crea tabelle deve abilitare RLS e revocare i privilegi ad `anon`.**

## `record_review(...)`

Funzione `security definer` con `search_path` vuoto. In un'unica transazione: verifica autenticazione e visibilità della domanda, rifiuta date future, restituisce `duplicate_event` se l'id esiste, `stale_version` se la versione non coincide, altrimenti inserisce l'evento e aggiorna lo stato (`version + 1`).

## `reset_review_state(recall, versione attesa, due, revisione)`

Riporta la carta allo stato "nuova" (valori di `createEmptyCard` di ts-fsrs) e incrementa `version`, così client e server restano allineati sul contatore usato da `record_review`. Restituisce `ok`, `stale_version` o `not_found`.

## `import_progress(payload jsonb, replace boolean)`

Importazione in blocco dei progressi dell'utente autenticato, in un'unica transazione:
- `replace = false` (unione): le righe già presenti sul server vincono. Usata per portare nell'account i progressi della modalità locale al primo accesso.
- `replace = true` (sostituzione): cancella tutti i progressi dell'utente (storico compreso) e inserisce il payload. Con payload vuoto è la "Cancella progressi" delle Impostazioni.
- Scarta e conta (`skipped`) le righe su argomenti inesistenti, contenuti non visibili all'utente, eventi con data futura. Limiti di dimensione (es. 100.000 eventi).

## Seed dei contenuti di sistema

`npm run db:seed` rigenera `supabase/seed.sql` da `content/` (stessa validazione zod dell'app). Gli id sono **UUID v5 deterministici** (`content:<slug>`, `recall:<slug>#<key>`): riapplicare il seed dopo aver aggiunto o modificato contenuti non cambia gli id, quindi i ripassi restano collegati. Il seed è idempotente (upsert). Una domanda di recall rimossa dal repository viene cancellata insieme ai relativi ripassi: **le chiavi di recall non vanno mai rinominate**. Un test verifica che il file committato sia aggiornato rispetto a `content/`.

## Sincronizzazione (client)

- `src/data/sync-types.ts`: mappa slug ⇄ uuid caricata all'avvio, conversione righe ⇄ `UserSnapshot`, operazioni di sincronizzazione.
- `src/data/sync-store.ts`: store offline-first. Ogni mutazione passa dal reducer condiviso, poi diventa un'operazione con lo stato completo dell'entità, accodata in una outbox persistita in `localStorage` e inviata in ordine. Senza rete resta in coda e riparte al ritorno online. Conflitto di versione su un ripasso (stessa carta valutata su un altro dispositivo): vince il server, l'operazione locale viene scartata e mostrata nelle Impostazioni.
- `src/data/supabase-remote.ts`: unico punto che usa supabase-js (paginazione a blocchi di 1000 righe).
- Cambio utente sullo stesso dispositivo: la cache dell'utente precedente non viene mai mostrata. Al logout la cache del dispositivo viene cancellata.

## Da fare

- Import di contenuti personali lato server in transazione (flusso Content & Import).
- Export completo dei dati personali direttamente dal database (oggi l'export JSON usa lo snapshot sincronizzato, che contiene già tutti i progressi).
