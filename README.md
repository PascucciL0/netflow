# NetFlow

Web app personale, mobile-first e installabile, per l'apprendimento continuo di Networking, Network Security e Cybersecurity (CCNA 200-301 v2.0, poi Fortinet NSE 4).

Un feed finito di microlezioni, diagrammi e domande di active recall, con ripasso programmato FSRS. Funziona **senza AI, senza abbonamenti e, per ora, senza server**: i dati restano nel browser e si esportano in JSON.

> Stato: MVP in sviluppo. Vedi [`PROJECT_STATUS.md`](PROJECT_STATUS.md).

## Requisiti

- Node.js 20.9 o superiore (consigliato 22 LTS)
- npm

## Avvio locale

```bash
npm install
npm run dev
```

Apri http://localhost:3000. Senza file `.env.local` l'app parte in **modalità locale**: nessuna configurazione richiesta.

## Comandi

| Comando | Cosa fa |
|---|---|
| `npm run dev` | server di sviluppo |
| `npm run build` / `npm start` | build e avvio di produzione |
| `npm run check` | typecheck + lint + test |
| `npm test` | test (engine, contenuti, schema di import, policy RLS su PostgreSQL in memoria) |

## Struttura

Vedi [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md). In breve: `content/` (catalogo e contenuti in JSON), `src/domain` (contratti), `src/engine` (feed e ripasso, codice puro), `src/data` (persistenza), `src/components` e `src/app` (interfaccia), `supabase/` (database).

## Contenuti

I contenuti sono file JSON nel formato descritto in [`docs/IMPORT_FORMAT.md`](docs/IMPORT_FORMAT.md). Per aggiungerne: crea o modifica un file in `content/ccna/items/`, registralo in `src/data/catalog.ts` ed esegui `npm test` (valida schema, argomenti, obiettivi del blueprint, diagrammi e collegamenti).

## Esportazione

Impostazioni → *Esporta backup JSON*: scarica argomenti, interazioni, stati di ripasso e storico delle valutazioni.

## Database (quando verrà collegato)

Migration in `supabase/migrations/`. Variabili in `.env.example`. Dettagli in [`docs/DATABASE_SCHEMA.md`](docs/DATABASE_SCHEMA.md) e [`SECURITY.md`](SECURITY.md).

## Documentazione

- [Prodotto e identità](docs/PRODUCT.md) · [Architettura](docs/ARCHITECTURE.md) · [Decisioni (ADR)](docs/adr/)
- [Design system](docs/DESIGN_SYSTEM.md) · [Formato di import](docs/IMPORT_FORMAT.md) · [Database](docs/DATABASE_SCHEMA.md)
- [Flussi di lavoro e criteri di accettazione](docs/WORKSTREAMS.md) · [Sicurezza](SECURITY.md) · [Stato del progetto](PROJECT_STATUS.md)

## Limitazioni note

- I progressi sono salvati solo nel browser finché Supabase non è collegato: esporta il backup.
- Service worker / uso offline non ancora implementati (il manifest PWA sì).
- Libreria iniziale di 14 contenuti: verrà ampliata.
