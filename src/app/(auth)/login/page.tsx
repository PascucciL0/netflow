import type { Metadata } from "next";
import { LoginForm } from "@/components/account/login-form";

export const metadata: Metadata = { title: "Accedi" };

export default function LoginPage() {
  return <LoginForm />;
}
