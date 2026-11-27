"use client";

import { useEffect } from "react";
import { useSnapshot } from "@/data/progress-context";
import { resolveTheme } from "@/lib/theme";

/** Applica il tema scelto e segue il sistema quando la preferenza è "system". */
export function ThemeController() {
  const pref = useSnapshot().preferences.theme;
  useEffect(() => {
    const apply = () => {
      document.documentElement.dataset.theme = resolveTheme(pref);
    };
    apply();
    if (pref !== "system") return;
    const mq = window.matchMedia("(prefers-color-scheme: dark)");
    mq.addEventListener("change", apply);
    return () => mq.removeEventListener("change", apply);
  }, [pref]);
  return null;
}
