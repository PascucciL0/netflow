# Sicurezza

## Stato attuale

| Area | Stato |
|---|---|
| Rendering contenuti | Markdown senza HTML grezzo (`skipHtml`), URL filtrati, immagini disattivate, link esterni `noopener noreferrer` |
| Diagrammi | Registro chiuso: nessun SVG/HTML/JS da contenuti esterni |
| Validazione import | zod rigoroso, id con regex, solo https, limiti di lunghezza e numero, test con input malevoli |
| Database | RLS su tutte le tabelle, `anon` senza privilegi, eventi append-only, funzione critica atomica — **testato su PGlite** |
| Segreti | Nessun segreto nel repository. `.env.example` senza valori. La service role key non deve mai avere prefisso `NEXT_PUBLIC_` |
| Header HTTP | `nosniff`, `Referrer-Policy`, `X-Frame-Options: DENY`, `Permissions-Policy`, `COOP` |
| Tracking | Nessun servizio di analytics o tracking. Font self-hosted (nessuna richiesta a Google) |

## Aperto

- **CSP**: da introdurre con nonce o hash (lo script del tema è inline e statico). Previsto nel flusso QA & Security.
- **Autenticazione**: Supabase Auth con registrazione disattivata (accesso solo per l'utente creato a mano). Da configurare quando esisterà il progetto Supabase.
- **Rate limiting** sugli endpoint di import, quando esisteranno.
- **News (P2)**: fetch solo da allowlist statica di feed RSS, timeout, nessun URL fornito dall'utente (protezione SSRF).
- **Service worker**: non deve mettere in cache risposte autenticate.

## Segnalare un problema

Progetto personale: aprire una issue privata nel repository.
