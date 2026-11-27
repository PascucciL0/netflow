# Guida al collegamento: Supabase, Vercel e PWA

Senza variabili d'ambiente NetFlow funziona in **modalità locale** (progressi nel browser). Con le due variabili pubbliche di Supabase passa in **modalità account**: accesso obbligatorio, progressi sincronizzati tra i dispositivi, funzionamento offline.

Tutto resta nei piani gratuiti: Supabase Free (fino a 2 progetti attivi; un progetto senza attività per 7 giorni viene messo in pausa e si riattiva dal pannello) e Vercel Hobby (uso personale non commerciale).

## 1. Progetto Supabase (una volta)

1. Crea un progetto **dedicato** a NetFlow (non riusare database di altri progetti), regione UE (es. Frankfurt o Ireland). Piano Free.
2. **Authentication → Sign In / Providers → Email**: lascia attivo Email, **disattiva "Allow new users to sign up"**. Disattivare "Confirm email" non è necessario: l'utente si crea già confermato.
3. **Authentication → Users → Add user → Create new user**: la tua email e una password robusta, spunta "Auto Confirm User".
4. **SQL Editor**: esegui, in ordine, il contenuto di
   - `supabase/migrations/20261127000001_init.sql`
   - `supabase/migrations/20261127000002_sync.sql`
   - `supabase/seed.sql`
   (in alternativa, con la Supabase CLI: `supabase link` e `supabase db push`, poi il seed).
5. **Project Settings → API Keys**: copia l'URL del progetto e la **publishable key** (`sb_publishable_…`). Non usare mai la secret/service role key nel frontend.
6. **Advisors → Security Advisor**: deve risultare senza errori.

Ogni volta che si aggiungono o modificano contenuti in `content/`: `npm run db:seed` e riesegui `supabase/seed.sql` (idempotente, i progressi restano).

## 2. Prova in locale

```bash
cp .env.example .env.local   # inserisci URL e publishable key
npm run build && npm start   # il service worker è attivo solo in produzione
```

Al primo accesso, se in questo browser c'erano progressi della modalità locale e l'account è vuoto, vengono portati nell'account automaticamente. Se l'account ha già dati, le Impostazioni propongono "Unisci al mio account".

## 3. Vercel (deploy privato)

1. Importa il repository `PascucciL0/netflow` in Vercel (piano Hobby), framework Next.js, nessuna impostazione di build da cambiare.
2. **Settings → Environment Variables**: `NEXT_PUBLIC_SUPABASE_URL` e `NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY` per Production e Preview.
3. In Supabase, **Authentication → URL Configuration**: Site URL = dominio Vercel (es. `https://netflow-xxx.vercel.app`).
4. In modalità account l'app è chiusa: senza login si vede solo `/login`. Le anteprime di Vercel si possono proteggere anche con "Deployment Protection".

## 4. PWA

- Installazione: su Android/Chrome e desktop compare "Installa app"; su iPhone, Safari → Condividi → "Aggiungi alla schermata Home". Serve HTTPS (Vercel lo fornisce).
- Offline: le pagine principali vengono salvate all'installazione, i contenuti già aperti restano consultabili, la pagina `/offline` copre il resto. Ripassi e interazioni fatti offline vengono inviati al ritorno della rete.
- Aggiornamenti: quando esce una nuova versione compare "È disponibile una nuova versione · Aggiorna". Se si modifica `public/sw.js`, incrementare `VERSION` in testa al file.
- Login nella PWA installata: email e password (i magic link aprirebbero il browser invece dell'app).
