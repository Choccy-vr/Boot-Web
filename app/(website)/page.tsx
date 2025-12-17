import TerminalBreadcrumbs from "@/components/terminal-breadcrumbs";
import HeroSection from "@/components/sections/hero";
import AboutSection from "@/components/sections/about";
import WhatCountsSection from "@/components/sections/whatcounts";
import FAQsSection from "@/components/sections/faqs";
import Image from "next/image";

export default function Home() {
  return (
    <div className="flex flex-col gap-10">
      <TerminalBreadcrumbs breadcrumbs={[{ slug: "/", text: "home" }]} />
      <HeroSection />
      <AboutSection />
      <WhatCountsSection />
      <FAQsSection />
      <Image
        src="flag-orpheus-left.svg"
        alt="Hack Club"
        width={280}
        height={158}
        className="fixed bottom-4 left-0 z-50 w-40 -translate-x-2 -rotate-3 hover:translate-x-0 hover:rotate-0 duration-200"
      />
    </div>
  );
}
