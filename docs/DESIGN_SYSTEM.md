# Design system

Implementato in `src/app/globals.css` (token CSS + `@theme` Tailwind 4). Usare sempre i token, mai colori esadecimali nei componenti.

## Colori (token semantici)

| Token Tailwind | Uso | Chiaro | Scuro |
|---|---|---|---|
| `bg-bg` | sfondo pagina | #f6f7f9 | #07090d |
| `bg-surface` | card | #ffffff | #0e1218 |
| `bg-surface-2/3` | superfici secondarie, hover, skeleton | #f0f2f5 / #e6e9ee | #141a23 / #1c2430 |
| `border-line` / `line-strong` | bordi | #e1e5eb / #c9d0da | #1f2733 / #2d3847 |
| `text-ink` / `ink-2` / `ink-3` | testo primario / secondario / metadati | #0d1320 / #465264 / #667185 | #e8ecf3 / #a7b1c1 / #7d899b |
| `bg-accent`, `text-accent-text`, `bg-accent-soft` | azione primaria, link, selezione | #1f5fd6 | #4c8dff |
| `again` `hard` `good` `easy` | valutazioni di ripasso | rosso, ambra, blu, verde | versioni più chiare |

Regole: un solo accento (blu elettrico). Niente gradienti, niente neon, ombre solo in tema chiaro e molto leggere. Le valutazioni hanno sempre anche un'etichetta testuale (mai solo colore).

## Tipografia

- **IBM Plex Sans** (variabile, self-hosted via `@fontsource`): testo e titoli. Nessuna richiesta a Google Fonts.
- **IBM Plex Mono**: codice, CLI, metadati, numeri delle statistiche.
- Scala: titolo pagina 24–30px semibold, titolo card 17–18px semibold, corpo 15–16.5px (line-height 1.7 nei contenuti), metadati 11px mono maiuscolo (`.meta-strip`).

## Forme e spaziature

- Raggi: card 14px (`--radius-card`), controlli 10px (`--radius-control`), chip `rounded-full`.
- Spaziatura base 4px; card `p-4`/`sm:p-5`; tra card `space-y-4`.
- Touch target minimo 44px (`h-11`, `size-11`).

## Componenti

- **Card contenuto** (`ContentCard`): meta-strip → titolo → riassunto → diagramma (se presente) → [Approfondisci] [Salva] [⋯]. Le azioni secondarie (Difficile, Compreso, Nascondi) si aprono in linea.
- **Card recall** (`RecallCard`): domanda → risposta facoltativa scritta → "Mostra risposta" → risposta di riferimento, concetti chiave, errori comuni → 4 valutazioni con anteprima intervallo.
- **Meta-strip**: `TIPO · ARGOMENTO · MINUTI · [DIFFICOLTÀ] · [MOTIVO]`.
- **Diagrammi**: dentro un contenitore `surface` con bordo; SVG con colori da token, quindi corretti in entrambi i temi.

## Stati

- Caricamento: skeleton con `animate-pulse` (disattivato con reduced motion).
- Vuoto: testo che spiega cosa succede e quale azione è utile.
- Errore: testo `text-again` con `role="alert"`.
- Feedback: messaggi `role="status"` dopo una valutazione.

## Layout responsive

- < 1024px: top bar con logo e impostazioni, bottom nav a 4 voci con safe area iOS.
- ≥ 1024px: sidebar sinistra 240px, colonna di lettura centrale max 680px.
- Nessun overflow orizzontale: tabelle e blocchi di codice scorrono al loro interno.

## Accessibilità

Link "Vai al contenuto", `aria-current` sulla navigazione, focus visibile (outline accento), `aria-pressed`/`aria-expanded` sui toggle, landmark semantici, `prefers-reduced-motion` rispettato, contrasto del testo secondario ≥ 4,5:1 sulle superfici principali.
