import AnimatedSection from "@/components/animations/section";
import ButtonAnimation from "@/components/buttons/animation";
import JoinButton from "@/components/buttons/join";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Clock } from "lucide-react";
import Link from "next/link";

export default function HeroSection() {
  return (
    <AnimatedSection>
      <div className="min-h-96 flex flex-col justify-center space-y-4 items-start">
        <Badge>
          <Clock /> Winter 2025
        </Badge>
        <h1 className="text-primary text-6xl">Boot</h1>
        <h3 className="text-xl p-4 bg-primary/25 border rounded">
          Build your OS. Share. Get prizes.
        </h3>
        <div className="flex flex-row gap-4">
          <ButtonAnimation>
            <JoinButton text="Join YSWS" />
          </ButtonAnimation>
          <ButtonAnimation>
            <Button variant="secondary">
              <Link href="#about">About</Link>
            </Button>
          </ButtonAnimation>
        </div>
      </div>
    </AnimatedSection>
  );
}
