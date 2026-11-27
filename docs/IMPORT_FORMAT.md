# Formato di importazione — `netflow.content-package` v1

Schema di riferimento (fonte di verità): `src/domain/import-schema.ts` e `src/domain/content.ts`. Il seed in `content/ccna/items/` è un esempio completo e valido.

> Stato: schema, validazione e **schermata di import** (`/import`, raggiungibile da Impostazioni) sono implementati e testati (`tests/import.test.ts`). Logica in `src/data/import-plan.ts`, archiviazione locale in `src/data/import-store.ts`. Per generare pacchetti con un assistente AI esterno: [`CONTENT_GENERATION_PROMPT.md`](./CONTENT_GENERATION_PROMPT.md).

## Struttura

```json
{
  "format": "netflow.content-package",
  "schemaVersion": 1,
  "package": {
    "id": "appunti-vlan-2026-12",
    "title": "Appunti VLAN — lezione 16",
    "language": "it",
    "generator": "ChatGPT — Translation & Study Notes",
    "createdAt": "2026-12-01",
    "notes": "facoltativo"
  },
  "items": [ /* 1..300 contenuti */ ]
}
```

Campi non previsti a livello di pacchetto vengono rifiutati.

## Contenuto (`items[]`)

| Campo | Tipo | Obbl. | Note |
|---|---|---|---|
| `id` | slug | sì | `^[a-z0-9][a-z0-9-]{1,78}[a-z0-9]$`. **Stabile**: lo stesso id aggiorna il contenuto |
| `revision` | intero ≥ 1 | sì | incrementare a ogni modifica sostanziale |
| `kind` | enum | sì | `lesson` `deep_dive` `flashcard` `recall` `command` `config` `output_analysis` `troubleshooting` `comparison` `trivia` `enterprise` `common_mistake` |
| `language` | `it` \| `en` | sì | |
| `title` | 3–140 car. | sì | |
| `summary` | 10–400 car. | sì | anteprima nel feed |
| `body` | Markdown ≤ 20.000 car. | no | GFM: titoli `###`, elenchi, tabelle, codice. **HTML ignorato**, immagini non mostrate |
| `trackId` | slug | sì | oggi `ccna` |
| `topicId` | slug | sì | deve esistere in `content/ccna/track.json` |
| `subtopic` | ≤ 80 car. | no | |
| `difficulty` | 1 \| 2 \| 3 | sì | base, intermedio, avanzato |
| `prerequisites` | slug[] ≤ 10 | no | id di argomenti |
| `readingMinutes` | 1–30 | sì | |
| `objectives` | id[] ≤ 10 | no | formato `ccna-v2:1.3`, `ccna-v2:1.5.a`. Solo id presenti in `blueprint.json` |
| `sources` | 1–10 | sì | `{ title, publisher, type, url?, verifiedOn? }`. `url` solo https. `verifiedOn` (YYYY-MM-DD) **solo se la fonte è stata davvero consultata** |
| `provenance` | enum | sì | `official` `original` `professional` `hypothetical` |
| `reviewStatus` | enum | no | `proposed` (default) o `approved` (formulazione approvata dallo studente) |
| `tags` | ≤ 12 | no | `^[a-z0-9-]{2,40}$` |
| `diagrams` | ≤ 4 | no | `{ id, caption? }`, id dal registro: `mac-learning` `osi-tcpip-stack` `ethernet-frame` `arp-exchange` `tcp-handshake` `dhcp-dora` `dot1q-frame` `ipv6-gua-structure` `slaac-exchange` `pat-translation` `ospf-adjacency` |
| `recall` | ≤ 8 | no* | `{ key, prompt, answer, keyPoints[], commonMistakes[] }`. *Obbligatorio per `recall` e `flashcard`. `key` stabile |
| `related` | slug[] ≤ 10 | no | id di altri contenuti |
| `createdAt`, `updatedAt` | YYYY-MM-DD | sì | `updatedAt ≥ createdAt` |

## Regole di aggiornamento (comportamento previsto per l'importer)

- **Id nuovo** → creato.
- **Id esistente, `revision` maggiore** → aggiornato. Stati di ripasso e storico restano legati a `(id, recall.key)`: non si perdono.
- **Id esistente, stessa `revision`** → ignorato (segnalato come duplicato).
- **Id di un contenuto di sistema** → rifiutato (gli id di sistema sono riservati).
- **Recall key rimossa** → la carta non compare più, lo storico resta.
- Import **atomico**: se un solo contenuto non è valido, il pacchetto viene rifiutato con l'elenco degli errori.

## Limiti di sicurezza

File ≤ 2 MB, ≤ 300 contenuti per pacchetto, testo con lunghezze massime, nessun HTML/JS/SVG eseguibile, URL solo https, diagrammi solo da registro chiuso.

## Come funziona la schermata di import

1. **Sorgente**: file `.json` (controllo della dimensione prima della lettura) oppure testo incollato.
2. **Validazione in fasi**, che si ferma alla prima fallita: dimensione → sintassi JSON (con riga e colonna) → schema (messaggi in italiano per campo, raggruppati per contenuto) → sicurezza → riferimenti al catalogo.
   - *Sicurezza*: rifiutati i pacchetti che contengono tag HTML attivi (`<script>`, `<iframe>`, `<svg>`…), gestori di eventi (`onclick=`) o URL `javascript:`/`vbscript:`/`data:` in qualsiasi campo di testo. Il renderer li neutralizzerebbe comunque: il rifiuto segnala un file manipolato o generato male.
   - *Riferimenti*: `topicId`, `prerequisites`, `objectives` e `diagrams` devono esistere (errore). Un `related` sconosciuto è solo un avviso.
3. **Anteprima**: per ogni contenuto l'azione prevista (nuovo, aggiornato, già presente, versione più vecchia, id riservato), le domande di recall rimosse da un aggiornamento e il caso "stesso `revision` ma testo diverso".
4. **Conferma**: la libreria importata viene ricalcolata per intero e scritta con un'unica operazione. Se nel frattempo un'altra scheda ha modificato la libreria, l'import viene rifiutato e va rianalizzato.
5. **Storico**: ultimi 50 import, con possibilità di rimuovere i contenuti di un pacchetto (lo storico dei ripassi resta) ed esportare tutti i contenuti importati come pacchetto reimportabile.

In modalità locale i contenuti importati sono salvati nel browser (`localStorage`, chiave `netflow:v1:imported`) e rivalidati a ogni lettura. Con Supabase andranno nella tabella dei contenuti dell'utente (flusso Database).
