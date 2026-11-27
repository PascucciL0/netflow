-- NetFlow — schema iniziale
-- Documentazione: docs/DATABASE_SCHEMA.md
-- Principi:
--   * catalogo e contenuti di sistema: leggibili dagli utenti autenticati, scrivibili solo via migration/service role;
--   * contenuti importati: appartengono a un utente (owner_id) e sono visibili solo a lui;
--   * dati personali: isolati per user_id con RLS su ogni tabella;
--   * review_events: append-only (nessun UPDATE/DELETE dal client).
-- Richiede PostgreSQL 15+ (UNIQUE NULLS NOT DISTINCT), disponibile su Supabase.

begin;

-- ─────────────────────────────────────────────────────────────── utilità
create or replace function public.touch_updated_at() returns trigger
language plpgsql set search_path = '' as $$
begin
  new.updated_at := now();
  return new;
end $$;

-- ─────────────────────────────────────────────────────────────── profili
create table public.profiles (
  id uuid primary key references auth.users (id) on delete cascade,
  display_name text check (char_length(display_name) <= 80),
  created_at timestamptz not null default now()
);

create table public.user_preferences (
  user_id uuid primary key references auth.users (id) on delete cascade,
  theme text not null default 'system' check (theme in ('system', 'light', 'dark')),
  time_zone text not null default 'Europe/Rome' check (char_length(time_zone) between 1 and 64),
  languages text[] not null default array['it', 'en'] check (languages <@ array['it', 'en'] and cardinality(languages) >= 1),
  updated_at timestamptz not null default now()
);

-- ─────────────────────────────────────────────────────────────── catalogo (dato di sistema)
create table public.learning_tracks (
  id text primary key check (id ~ '^[a-z0-9][a-z0-9-]{1,78}[a-z0-9]$'),
  title text not null,
  summary text not null default '',
  blueprint_id text,
  position int not null default 0
);

create table public.modules (
  id text primary key check (id ~ '^[a-z0-9][a-z0-9-]{1,78}[a-z0-9]$'),
  track_id text not null references public.learning_tracks (id) on delete cascade,
  title text not null,
  summary text not null default '',
  position int not null
);
create index modules_track_idx on public.modules (track_id, position);

create table public.topics (
  id text primary key check (id ~ '^[a-z0-9][a-z0-9-]{1,78}[a-z0-9]$'),
  module_id text not null references public.modules (id) on delete cascade,
  title text not null,
  summary text not null default '',
  position int not null
);
create index topics_module_idx on public.topics (module_id, position);

create table public.topic_prerequisites (
  topic_id text not null references public.topics (id) on delete cascade,
  prerequisite_id text not null references public.topics (id) on delete cascade,
  primary key (topic_id, prerequisite_id),
  check (topic_id <> prerequisite_id)
);

-- Obiettivi ufficiali: testo copiato dal blueprint, mai inventato.
create table public.blueprint_objectives (
  id text primary key check (id ~ '^[a-z0-9-]+:\d+\.\d+(\.[a-z])?$'),
  blueprint_id text not null,
  code text not null,
  domain_code text not null,
  title text not null,
  unique (blueprint_id, code)
);

create table public.topic_objectives (
  topic_id text not null references public.topics (id) on delete cascade,
  objective_id text not null references public.blueprint_objectives (id) on delete cascade,
  primary key (topic_id, objective_id)
);

-- ─────────────────────────────────────────────────────────────── contenuti
create table public.content_items (
  id uuid primary key default gen_random_uuid(),
  -- null = contenuto di sistema (seed). Altrimenti contenuto importato dall'utente.
  owner_id uuid references auth.users (id) on delete cascade,
  slug text not null check (slug ~ '^[a-z0-9][a-z0-9-]{1,78}[a-z0-9]$'),
  revision int not null default 1 check (revision between 1 and 10000),
  kind text not null check (kind in ('lesson','deep_dive','flashcard','recall','command','config','output_analysis','troubleshooting','comparison','trivia','enterprise','common_mistake')),
  language text not null check (language in ('it', 'en')),
  title text not null check (char_length(title) between 3 and 140),
  summary text not null check (char_length(summary) between 10 and 400),
  body text not null default '' check (char_length(body) <= 20000),
  track_id text not null references public.learning_tracks (id),
  topic_id text not null references public.topics (id),
  subtopic text check (char_length(subtopic) <= 80),
  difficulty smallint not null check (difficulty between 1 and 3),
  reading_minutes smallint not null check (reading_minutes between 1 and 30),
  provenance text not null check (provenance in ('official','original','professional','hypothetical')),
  review_status text not null default 'proposed' check (review_status in ('proposed','approved')),
  tags text[] not null default '{}' check (cardinality(tags) <= 12),
  -- riferimenti al registro chiuso dei diagrammi: [{ "id": "...", "caption": "..." }]
  diagrams jsonb not null default '[]'::jsonb check (jsonb_typeof(diagrams) = 'array' and jsonb_array_length(diagrams) <= 4),
  import_batch_id uuid,
  created_on date not null,
  updated_on date not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  check (updated_on >= created_on),
  -- uno slug è unico per proprietario; i contenuti di sistema condividono owner_id null
  unique nulls not distinct (owner_id, slug)
);
create index content_items_topic_idx on public.content_items (topic_id);
create index content_items_owner_idx on public.content_items (owner_id);
create trigger content_items_touch before update on public.content_items
  for each row execute function public.touch_updated_at();

create table public.content_objectives (
  content_id uuid not null references public.content_items (id) on delete cascade,
  objective_id text not null references public.blueprint_objectives (id),
  primary key (content_id, objective_id)
);

create table public.content_prerequisites (
  content_id uuid not null references public.content_items (id) on delete cascade,
  topic_id text not null references public.topics (id),
  primary key (content_id, topic_id)
);

create table public.content_sources (
  id uuid primary key default gen_random_uuid(),
  content_id uuid not null references public.content_items (id) on delete cascade,
  position smallint not null,
  title text not null check (char_length(title) between 2 and 200),
  url text check (url ~ '^https://' and char_length(url) <= 500),
  publisher text not null check (char_length(publisher) between 2 and 120),
  source_type text not null check (source_type in ('official','rfc','vendor_docs','standard','course','other')),
  verified_on date,
  unique (content_id, position)
);

create table public.content_relations (
  content_id uuid not null references public.content_items (id) on delete cascade,
  related_id uuid not null references public.content_items (id) on delete cascade,
  primary key (content_id, related_id),
  check (content_id <> related_id)
);

-- Domande di active recall. (content_id, key) è stabile: aggiornare il contenuto non perde i ripassi.
create table public.recall_prompts (
  id uuid primary key default gen_random_uuid(),
  content_id uuid not null references public.content_items (id) on delete cascade,
  key text not null check (key ~ '^[a-z0-9-]{1,40}$'),
  position smallint not null default 0,
  prompt text not null check (char_length(prompt) between 5 and 600),
  answer text not null check (char_length(answer) between 5 and 4000),
  key_points text[] not null default '{}' check (cardinality(key_points) <= 10),
  common_mistakes text[] not null default '{}' check (cardinality(common_mistakes) <= 10),
  unique (content_id, key)
);

-- ─────────────────────────────────────────────────────────────── import
create table public.import_batches (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  package_id text not null,
  schema_version int not null,
  file_name text check (char_length(file_name) <= 200),
  status text not null check (status in ('applied', 'rejected')),
  created_count int not null default 0,
  updated_count int not null default 0,
  skipped_count int not null default 0,
  errors jsonb not null default '[]'::jsonb,
  created_at timestamptz not null default now()
);
create index import_batches_user_idx on public.import_batches (user_id, created_at desc);
alter table public.content_items
  add constraint content_items_import_batch_fk foreign key (import_batch_id) references public.import_batches (id) on delete set null;

-- ─────────────────────────────────────────────────────────────── progressi personali
create table public.user_topic_progress (
  user_id uuid not null references auth.users (id) on delete cascade,
  topic_id text not null references public.topics (id) on delete cascade,
  status text not null check (status in ('not_started','studying','studied','consolidating','mastered')),
  updated_at timestamptz not null default now(),
  primary key (user_id, topic_id)
);

create table public.user_content_progress (
  user_id uuid not null references auth.users (id) on delete cascade,
  content_id uuid not null references public.content_items (id) on delete cascade,
  first_seen_at timestamptz,
  last_seen_at timestamptz,
  seen_count int not null default 0 check (seen_count >= 0),
  open_count int not null default 0 check (open_count >= 0),
  saved boolean not null default false,
  hidden boolean not null default false,
  signal text check (signal in ('difficult', 'understood')),
  updated_at timestamptz not null default now(),
  primary key (user_id, content_id)
);
create index user_content_saved_idx on public.user_content_progress (user_id) where saved;

create table public.review_states (
  user_id uuid not null references auth.users (id) on delete cascade,
  recall_id uuid not null references public.recall_prompts (id) on delete cascade,
  due timestamptz not null,
  stability double precision not null check (stability >= 0),
  difficulty double precision not null check (difficulty >= 0),
  scheduled_days int not null check (scheduled_days >= 0),
  learning_steps int not null default 0 check (learning_steps >= 0),
  reps int not null default 0 check (reps >= 0),
  lapses int not null default 0 check (lapses >= 0),
  state smallint not null check (state between 0 and 3),
  last_review timestamptz,
  content_revision int not null,
  version int not null default 0 check (version >= 0),
  updated_at timestamptz not null default now(),
  primary key (user_id, recall_id)
);
create index review_states_due_idx on public.review_states (user_id, due);

create table public.review_events (
  -- id generato dal client: un reinvio dello stesso evento viene rifiutato (idempotenza)
  id uuid primary key,
  user_id uuid not null references auth.users (id) on delete cascade,
  recall_id uuid not null references public.recall_prompts (id) on delete cascade,
  rating text not null check (rating in ('again','hard','good','easy')),
  reviewed_at timestamptz not null,
  state_before smallint not null check (state_before between 0 and 3),
  due_before timestamptz,
  due_after timestamptz not null,
  stability_after double precision not null,
  difficulty_after double precision not null,
  scheduled_days int not null check (scheduled_days >= 0),
  elapsed_days int not null check (elapsed_days >= 0),
  created_at timestamptz not null default now()
);
create index review_events_user_idx on public.review_events (user_id, reviewed_at desc);

-- ─────────────────────────────────────────────────────────────── RLS
alter table public.profiles enable row level security;
alter table public.user_preferences enable row level security;
alter table public.learning_tracks enable row level security;
alter table public.modules enable row level security;
alter table public.topics enable row level security;
alter table public.topic_prerequisites enable row level security;
alter table public.blueprint_objectives enable row level security;
alter table public.topic_objectives enable row level security;
alter table public.content_items enable row level security;
alter table public.content_objectives enable row level security;
alter table public.content_prerequisites enable row level security;
alter table public.content_sources enable row level security;
alter table public.content_relations enable row level security;
alter table public.recall_prompts enable row level security;
alter table public.import_batches enable row level security;
alter table public.user_topic_progress enable row level security;
alter table public.user_content_progress enable row level security;
alter table public.review_states enable row level security;
alter table public.review_events enable row level security;

-- Nessun accesso anonimo: si revoca tutto ad anon, si concede il minimo ad authenticated.
revoke all on all tables in schema public from anon;

-- profili e preferenze: solo il proprietario
create policy profiles_own on public.profiles for all to authenticated
  using (id = (select auth.uid())) with check (id = (select auth.uid()));
create policy prefs_own on public.user_preferences for all to authenticated
  using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));

-- catalogo: sola lettura per gli autenticati
create policy tracks_read on public.learning_tracks for select to authenticated using (true);
create policy modules_read on public.modules for select to authenticated using (true);
create policy topics_read on public.topics for select to authenticated using (true);
create policy topic_prereq_read on public.topic_prerequisites for select to authenticated using (true);
create policy objectives_read on public.blueprint_objectives for select to authenticated using (true);
create policy topic_objectives_read on public.topic_objectives for select to authenticated using (true);

-- contenuti: sistema (owner null) leggibili da tutti gli autenticati; importati solo dal proprietario
create policy content_read on public.content_items for select to authenticated
  using (owner_id is null or owner_id = (select auth.uid()));
create policy content_insert on public.content_items for insert to authenticated
  with check (owner_id = (select auth.uid()));
create policy content_update on public.content_items for update to authenticated
  using (owner_id = (select auth.uid())) with check (owner_id = (select auth.uid()));
create policy content_delete on public.content_items for delete to authenticated
  using (owner_id = (select auth.uid()));

-- tabelle figlie dei contenuti: la visibilità segue il contenuto padre
create or replace function public.can_read_content(cid uuid) returns boolean
language sql stable security invoker set search_path = '' as $$
  select exists (select 1 from public.content_items c where c.id = cid and (c.owner_id is null or c.owner_id = (select auth.uid())));
$$;
create or replace function public.owns_content(cid uuid) returns boolean
language sql stable security invoker set search_path = '' as $$
  select exists (select 1 from public.content_items c where c.id = cid and c.owner_id = (select auth.uid()));
$$;

create policy cobj_read on public.content_objectives for select to authenticated using (public.can_read_content(content_id));
create policy cobj_write on public.content_objectives for all to authenticated using (public.owns_content(content_id)) with check (public.owns_content(content_id));
create policy cpre_read on public.content_prerequisites for select to authenticated using (public.can_read_content(content_id));
create policy cpre_write on public.content_prerequisites for all to authenticated using (public.owns_content(content_id)) with check (public.owns_content(content_id));
create policy csrc_read on public.content_sources for select to authenticated using (public.can_read_content(content_id));
create policy csrc_write on public.content_sources for all to authenticated using (public.owns_content(content_id)) with check (public.owns_content(content_id));
create policy crel_read on public.content_relations for select to authenticated using (public.can_read_content(content_id));
create policy crel_write on public.content_relations for all to authenticated
  using (public.owns_content(content_id)) with check (public.owns_content(content_id) and public.can_read_content(related_id));
create policy recall_read on public.recall_prompts for select to authenticated using (public.can_read_content(content_id));
create policy recall_write on public.recall_prompts for all to authenticated using (public.owns_content(content_id)) with check (public.owns_content(content_id));

-- import: solo il proprietario, lo storico non si modifica
create policy import_read on public.import_batches for select to authenticated using (user_id = (select auth.uid()));
create policy import_insert on public.import_batches for insert to authenticated with check (user_id = (select auth.uid()));

-- progressi: solo il proprietario, e solo su contenuti che può vedere
create policy utp_own on public.user_topic_progress for all to authenticated
  using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));
create policy ucp_own on public.user_content_progress for all to authenticated
  using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()) and public.can_read_content(content_id));

-- review_states: lettura e cancellazione (reset) dirette; scrittura solo tramite record_review()
create policy rs_read on public.review_states for select to authenticated using (user_id = (select auth.uid()));
create policy rs_delete on public.review_states for delete to authenticated using (user_id = (select auth.uid()));
-- review_events: append-only, inserimento solo tramite record_review()
create policy re_read on public.review_events for select to authenticated using (user_id = (select auth.uid()));

-- ─────────────────────────────────────────────────────────────── operazione critica: registrare una revisione
-- Transazione atomica: inserisce l'evento (idempotente sull'id) e aggiorna lo stato con controllo di versione.
-- Il calcolo FSRS avviene nel client con lo stesso codice usato in locale (src/engine/scheduler.ts);
-- il server garantisce proprietà, idempotenza e concorrenza.
create or replace function public.record_review(
  p_event_id uuid,
  p_recall_id uuid,
  p_expected_version int,
  p_rating text,
  p_reviewed_at timestamptz,
  p_state_before smallint,
  p_due_before timestamptz,
  p_due timestamptz,
  p_stability double precision,
  p_difficulty double precision,
  p_scheduled_days int,
  p_elapsed_days int,
  p_learning_steps int,
  p_reps int,
  p_lapses int,
  p_state smallint,
  p_content_revision int
) returns text
language plpgsql security definer set search_path = '' as $$
declare
  v_uid uuid := auth.uid();
  v_current int;
begin
  if v_uid is null then raise exception 'not authenticated' using errcode = '28000'; end if;
  if not exists (
    select 1 from public.recall_prompts r join public.content_items c on c.id = r.content_id
    where r.id = p_recall_id and (c.owner_id is null or c.owner_id = v_uid)
  ) then raise exception 'recall not found' using errcode = 'P0002'; end if;
  if p_reviewed_at > now() + interval '5 minutes' then raise exception 'reviewed_at in the future' using errcode = '22007'; end if;

  if exists (select 1 from public.review_events where id = p_event_id) then return 'duplicate_event'; end if;

  select version into v_current from public.review_states where user_id = v_uid and recall_id = p_recall_id for update;
  if coalesce(v_current, 0) <> p_expected_version then return 'stale_version'; end if;

  insert into public.review_events (id, user_id, recall_id, rating, reviewed_at, state_before, due_before, due_after,
    stability_after, difficulty_after, scheduled_days, elapsed_days)
  values (p_event_id, v_uid, p_recall_id, p_rating, p_reviewed_at, p_state_before, p_due_before, p_due,
    p_stability, p_difficulty, p_scheduled_days, p_elapsed_days);

  insert into public.review_states as s (user_id, recall_id, due, stability, difficulty, scheduled_days, learning_steps,
    reps, lapses, state, last_review, content_revision, version, updated_at)
  values (v_uid, p_recall_id, p_due, p_stability, p_difficulty, p_scheduled_days, p_learning_steps,
    p_reps, p_lapses, p_state, p_reviewed_at, p_content_revision, p_expected_version + 1, now())
  on conflict (user_id, recall_id) do update set
    due = excluded.due, stability = excluded.stability, difficulty = excluded.difficulty,
    scheduled_days = excluded.scheduled_days, learning_steps = excluded.learning_steps, reps = excluded.reps,
    lapses = excluded.lapses, state = excluded.state, last_review = excluded.last_review,
    content_revision = excluded.content_revision, version = excluded.version, updated_at = now();
  return 'ok';
end $$;

revoke all on function public.record_review from public, anon;
grant execute on function public.record_review to authenticated;

commit;
