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
| Autenticazione | Supabase Auth con email e password, registrazione da disattivare nel pannello (vedi `docs/DEPLOYMENT_GUIDE.md`). `proxy.ts` verifica il token con `getClaims()` e reindirizza a `/login`; il ritorno dopo il login accetta solo percorsi interni (`safeNextPath`, test anti open-redirect) |
| Funzioni SQL | `security definer` con `search_path` vuoto, utente ricavato solo da `auth.uid()`, scrivono solo righe dell'utente su contenuti visibili — **testato su PGlite** |
| Service worker | Intercetta solo GET dello stesso dominio. Supabase (altro dominio), `/login`, `/auth`, `/api`, richieste RSC e con header `Authorization` non passano mai dalla cache. Salva solo risposte `200` non reindirizzate e senza `no-store`/`private`. Le pagine sono statiche e senza dati personali. Al logout la cache delle pagine viene svuotata |
| Tracking | Nessun servizio di analytics o tracking. Font self-hosted (nessuna richiesta a Google) |

## Aperto

- **CSP**: da introdurre con nonce o hash (lo script del tema è inline e statico). Previsto nel flusso QA & Security.
- **Autenticazione su progetto reale**: codice pronto e testato in locale; va verificato su un progetto Supabase reale (registrazione disattivata, utente creato a mano).
- **Rate limiting** sugli endpoint di import, quando esisteranno.
- **News (P2)**: fetch solo da allowlist statica di feed RSS, timeout, nessun URL fornito dall'utente (protezione SSRF).

## Segnalare un problema

Progetto personale: aprire una issue privata nel repository.
