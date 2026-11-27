/** Utilità per i confini di giornata nel fuso orario dell'utente. */

/** Giorno locale "YYYY-MM-DD" di un istante, nel fuso indicato (IANA). */
export function localDayKey(now: Date, timeZone: string): string {
  try {
    return new Intl.DateTimeFormat("en-CA", { timeZone, year: "numeric", month: "2-digit", day: "2-digit" }).format(now);
  } catch {
    return now.toISOString().slice(0, 10);
  }
}

export function formatDate(iso: string, timeZone: string): string {
  try {
    return new Intl.DateTimeFormat("it-IT", { timeZone, day: "numeric", month: "short", year: "numeric" }).format(new Date(iso));
  } catch {
    return iso.slice(0, 10);
  }
}
