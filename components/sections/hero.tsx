"use client";

import Link from "next/link";
import { useRouter } from "next/navigation";
import { useState } from "react";
import AnimatedSection from "@/components/animations/section";
import BootLog from "@/components/animations/boot-log";
import { Button } from "@/components/ui/button";
import { ArrowRight, Rocket } from "lucide-react";
import ButtonAnimation from "../buttons/animation";

export default function HeroSection() {
  const router = useRouter();
  const [email, setEmail] = useState("");

  const handleSubmit = (event: { preventDefault: () => void }) => {
    event.preventDefault();
    const trimmedEmail = email.trim();
    if (!trimmedEmail) {
      return;
    }

    const params = new URLSearchParams({ email: trimmedEmail });
    router.push(`/dashboard/login?${params.toString()}`);
  };

  return (
    <AnimatedSection className="relative min-h-screen w-screen ml-[calc(-50vw+50%)] -mt-4 flex items-center justify-center px-4 overflow-hidden">
      <BootLog className="absolute inset-0 w-full h-full" />
      <div className="relative z-10 max-w-4xl w-full flex flex-col justify-center space-y-4 items-start">
        <h1 className="text-primary text-6xl font-bold">./boot</h1>
        <p className="font-bold text-2xl text-muted-foreground">
          Build an OS, get hardware to run it
        </p>
        <div className="flex flex-wrap gap-x-2 gap-y-1 text-sm text-muted-foreground">
          <span>
            14th March 2026 <ArrowRight className="inline h-3 w-3" /> 1st June
            2026
          </span>
          |<span>Ages 13-18</span>
        </div>
        <div className="flex w-full flex-col gap-3 sm:w-auto sm:flex-row sm:items-center">
          <form
            onSubmit={handleSubmit}
            className="flex w-full flex-col gap-2 sm:w-auto sm:flex-row"
          >
            <input
              type="email"
              placeholder="Enter your email"
              className="h-10 rounded-md border bg-card px-4 py-2 text-sm outline-none placeholder:text-muted-foreground focus:ring-2 focus:ring-primary sm:min-w-72"
              value={email}
              onChange={(event) => setEmail(event.target.value)}
            />
            <ButtonAnimation>
              <Button
                type="submit"
                size="lg"
                className="w-full cursor-pointer sm:w-auto"
              >
                <Rocket /> Get Started
              </Button>
            </ButtonAnimation>
          </form>
          <ButtonAnimation>
            <Button
              asChild
              variant="secondary"
              size="lg"
              className="w-full sm:w-auto"
            >
              <Link href="/guides">
                <ArrowRight /> Browse Guides
              </Link>
            </Button>
          </ButtonAnimation>
        </div>
      </div>
    </AnimatedSection>
  );
}
