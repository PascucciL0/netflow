"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { Settings } from "lucide-react";
import type { ReactNode } from "react";
import { useDueCount } from "@/components/content/use-learning";
import { Logo } from "./logo";
import { NAV_ITEMS, isActive } from "./nav-items";

/**
 * Struttura dell'app: barra inferiore su smartphone, sidebar su desktop (≥ lg).
 * L'area centrale è una colonna di lettura (max ~680px).
 */
export function AppShell({ children }: { children: ReactNode }) {
  const pathname = usePathname();
  const due = useDueCount();

  return (
    <div className="lg:flex">
      <a href="#main" className="sr-only focus:not-sr-only focus:fixed focus:left-3 focus:top-3 focus:z-50 focus:rounded-md focus:bg-surface focus:px-3 focus:py-2">
        Vai al contenuto
      </a>

      {/* Sidebar desktop */}
      <aside className="sticky top-0 hidden h-dvh w-60 shrink-0 flex-col border-r border-line px-4 py-6 lg:flex">
        <Link href="/" className="mb-8 px-2" aria-label="NetFlow, vai al feed">
          <Logo />
        </Link>
        <nav aria-label="Principale" className="flex flex-col gap-1">
          {NAV_ITEMS.map((item) => {
            const active = isActive(pathname, item.href);
            const Icon = item.icon;
            return (
              <Link
                key={item.href}
                href={item.href}
                aria-current={active ? "page" : undefined}
                className={`flex h-10 items-center gap-3 rounded-[10px] px-3 text-[15px] transition-colors ${
                  active ? "bg-surface-2 font-medium text-ink" : "text-ink-2 hover:bg-surface-2 hover:text-ink"
                }`}
              >
                <Icon size={18} strokeWidth={active ? 2.2 : 1.8} aria-hidden />
                {item.label}
                {item.href === "/review" && due > 0 && (
                  <span className="ml-auto font-mono text-xs text-accent-text" aria-label={`${due} ripassi in scadenza`}>{due}</span>
                )}
              </Link>
            );
          })}
        </nav>
        <div className="mt-auto">
          <Link
            href="/settings"
            aria-current={pathname.startsWith("/settings") ? "page" : undefined}
            className="flex h-10 items-center gap-3 rounded-[10px] px-3 text-[15px] text-ink-2 hover:bg-surface-2 hover:text-ink"
          >
            <Settings size={18} strokeWidth={1.8} aria-hidden />
            Impostazioni
          </Link>
        </div>
      </aside>

      <div className="min-w-0 flex-1">
        {/* Top bar mobile */}
        <header className="sticky top-0 z-30 flex h-14 items-center justify-between border-b border-line bg-bg/85 px-4 pt-[env(safe-area-inset-top)] backdrop-blur-md lg:hidden" style={{ height: "calc(3.5rem + env(safe-area-inset-top))" }}>
          <Link href="/" aria-label="NetFlow, vai al feed">
            <Logo />
          </Link>
          <Link href="/settings" className="-mr-2 grid size-11 place-items-center rounded-full text-ink-2 hover:text-ink" aria-label="Impostazioni">
            <Settings size={20} strokeWidth={1.8} aria-hidden />
          </Link>
        </header>

        <main id="main" className="mx-auto w-full max-w-[680px] px-4 pb-[calc(6rem+env(safe-area-inset-bottom))] pt-4 lg:px-8 lg:pb-16 lg:pt-10">
          {children}
        </main>

        {/* Bottom nav mobile */}
        <nav
          aria-label="Principale"
          className="fixed inset-x-0 bottom-0 z-30 border-t border-line bg-bg/90 pb-[env(safe-area-inset-bottom)] backdrop-blur-md lg:hidden"
        >
          <ul className="mx-auto grid max-w-md grid-cols-4">
            {NAV_ITEMS.map((item) => {
              const active = isActive(pathname, item.href);
              const Icon = item.icon;
              return (
                <li key={item.href}>
                  <Link
                    href={item.href}
                    aria-current={active ? "page" : undefined}
                    className={`relative flex h-16 flex-col items-center justify-center gap-1 text-[11px] ${active ? "text-ink" : "text-ink-3"}`}
                  >
                    <Icon size={22} strokeWidth={active ? 2.2 : 1.7} aria-hidden />
                    <span className={active ? "font-medium" : ""}>{item.label}</span>
                    {item.href === "/review" && due > 0 && (
                      <span className="absolute right-[calc(50%-20px)] top-2.5 min-w-4 rounded-full bg-accent px-1 text-center font-mono text-[10px] leading-4 text-on-accent" aria-label={`${due} ripassi in scadenza`}>
                        {due > 99 ? "99+" : due}
                      </span>
                    )}
                  </Link>
                </li>
              );
            })}
          </ul>
        </nav>
      </div>
    </div>
  );
}
