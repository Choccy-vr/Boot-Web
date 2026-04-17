import type { Metadata } from "next";
import { Geist_Mono } from "next/font/google";
import "./globals.css";
import { ThemeProvider } from "@/components/theme-provider";

const geistMono = Geist_Mono({
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: {
    default: "Boot - Build your OS, get hardware to run it",
    template: "%s | Boot",
  },
  description: "Build your OS, Get hardware to run it. A Hack Club YSWS.",
  keywords: [
    "ysws",
    "hackathon",
    "operating system",
    "os",
    "linux",
    "hack club",
    "programming",
    "teens",
  ],
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" suppressHydrationWarning>
      <body className={`${geistMono.className} antialiased`}>
        <ThemeProvider attribute="class" forcedTheme="dark">
          {children}
        </ThemeProvider>
      </body>
    </html>
  );
}
