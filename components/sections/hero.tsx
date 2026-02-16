import AnimatedSection from "@/components/animations/section";
import { Button } from "@/components/ui/button";
import { ArrowRight, Dot, Rocket } from "lucide-react";
import ButtonAnimation from "../buttons/animation";

export default function HeroSection() {
  return (
    <AnimatedSection className="min-h-screen w-screen ml-[calc(-50vw+50%)] -mt-4 flex items-center justify-center px-4">
      <div className="max-w-4xl w-full flex flex-col justify-center space-y-4 items-start">
        <h1 className="text-primary text-6xl font-bold">./boot</h1>
        <p className="font-bold text-2xl text-muted-foreground">
          Build an OS, get hardware to run it
        </p>
        <div className="flex flex-wrap gap-x-2 gap-y-1 text-sm text-muted-foreground">
          <span>
            01/31/26{" "}<ArrowRight className="inline h-3 w-3" />{" "}03/03/26
          </span>
          |
          <span>Ages 13-18</span>
        </div>
        <div className="flex flex-row gap-2">
          <input
            type="email"
            placeholder="Enter your email"
            className="rounded-md border bg-card px-4 py-2 text-sm outline-none focus:ring-2 focus:ring-primary placeholder:text-muted-foreground h-10"
          />
          <ButtonAnimation>
            <Button size="lg" className="cursor-pointer">
              <Rocket /> Get Started
            </Button>
          </ButtonAnimation>
        </div>
      </div>
    </AnimatedSection>
  );
}
