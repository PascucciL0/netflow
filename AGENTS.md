<!-- BEGIN:nextjs-agent-rules -->

## This is NOT the Next.js you know

This version has breaking changes — APIs, conventions, and file structure may all differ from your training data. Read the relevant guide in `node_modules/next/dist/docs/` (resolved from this file's directory; in monorepos the `next` package may not be visible from the repo root) before writing any code. Heed deprecation notices.

This block is written and re-added by `next dev` — verify at `node_modules/next/dist/server/lib/generate-agent-files.js`. Removing it from a diff only re-creates the uncommitted change; committing it with your work keeps the tree clean.

<!-- END:nextjs-agent-rules -->

## Regole del progetto NetFlow

Leggi prima `PROJECT_STATUS.md`, `docs/ARCHITECTURE.md` e `docs/WORKSTREAMS.md` (convenzioni, proprietà dei file, criteri di accettazione).
- Contratti condivisi solo in `src/domain/`; `src/engine/` resta puro e deterministico.
- Ogni modifica ai dati personali passa da `Mutation` + reducer.
- Obiettivi del blueprint solo da `content/ccna/blueprint.json`; `verifiedOn` solo per fonti realmente consultate.
- Prima di consegnare: `npm run check` e `npm run build`. Aggiorna `PROJECT_STATUS.md`.
