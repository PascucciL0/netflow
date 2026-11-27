-- NetFlow — funzioni di sincronizzazione dei progressi personali
-- Documentazione: docs/DATABASE_SCHEMA.md (sezione "Sincronizzazione")
--
--   * reset_review_state: azzera una carta con controllo di versione (azione "Reset" dell'utente);
--   * import_progress:    importa in blocco i progressi (migrazione dei dati locali al primo accesso,
--                         ripristino di un backup, cancellazione completa con p_replace = true).
--
-- Entrambe sono security definer con search_path vuoto, ricavano l'utente solo da auth.uid()
-- e scrivono esclusivamente righe di quell'utente su contenuti che può vedere.

begin;

-- ─────────────────────────────────────────────────────────────── reset di una carta
-- Riporta la carta allo stato "nuova" (stessi valori di createEmptyCard in ts-fsrs) e incrementa la versione,
-- così client e server restano allineati sul contatore usato da record_review.
create or replace function public.reset_review_state(
  p_recall_id uuid,
  p_expected_version int,
  p_due timestamptz,
  p_content_revision int
) returns text
language plpgsql security definer set search_path = '' as $$
declare
  v_uid uuid := auth.uid();
  v_current int;
begin
  if v_uid is null then raise exception 'not authenticated' using errcode = '28000'; end if;
  select version into v_current from public.review_states where user_id = v_uid and recall_id = p_recall_id for update;
  if v_current is null then return 'not_found'; end if;
  if v_current <> p_expected_version then return 'stale_version'; end if;
  update public.review_states set
    due = p_due, stability = 0, difficulty = 0, scheduled_days = 0, learning_steps = 0, reps = 0, lapses = 0,
    state = 0, last_review = null, content_revision = p_content_revision, version = v_current + 1, updated_at = now()
  where user_id = v_uid and recall_id = p_recall_id;
  return 'ok';
end $$;

revoke all on function public.reset_review_state from public, anon;
grant execute on function public.reset_review_state to authenticated;

-- ─────────────────────────────────────────────────────────────── importazione in blocco
-- p_payload: { topics: [...], content: [...], states: [...], events: [...], preferences: {...} | null }
--   con gli id del database (content_id, recall_id uuid) già risolti dal client.
-- p_replace = false → unione: le righe già presenti sul server vincono (on conflict do nothing).
-- p_replace = true  → sostituzione: cancella tutti i progressi dell'utente e inserisce il payload.
-- Le righe che puntano a contenuti non visibili o argomenti inesistenti vengono scartate e contate.
create or replace function public.import_progress(p_payload jsonb, p_replace boolean default false) returns jsonb
language plpgsql security definer set search_path = '' as $$
declare
  v_uid uuid := auth.uid();
  v_topics int := 0;
  v_content int := 0;
  v_states int := 0;
  v_events int := 0;
  v_total int;
begin
  if v_uid is null then raise exception 'not authenticated' using errcode = '28000'; end if;
  if jsonb_typeof(p_payload) <> 'object' then raise exception 'invalid payload' using errcode = '22023'; end if;
  if coalesce(jsonb_array_length(p_payload -> 'events'), 0) > 100000
     or coalesce(jsonb_array_length(p_payload -> 'states'), 0) > 20000
     or coalesce(jsonb_array_length(p_payload -> 'content'), 0) > 20000
     or coalesce(jsonb_array_length(p_payload -> 'topics'), 0) > 2000 then
    raise exception 'payload too large' using errcode = '54000';
  end if;

  if p_replace then
    delete from public.review_events where user_id = v_uid;
    delete from public.review_states where user_id = v_uid;
    delete from public.user_content_progress where user_id = v_uid;
    delete from public.user_topic_progress where user_id = v_uid;
  end if;

  with src as (
    select * from jsonb_to_recordset(coalesce(p_payload -> 'topics', '[]'::jsonb))
      as x(topic_id text, status text, updated_at timestamptz)
  ), ins as (
    insert into public.user_topic_progress (user_id, topic_id, status, updated_at)
    select v_uid, s.topic_id, s.status, coalesce(s.updated_at, now()) from src s
    where exists (select 1 from public.topics t where t.id = s.topic_id)
    on conflict (user_id, topic_id) do nothing
    returning 1
  ) select count(*) into v_topics from ins;

  with src as (
    select * from jsonb_to_recordset(coalesce(p_payload -> 'content', '[]'::jsonb))
      as x(content_id uuid, first_seen_at timestamptz, last_seen_at timestamptz, seen_count int, open_count int,
           saved boolean, hidden boolean, signal text, updated_at timestamptz)
  ), ins as (
    insert into public.user_content_progress (user_id, content_id, first_seen_at, last_seen_at, seen_count, open_count, saved, hidden, signal, updated_at)
    select v_uid, s.content_id, s.first_seen_at, s.last_seen_at, coalesce(s.seen_count, 0), coalesce(s.open_count, 0),
           coalesce(s.saved, false), coalesce(s.hidden, false), s.signal, coalesce(s.updated_at, now())
    from src s
    where exists (select 1 from public.content_items c where c.id = s.content_id and (c.owner_id is null or c.owner_id = v_uid))
    on conflict (user_id, content_id) do nothing
    returning 1
  ) select count(*) into v_content from ins;

  with src as (
    select * from jsonb_to_recordset(coalesce(p_payload -> 'states', '[]'::jsonb))
      as x(recall_id uuid, due timestamptz, stability double precision, difficulty double precision, scheduled_days int,
           learning_steps int, reps int, lapses int, state smallint, last_review timestamptz, content_revision int, version int)
  ), ins as (
    insert into public.review_states (user_id, recall_id, due, stability, difficulty, scheduled_days, learning_steps, reps, lapses,
      state, last_review, content_revision, version, updated_at)
    select v_uid, s.recall_id, s.due, s.stability, s.difficulty, s.scheduled_days, s.learning_steps, s.reps, s.lapses,
           s.state, s.last_review, s.content_revision, coalesce(s.version, 0), now()
    from src s
    where exists (
      select 1 from public.recall_prompts r join public.content_items c on c.id = r.content_id
      where r.id = s.recall_id and (c.owner_id is null or c.owner_id = v_uid)
    )
    on conflict (user_id, recall_id) do nothing
    returning 1
  ) select count(*) into v_states from ins;

  with src as (
    select * from jsonb_to_recordset(coalesce(p_payload -> 'events', '[]'::jsonb))
      as x(id uuid, recall_id uuid, rating text, reviewed_at timestamptz, state_before smallint, due_before timestamptz,
           due_after timestamptz, stability_after double precision, difficulty_after double precision, scheduled_days int, elapsed_days int)
  ), ins as (
    insert into public.review_events (id, user_id, recall_id, rating, reviewed_at, state_before, due_before, due_after,
      stability_after, difficulty_after, scheduled_days, elapsed_days)
    select s.id, v_uid, s.recall_id, s.rating, s.reviewed_at, s.state_before, s.due_before, s.due_after,
           s.stability_after, s.difficulty_after, s.scheduled_days, s.elapsed_days
    from src s
    where s.reviewed_at <= now() + interval '5 minutes'
      and exists (
        select 1 from public.recall_prompts r join public.content_items c on c.id = r.content_id
        where r.id = s.recall_id and (c.owner_id is null or c.owner_id = v_uid)
      )
    -- un id già usato (anche da un altro utente) viene ignorato: l'import è ripetibile senza duplicati
    on conflict (id) do nothing
    returning 1
  ) select count(*) into v_events from ins;

  if p_payload ? 'preferences' and jsonb_typeof(p_payload -> 'preferences') = 'object' then
    insert into public.user_preferences as up (user_id, theme, time_zone, languages, updated_at)
    select v_uid,
           coalesce(p_payload #>> '{preferences,theme}', 'system'),
           coalesce(p_payload #>> '{preferences,time_zone}', 'Europe/Rome'),
           coalesce((select array_agg(value) from jsonb_array_elements_text(p_payload #> '{preferences,languages}')), array['it', 'en']),
           now()
    on conflict (user_id) do update set
      theme = case when p_replace then excluded.theme else up.theme end,
      time_zone = case when p_replace then excluded.time_zone else up.time_zone end,
      languages = case when p_replace then excluded.languages else up.languages end,
      updated_at = now();
  end if;

  v_total := coalesce(jsonb_array_length(p_payload -> 'topics'), 0) + coalesce(jsonb_array_length(p_payload -> 'content'), 0)
           + coalesce(jsonb_array_length(p_payload -> 'states'), 0) + coalesce(jsonb_array_length(p_payload -> 'events'), 0);
  return jsonb_build_object(
    'topics', v_topics, 'content', v_content, 'states', v_states, 'events', v_events,
    'skipped', v_total - v_topics - v_content - v_states - v_events
  );
end $$;

revoke all on function public.import_progress from public, anon;
grant execute on function public.import_progress to authenticated;

commit;
