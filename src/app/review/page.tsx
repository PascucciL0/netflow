import type { Metadata } from "next";
import { ReviewView } from "@/components/review/review-view";

export const metadata: Metadata = { title: "Ripasso" };

export default function ReviewPage() {
  return <ReviewView />;
}
