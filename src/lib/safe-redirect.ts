/**
 * Percorso di ritorno dopo il login: solo percorsi interni dell'app (niente open redirect).
 * "/c/arp?x=1" → ok; "//evil.com", "https://evil.com", "/\\evil" → "/".
 */
export function safeNextPath(raw: string | null | undefined): string {
  if (!raw || raw.length > 512) return "/";
  if (!raw.startsWith("/") || raw.startsWith("//") || raw.startsWith("/\\")) return "/";
  if (/[\u0000-\u001f]/.test(raw)) return "/";
  try {
    const u = new URL(raw, "https://netflow.invalid");
    if (u.origin !== "https://netflow.invalid") return "/";
    if (u.pathname === "/login") return "/";
    return `${u.pathname}${u.search}${u.hash}`;
  } catch {
    return "/";
  }
}
