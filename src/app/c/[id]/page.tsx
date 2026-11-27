import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { Suspense } from "react";
import { seedItemById, seedItems } from "@/data/catalog";
import { ContentDetail } from "@/components/content/content-detail";

export function generateStaticParams() {
  return seedItems.map((i) => ({ id: i.id }));
}

export async function generateMetadata({ params }: PageProps<"/c/[id]">): Promise<Metadata> {
  const { id } = await params;
  return { title: seedItemById.get(id)?.title ?? "Contenuto" };
}

export default function ContentPage({ params }: PageProps<"/c/[id]">) {
  return (
    <Suspense fallback={<div className="h-64 animate-pulse rounded-[var(--radius-card)] bg-surface-2" aria-busy="true" />}>
      <Resolved params={params} />
    </Suspense>
  );
}

async function Resolved({ params }: { params: PageProps<"/c/[id]">["params"] }) {
  const { id } = await params;
  const item = seedItemById.get(id);
  if (!item) notFound();
  return <ContentDetail item={item} />;
}
