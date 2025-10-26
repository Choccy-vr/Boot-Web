import type { Metadata } from "next";
import { Geist_Mono } from "next/font/google";
import "./globals.css";
import { ThemeProvider } from "@/components/theme-provider";
import Navbar from "@/components/navbar";
import JoinButton from "@/components/buttons/join";
import Footer from "@/components/footer";
import AnimatedSection from "@/components/animations/section";

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
    <html lang="en" suppressHydrationWarning>
      <body className={`${geistMono.className} antialiased`}>
        <ThemeProvider attribute="class" forcedTheme="dark">
          <Navbar />
          <main className="max-w-4xl w-screen mx-auto px-2 pt-2">
            {children}
          </main>
          <AnimatedSection className="pb-0!">
            <Footer />
          </AnimatedSection>
          <JoinButton className="fixed bottom-2 right-2" size="lg" />
        </ThemeProvider>
      </body>
    </html>
  );
}
