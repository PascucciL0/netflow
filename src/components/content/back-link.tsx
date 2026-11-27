"use client";

import { ArrowLeft } from "lucide-react";
import { useRouter } from "next/navigation";

/** Torna indietro mantenendo la posizione nel feed (il feed resta montato grazie ad Activity). */
export function BackLink() {
  const router = useRouter();
  return (
    <button
      type="button"
      onClick={() => (window.history.length > 1 ? router.back() : router.push("/"))}
      className="-ml-2 mb-4 inline-flex h-10 items-center gap-1.5 rounded-lg px-2 text-[14px] text-ink-2 hover:text-ink"
    >
      <ArrowLeft size={17} aria-hidden /> Indietro
    </button>
  );
}
