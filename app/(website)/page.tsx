import TerminalBreadcrumbs from "@/components/terminal-breadcrumbs";
import HeroSection from "@/components/sections/hero";
import AboutSection from "@/components/sections/about";
import WhatCountsSection from "@/components/sections/whatcounts";
import FAQsSection from "@/components/sections/faqs";

export default function Home() {
  return (
    <div className="flex flex-col gap-10">
      <TerminalBreadcrumbs breadcrumbs={[{ slug: "/", text: "home" }]} />
      <HeroSection />
      <AboutSection />
      <WhatCountsSection />
      <FAQsSection />
    </div>
  );
}
