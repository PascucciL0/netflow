# ADR 0007 — Contratto separato per le news

Data: 2026-11-27 · Stato: accettata · Priorità: P2

**Contesto.** Il bucket news del feed (peso indicativo 5%) richiede un tipo di dato. Opzioni: aggiungere `news` a `ContentKind` oppure un contratto separato.

**Decisione.** Contratto separato `NewsItem` in `src/domain/news.ts`.

**Motivi.** Le news non hanno recall, revisioni, prerequisiti né obiettivi del blueprint, scadono dopo pochi giorni e non vanno mai nello spaced repetition. Inserirle in `ContentItem` avrebbe reso facoltativi campi oggi obbligatori (fonti verificate, argomento, revisione) e indebolito la validazione dei contenuti didattici.

**Conseguenze.**
- Il feed accetterà un input opzionale `news: NewsItem[]` e produrrà voci `type: "news"` in un bucket dedicato. Lista vuota o errore di rete ⇒ feed didattico invariato.
- Le fonti sono un'allowlist statica nel codice (`NewsSource`), con host consentito per feed e link. Nessun URL arriva da utenti o import (SSRF).
- Recupero lato server con timeout, cache, deduplicazione per `id` (hash di fonte + URL canonico), solo titolo, data, estratto breve e link all'originale.
