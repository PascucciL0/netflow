import type { Metadata, Viewport } from "next";
import "./globals.css";
import { ProgressProvider } from "@/data/progress-context";
import { AppShell } from "@/components/shell/app-shell";
import { ThemeController } from "@/components/shell/theme-controller";
import { ServiceWorkerRegistration } from "@/components/pwa/sw-register";
import { THEME_BOOT_SCRIPT } from "@/lib/theme";

export const metadata: Metadata = {
  title: { default: "NetFlow", template: "%s · NetFlow" },
  description: "Apprendimento continuo di Networking e Network Security: microlezioni, active recall e ripasso programmato.",
  applicationName: "NetFlow",
  appleWebApp: { capable: true, title: "NetFlow", statusBarStyle: "black-translucent" },
  formatDetection: { telephone: false },
  robots: { index: false, follow: false },
};

export const viewport: Viewport = {
  width: "device-width",
  initialScale: 1,
  viewportFit: "cover",
  themeColor: [
    { media: "(prefers-color-scheme: light)", color: "#f6f7f9" },
    { media: "(prefers-color-scheme: dark)", color: "#07090d" },
  ],
};

export default function RootLayout({ children }: LayoutProps<"/">) {
  return (
    <html lang="it" suppressHydrationWarning>
      <head>
        <script dangerouslySetInnerHTML={{ __html: THEME_BOOT_SCRIPT }} />
      </head>
      <body className="min-h-dvh">
        <ProgressProvider>
          <ThemeController />
          <AppShell>{children}</AppShell>
          <ServiceWorkerRegistration />
        </ProgressProvider>
      </body>
    </html>
  );
}
