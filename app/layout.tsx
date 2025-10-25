import type { Metadata } from "next";
import { Geist_Mono } from "next/font/google";
import "./globals.css";

const geistMono = Geist_Mono({
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "Boot - Build you OS, get hardware to run it",
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
    <html lang="en">
      <body className={`${geistMono.className} antialiased`}>{children}</body>
    </html>
  );
}
