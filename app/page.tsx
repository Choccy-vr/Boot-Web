import TerminalBreadcrumbs from "@/components/terminal-breadcrumbs";
import HeroSection from "@/components/sections/hero";
import AboutSection from "@/components/sections/about";
import WhatCountsSection from "@/components/sections/whatcounts";
import SupportSection from "@/components/sections/support";

export default function Home() {
  return (
    <>
      <TerminalBreadcrumbs breadcrumbs={[{ slug: "/", text: "home" }]} />
      <HeroSection />
      <AboutSection />
      <WhatCountsSection />
      <SupportSection />
    </>
  );
}
