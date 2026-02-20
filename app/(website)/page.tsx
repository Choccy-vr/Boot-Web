import HeroSection from "@/components/sections/hero";
import WhatCountsSection from "@/components/sections/whatcounts";
import { HowItWorksSection } from "@/components/sections/howitworks";
import FAQsSection from "@/components/sections/faqs";
import Image from "next/image";
import Link from "next/link";

export default function Home() {
  return (
    <div className="flex flex-col gap-10">
      <HeroSection />
      <HowItWorksSection />
      <WhatCountsSection />
      <FAQsSection />
      <Link
        href="https://hackclub.com"
        target="_blank"
        className="group fixed bottom-4 left-0 z-50 w-40"
      >
        <Image
          src="/Boot-Oprheus-Flag-Left.svg"
          alt="Hack Club"
          width={280}
          height={158}
          className="-translate-x-2 -rotate-3 duration-200 drop-shadow-[0_0_5px_rgba(34,197,94,0.62)] group-hover:opacity-0 group-hover:translate-x-0 group-hover:rotate-0"
        />
        <Image
          src="/flag-orpheus-left.svg"
          alt="Hack Club"
          width={280}
          height={158}
          className="pointer-events-none absolute inset-0 opacity-0 -translate-x-2 -rotate-3 duration-200 drop-shadow-[0_0_5px_rgba(34,197,94,0.62)] group-hover:opacity-100 group-hover:translate-x-0 group-hover:rotate-0"
        />
      </Link>
    </div>
  );
}
