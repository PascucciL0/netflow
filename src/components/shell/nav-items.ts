import { ChartNoAxesColumn, LibraryBig, RotateCcw, Rows3, type LucideIcon } from "lucide-react";

export interface NavItem {
  href: "/" | "/review" | "/library" | "/progress";
  label: string;
  icon: LucideIcon;
}

export const NAV_ITEMS: NavItem[] = [
  { href: "/", label: "Feed", icon: Rows3 },
  { href: "/review", label: "Ripasso", icon: RotateCcw },
  { href: "/library", label: "Libreria", icon: LibraryBig },
  { href: "/progress", label: "Progressi", icon: ChartNoAxesColumn },
];

export const isActive = (pathname: string, href: string) => (href === "/" ? pathname === "/" || pathname.startsWith("/c/") : pathname.startsWith(href));
