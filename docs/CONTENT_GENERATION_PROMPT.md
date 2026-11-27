# Prompt per generare contenuti importabili

NetFlow non usa servizi AI. Per trasformare appunti, trascrizioni o lezioni in contenuti dell'app puoi usare un assistente esterno (ChatGPT, Claude o altro) con il prompt qui sotto, poi incollare il risultato in **Impostazioni → Importa contenuti** (`/import`).

## Come si usa

1. Nella schermata Import premi **Copia il prompt**. La versione copiata dall'app è sempre aggiornata: oltre al testo qui sotto contiene l'elenco degli argomenti (`topicId`), degli obiettivi ufficiali del blueprint CCNA v2.0 e dei diagrammi disponibili.
2. Incolla il prompt nella conversazione (ad esempio "Translation & Study Notes") e aggiungi in fondo il materiale da elaborare.
3. Copia il JSON della risposta e incollalo nella schermata Import, oppure salvalo come file `.json` e caricalo.
4. Controlla l'anteprima: contenuti nuovi, aggiornati, già presenti. Se qualcosa non è valido l'app mostra l'errore campo per campo e non importa nulla.
5. Dopo aver verificato una fonte, puoi aggiungere `verifiedOn` (data di consultazione) e reimportare con `revision` incrementata.

## Consigli

- **Pacchetti piccoli**: 5–20 contenuti per volta. Gli errori si correggono più in fretta e l'anteprima resta leggibile.
- **Id con prefisso personale** (es. `jit-`, `mio-`): gli id dei contenuti di sistema sono riservati e un pacchetto che li usa viene bloccato.
- **Aggiornare** un contenuto: stesso `id`, `revision` più alta. I ripassi già fatti restano, perché sono legati a `id` + `recall.key`. Non cambiare le `key` delle domande se non vuoi ripartire da zero con quella carta.
- **Rivedi sempre** il risultato prima di importarlo: i contenuti importati sono `reviewStatus: "proposed"` finché non li approvi.

Formato completo: [`IMPORT_FORMAT.md`](./IMPORT_FORMAT.md). Esempio valido: pulsante **Scarica un esempio** nella schermata Import (lo stesso oggetto `EXAMPLE_PACKAGE` di `src/data/import-prompt.ts`, verificato dai test).

## Testo del prompt

Il blocco seguente è identico a `PROMPT_TEMPLATE` in `src/data/import-prompt.ts` (un test li confronta).

```text
Sei un docente di networking. Trasforma il materiale che ti fornisco in un pacchetto di contenuti per NetFlow, un'app personale di studio per la certificazione Cisco CCNA 200-301 v2.0.

REGOLE DI CONTENUTO
- Elabora solo il materiale che ti fornisco. Non aggiungere informazioni esterne non richieste.
- Italiano naturale e tecnicamente preciso. Mantieni in inglese nomi di protocolli, acronimi e termini d'uso comune (switch, frame, flooding, Routing Table, Default Gateway, Trunk Port, Native VLAN...).
- Preserva comandi, output CLI, indirizzi, nomi di interfacce e valori numerici esattamente come nella fonte. Usa blocchi di codice per comandi e output.
- Niente domande d'esame copiate o "dump", niente testo protetto copiato per intero: spiega con parole tue.
- Non inventare fonti, URL o date. Indica come fonte il materiale realmente usato (es. il corso). Ometti "url" se non è certo. Non inserire "verifiedOn": lo aggiunge lo studente quando ha controllato la fonte.
- Ogni domanda di recall deve chiedere di spiegare o ragionare, non di riconoscere una parola. La risposta deve essere completa; keyPoints e commonMistakes brevi.
- Niente HTML, niente immagini, niente link javascript: o data:.

FORMATO
Rispondi SOLO con un blocco JSON valido, senza testo prima o dopo, con questa struttura:

{
  "format": "netflow.content-package",
  "schemaVersion": 1,
  "package": { "id": "slug-univoco-del-pacchetto", "title": "Titolo del pacchetto", "language": "it", "generator": "ChatGPT — Translation & Study Notes", "createdAt": "AAAA-MM-GG" },
  "items": [ ... da 1 a 20 contenuti ... ]
}

Ogni contenuto in "items" ha questi campi:
- "id": slug stabile, minuscole/cifre/trattini, 3-80 caratteri, con un prefisso personale (es. "jit-vlan-access-port"). Lo stesso id in futuro aggiorna il contenuto.
- "revision": 1 (incrementa solo quando modifichi un contenuto già importato)
- "kind": uno tra lesson, deep_dive, flashcard, recall, command, config, output_analysis, troubleshooting, comparison, trivia, enterprise, common_mistake
- "language": "it" oppure "en"
- "title" (3-140 caratteri), "summary" (10-400 caratteri, è l'anteprima nel feed)
- "body": Markdown (titoli ###, elenchi, tabelle, blocchi di codice), massimo 20.000 caratteri
- "trackId": "ccna"
- "topicId": uno degli id di argomento elencati sotto
- "difficulty": 1 (base), 2 (intermedio) o 3 (avanzato)
- "readingMinutes": da 1 a 30
- "objectives": elenco (anche vuoto) di id obiettivo presi SOLO dalla lista sotto
- "prerequisites": elenco (anche vuoto) di id di argomento
- "sources": da 1 a 10 elementi { "title", "publisher", "type" } dove type è uno tra official, rfc, vendor_docs, standard, course, other
- "provenance": "original" per spiegazioni tue, "official" per definizioni da standard, "professional" per pratica aziendale, "hypothetical" per esempi inventati
- "tags": fino a 12 parole in minuscolo con trattini
- "recall": fino a 8 domande { "key": "slug-breve", "prompt", "answer", "keyPoints": [], "commonMistakes": [] }. Obbligatorio per i tipi "recall" e "flashcard".
- "diagrams": facoltativo, solo id dalla lista sotto
- "related": facoltativo, id di altri contenuti
- "createdAt" e "updatedAt": "AAAA-MM-GG"

Prima di rispondere controlla: JSON valido, nessun campo extra nel pacchetto, id unici, topicId e objectives presi dalle liste, nessun URL inventato.
```
