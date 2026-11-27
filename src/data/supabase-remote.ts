/**
 * Implementazione di RemoteApi con supabase-js. Strato sottile: nessuna logica di dominio,
 * solo query e traduzione degli errori in RemoteError (transitorio o definitivo).
 */
import type { PostgrestError, SupabaseClient } from "@supabase/supabase-js";
import { RemoteError, type RemoteApi, type RpcOutcome } from "./sync-store";
import {
  buildContentMap,
  type ContentProgressRow,
  type ContentRow,
  type PreferencesRow,
  type RecallRow,
  type ReviewEventRow,
  type ReviewStateRow,
  type TopicProgressRow,
} from "./sync-types";

/** PostgREST su Supabase restituisce al massimo 1000 righe per richiesta. */
const PAGE = 1000;

interface Result<T> {
  data: T | null;
  error: PostgrestError | null;
  status: number;
}

function check<T>(r: Result<T>, what: string): T {
  if (r.error) {
    // status 0 = richiesta non partita (offline); 5xx, 408 e 429 = conviene riprovare
    const transient = r.status === 0 || r.status >= 500 || r.status === 408 || r.status === 429 || /fetch|network/i.test(r.error.message);
    throw new RemoteError(`${what}: ${r.error.message}`, transient);
  }
  return r.data as T;
}

async function all<T>(what: string, page: (from: number, to: number) => PromiseLike<Result<T[]>>): Promise<T[]> {
  const out: T[] = [];
  for (let from = 0; ; from += PAGE) {
    const rows = check(await page(from, from + PAGE - 1), what) ?? [];
    out.push(...rows);
    if (rows.length < PAGE) return out;
  }
}

const outcome = (v: unknown): RpcOutcome => (v === "ok" || v === "duplicate_event" || v === "stale_version" || v === "not_found" ? v : "ok");

export function createSupabaseRemote(sb: SupabaseClient): RemoteApi {
  return {
    async currentUser() {
      // getSession legge la sessione locale (funziona offline); l'identità è verificata dal server a ogni query (RLS).
      const { data } = await sb.auth.getSession();
      const u = data.session?.user;
      return u ? { id: u.id, email: u.email } : null;
    },

    async loadContentMap() {
      const [contents, recalls] = await Promise.all([
        all<ContentRow>("Contenuti", (a, b) => sb.from("content_items").select("id, slug, owner_id").order("id").range(a, b)),
        all<RecallRow>("Domande", (a, b) => sb.from("recall_prompts").select("id, content_id, key").order("id").range(a, b)),
      ]);
      return buildContentMap(contents, recalls);
    },

    async loadProgress(userId) {
      const [topics, content, states, events, prefs] = await Promise.all([
        all<TopicProgressRow>("Argomenti", (a, b) => sb.from("user_topic_progress").select("topic_id, status, updated_at").eq("user_id", userId).order("topic_id").range(a, b)),
        all<ContentProgressRow>("Interazioni", (a, b) =>
          sb.from("user_content_progress").select("content_id, first_seen_at, last_seen_at, seen_count, open_count, saved, hidden, signal, updated_at").eq("user_id", userId).order("content_id").range(a, b),
        ),
        all<ReviewStateRow>("Ripassi", (a, b) =>
          sb.from("review_states").select("recall_id, due, stability, difficulty, scheduled_days, learning_steps, reps, lapses, state, last_review, content_revision, version, updated_at").eq("user_id", userId).order("recall_id").range(a, b),
        ),
        all<ReviewEventRow>("Storico", (a, b) =>
          sb.from("review_events").select("id, recall_id, rating, reviewed_at, state_before, due_before, due_after, stability_after, difficulty_after, scheduled_days, elapsed_days").eq("user_id", userId).order("reviewed_at").order("id").range(a, b),
        ),
        sb.from("user_preferences").select("theme, time_zone, languages").eq("user_id", userId).maybeSingle(),
      ]);
      return { topics, content, states, events, preferences: check<PreferencesRow | null>(prefs, "Preferenze") };
    },

    async upsertTopic(userId, row) {
      check(await sb.from("user_topic_progress").upsert({ user_id: userId, ...row }, { onConflict: "user_id,topic_id" }), "Salvataggio argomento");
    },

    async upsertContent(userId, row) {
      check(await sb.from("user_content_progress").upsert({ user_id: userId, ...row }, { onConflict: "user_id,content_id" }), "Salvataggio interazione");
    },

    async upsertPreferences(userId, row) {
      check(await sb.from("user_preferences").upsert({ user_id: userId, ...row, updated_at: new Date().toISOString() }, { onConflict: "user_id" }), "Salvataggio preferenze");
    },

    async recordReview({ state, event, expectedVersion }) {
      const r = await sb.rpc("record_review", {
        p_event_id: event.id,
        p_recall_id: state.recall_id,
        p_expected_version: expectedVersion,
        p_rating: event.rating,
        p_reviewed_at: event.reviewed_at,
        p_state_before: event.state_before,
        p_due_before: event.due_before,
        p_due: state.due,
        p_stability: state.stability,
        p_difficulty: state.difficulty,
        p_scheduled_days: state.scheduled_days,
        p_elapsed_days: event.elapsed_days,
        p_learning_steps: state.learning_steps,
        p_reps: state.reps,
        p_lapses: state.lapses,
        p_state: state.state,
        p_content_revision: state.content_revision,
      });
      return outcome(check(r, "Registrazione ripasso"));
    },

    async resetReview({ recallId, expectedVersion, due, contentRevision }) {
      const r = await sb.rpc("reset_review_state", { p_recall_id: recallId, p_expected_version: expectedVersion, p_due: due, p_content_revision: contentRevision });
      return outcome(check(r, "Reset carta"));
    },

    async importProgress(payload, replace) {
      const r = await sb.rpc("import_progress", { p_payload: payload, p_replace: replace });
      const data = check<{ skipped?: number } | null>(r, "Importazione progressi");
      return { skipped: data?.skipped ?? 0 };
    },
  };
}
