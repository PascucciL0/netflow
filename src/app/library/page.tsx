import type { Metadata } from "next";
import { LibraryView } from "@/components/library/library-view";

export const metadata: Metadata = { title: "Libreria" };

export default function LibraryPage() {
  return <LibraryView />;
}
