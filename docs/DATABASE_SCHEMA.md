# Schema del database (Supabase / PostgreSQL)

Migration: `supabase/migrations/20261127000001_init.sql`. Testata in locale con PGlite (`tests/db-rls.test.ts`). **Non ancora applicata a un progetto Supabase reale.**

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

## Da fare (flusso Database & Auth)

- Seed SQL del catalogo e dei contenuti di sistema generato da `content/` (script, non a mano).
- Adapter Supabase di `ProgressStore` e mapping `cardId` (`slug#key`) ⇄ `recall_prompts.id`.
- Import lato server in transazione (funzione SQL o route handler con validazione zod).
- Export completo dei dati personali dal database.
