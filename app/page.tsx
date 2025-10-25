import TerminalBreadcrumbs from "@/components/terminal-breadcrumbs";
import HeroSection from "@/components/sections/hero";
import AboutSection from "@/components/sections/about";
import WhatCountsSection from "@/components/sections/whatcounts";

export default function Home() {
  return (
    <>
      <TerminalBreadcrumbs breadcrumbs={[{ slug: "/", text: "home" }]} />
      <HeroSection />
      <AboutSection />
      <WhatCountsSection />
    </>
  );
}
