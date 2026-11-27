"use client";

import { useEffect, useRef } from "react";
import { useDispatch } from "@/data/progress-context";

/**
 * Segna un contenuto come "visualizzato" quando resta visibile per almeno 60% per 1,2 s.
 * Visualizzare NON equivale a una revisione: aggiorna solo ContentProgress.seenCount.
 */
export function useSeen<T extends Element>(contentId: string) {
  const ref = useRef<T | null>(null);
  const dispatch = useDispatch();
  useEffect(() => {
    const el = ref.current;
    if (!el || typeof IntersectionObserver === "undefined") return;
    let timer: ReturnType<typeof setTimeout> | undefined;
    let done = false;
    const obs = new IntersectionObserver(
      ([entry]) => {
        if (done) return;
        if (entry.isIntersecting && entry.intersectionRatio >= 0.6) {
          timer = setTimeout(() => {
            done = true;
            dispatch({ type: "content/seen", contentId });
            obs.disconnect();
          }, 1200);
        } else if (timer) {
          clearTimeout(timer);
        }
      },
      { threshold: [0, 0.6, 1] },
    );
    obs.observe(el);
    return () => {
      if (timer) clearTimeout(timer);
      obs.disconnect();
    };
  }, [contentId, dispatch]);
  return ref;
}
