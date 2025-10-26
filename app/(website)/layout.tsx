import type { Metadata } from "next";
import Navbar from "@/components/navbar";
import JoinButton from "@/components/buttons/join";
import Footer from "@/components/footer";
import AnimatedSection from "@/components/animations/section";

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
    <>
      <div className="min-h-screen flex flex-col">
        <Navbar />
        <main className="max-w-4xl w-screen mx-auto p-4">{children}</main>
        <div className="grow"></div>
        <AnimatedSection>
          <Footer />
        </AnimatedSection>
      </div>
      <JoinButton className="fixed bottom-2 right-2" size="lg" />
    </>
  );
}
