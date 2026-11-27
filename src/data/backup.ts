/** Esportazione dei dati personali in un file JSON versionato. */
import type { UserSnapshot } from "@/domain/progress";

export const BACKUP_FORMAT = "netflow.user-backup" as const;
export const BACKUP_VERSION = 1 as const;

export interface UserBackup {
  format: typeof BACKUP_FORMAT;
  version: typeof BACKUP_VERSION;
  exportedAt: string;
  data: UserSnapshot;
}

export function makeBackup(snapshot: UserSnapshot, now: Date): UserBackup {
  return { format: BACKUP_FORMAT, version: BACKUP_VERSION, exportedAt: now.toISOString(), data: snapshot };
}

export function downloadJson(filename: string, value: unknown): void {
  const blob = new Blob([JSON.stringify(value, null, 2)], { type: "application/json" });
  const url = URL.createObjectURL(blob);
  const a = document.createElement("a");
  a.href = url;
  a.download = filename;
  a.click();
  setTimeout(() => URL.revokeObjectURL(url), 1000);
}
