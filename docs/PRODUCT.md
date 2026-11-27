# NetFlow — analisi di prodotto e identità

Analisi mirata: cosa prendiamo dai riferimenti, cosa evitiamo, che cosa rende NetFlow diverso. Valutazione basata su conoscenza dei prodotti, non su test approfonditi di ciascuno.

## Pattern efficaci da adottare

| Riferimento | Pattern utile | Come lo usa NetFlow |
|---|---|---|
| Anki | Spaced repetition seria, autovalutazione a 4 livelli, algoritmo FSRS | Stesso algoritmo (FSRS) e 4 valutazioni con etichette in italiano e anteprima dell'intervallo |
| RemNote | Le flashcard nascono dalle note, non sono un mondo separato | Le domande di recall vivono dentro i contenuti; entrano in ripasso solo dopo che hai letto il contenuto |
| Readwise Reader | Resurfacing di ciò che hai letto, distinto dalla lettura nuova | Bucket "consolidamento" separato da "nuovo"; contenuti salvati |
| Brilliant | Spiegazione visuale e interattiva prima della formula | Diagrammi integrati nelle card; visualizzazioni passo-passo (es. MAC learning) |
| Mimo | Sessioni brevi, un'azione alla volta, mobile-first | Card leggibili in 1–3 minuti, azioni a una mano, ripasso una carta alla volta |
| daily.dev / Feedly | Feed tecnico con fonti chiare e controllo delle sorgenti | Ogni contenuto mostra fonti, natura (ufficiale/originale/ipotetico) e data |

## Pattern da evitare

- Streak, obiettivi giornalieri, badge e notifiche di colpa (Duolingo-style): spingono al tempo-in-app, non all'apprendimento.
- Scorrimento infinito e ordinamento opaco per "engagement".
- Quiz a risposta multipla come formato principale: misurano il riconoscimento, non il recupero.
- Statistiche di vanità (contenuti letti presentati come "preparazione all'esame").

## Identità di NetFlow

**Concetto: "il quaderno dell'ingegnere di rete".** Sobrio, tecnico, preciso. Ogni card ha una intestazione in monospace che richiama i campi di un header di protocollo (`MICROLEZIONE · ARP · 4 MIN`). Il logo sono tre nodi collegati da un percorso: un hop dopo l'altro.

Principi di esperienza:
1. **Apri e impari**: il feed è pronto senza scegliere nulla.
2. **Lettura ≠ studio**: leggere è libero; lo studio attivo (recall + valutazione) è esplicito e pianifica i ripassi.
3. **Finito per design**: 30 elementi, poi fine. Torni quando vuoi.
4. **Onestà dei dati**: progressi reali, fonti dichiarate, bozze segnalate come tali.
5. **Il corso esterno guida**: l'utente indica cosa sta studiando con Jeremy's IT Lab; NetFlow consolida, non sostituisce.

## Ambito MVP (P0)

Feed personalizzato · approfondimenti con diagrammi · active recall con autovalutazione · ripasso FSRS · libreria con stato degli argomenti e ricerca · progressi reali · import JSON · export/backup · tema chiaro/scuro · PWA installabile · autenticazione e RLS quando Supabase sarà collegato.
