import AnimatedSection from "@/components/animations/section";
import ButtonAnimation from "@/components/buttons/animation";
import JoinButton from "@/components/buttons/join";
import Countdown from "@/components/countdown";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Book, Clock } from "lucide-react";
import Link from "next/link";

export default function HeroSection() {
  return (
    <AnimatedSection>
      <div className="min-h-96 flex flex-col justify-center space-y-4 items-start">
        <h1 className="text-primary text-6xl">Boot</h1>
        <div className="text-xl p-4 bg-primary/25 border rounded">
          Build your OS, get hardware to run it.
        </div>
        <div className="flex flex-row gap-4">
          <ButtonAnimation>
            <JoinButton text="Go To Dashboard" />
          </ButtonAnimation>
          <ButtonAnimation>
            <Button variant="secondary" asChild>
              <Link href="/guides/home">
                <Book />
                Read Guides
              </Link>
            </Button>
          </ButtonAnimation>
        </div>
      </div>
    </AnimatedSection>
  );
}
