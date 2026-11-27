/**
 * Prompt per generare pacchetti importabili con un assistente AI esterno (ChatGPT, Claude…).
 * NetFlow non chiama nessuna AI: l'utente copia il prompt, incolla il risultato nella schermata Import
 * e la validazione decide. Il testo fisso è anche in docs/CONTENT_GENERATION_PROMPT.md (un test li tiene allineati).
 */
import type { BlueprintObjective, TopicNode } from "@/domain/catalog";
import { CONTENT_KINDS } from "@/domain/content";

export const PROMPT_TEMPLATE = `Sei un docente di networking. Trasforma il materiale che ti fornisco in un pacchetto di contenuti per NetFlow, un'app personale di studio per la certificazione Cisco CCNA 200-301 v2.0.

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
- "kind": uno tra ${CONTENT_KINDS.join(", ")}
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

Prima di rispondere controlla: JSON valido, nessun campo extra nel pacchetto, id unici, topicId e objectives presi dalle liste, nessun URL inventato.`;

export function buildContentPrompt(topics: readonly TopicNode[], objectives: readonly BlueprintObjective[], diagramIds: readonly string[]): string {
  const topicLines = topics.map((t) => `- ${t.id} — ${t.title}`).join("\n");
  const objectiveLines = objectives.map((o) => `- ${o.id} — ${o.title}`).join("\n");
  return `${PROMPT_TEMPLATE}

ARGOMENTI (topicId)
${topicLines}

OBIETTIVI DEL BLUEPRINT (objectives)
${objectiveLines}

DIAGRAMMI DISPONIBILI (diagrams[].id)
${diagramIds.map((d) => `- ${d}`).join("\n")}

MATERIALE DA ELABORARE
[incolla qui i tuoi appunti, la trascrizione o la descrizione della lezione]`;
}

/** Pacchetto di esempio minimo e valido, scaricabile dalla schermata Import. */
export const EXAMPLE_PACKAGE = {
  format: "netflow.content-package",
  schemaVersion: 1,
  package: {
    id: "esempio-appunti-personali",
    title: "Esempio — appunti personali",
    language: "it",
    generator: "Scritto a mano",
    createdAt: "2026-11-27",
  },
  items: [
    {
      id: "mio-native-vlan-mismatch",
      revision: 1,
      kind: "recall",
      language: "it",
      title: "Native VLAN diversa ai due lati di un trunk",
      summary: "Cosa succede al traffico non taggato quando i due switch di un trunk 802.1Q hanno Native VLAN diverse.",
      body: "",
      trackId: "ccna",
      topicId: "vlan-trunking",
      difficulty: 2,
      readingMinutes: 2,
      objectives: ["ccna-v2:2.1.b"],
      prerequisites: ["vlans"],
      sources: [{ title: "Appunti personali sul corso CCNA", publisher: "Studio personale", type: "course" }],
      provenance: "original",
      tags: ["trunk", "native-vlan"],
      recall: [
        {
          key: "effetto",
          prompt: "SW1 ha Native VLAN 1 e SW2 Native VLAN 99 sullo stesso trunk. Dove finiscono i frame non taggati inviati da SW1?",
          answer: "SW1 invia senza tag i frame della VLAN 1. SW2 riceve un frame senza tag e lo assegna alla propria Native VLAN, la 99. Il traffico passa quindi dalla VLAN 1 alla VLAN 99: le due VLAN vengono unite in modo involontario. Cisco segnala il problema con un messaggio CDP di native VLAN mismatch.",
          keyPoints: ["I frame della Native VLAN viaggiano senza tag", "Chi riceve li assegna alla propria Native VLAN", "Le due VLAN si fondono"],
          commonMistakes: ["Pensare che il trunk vada giù: di solito resta attivo"],
        },
      ],
      createdAt: "2026-11-27",
      updatedAt: "2026-11-27",
    },
  ],
} as const;
