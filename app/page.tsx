import TerminalBreadcrumbs from "@/components/terminal-breadcrumbs";
import HeroSection from "@/components/sections/hero";
import AboutSection from "@/components/sections/about";
import WhatCountsSection from "@/components/sections/whatcounts";
import DonateSection from "@/components/sections/donate";

export default function Home() {
  return (
    <>
      <TerminalBreadcrumbs breadcrumbs={[{ slug: "/", text: "home" }]} />
      <HeroSection />
      <AboutSection />
      <WhatCountsSection />
      <DonateSection />
    </>
  );
}
