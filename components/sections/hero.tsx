import AnimatedSection from "@/components/animations/section";
import { Button } from "@/components/ui/button";
import ButtonAnimation from "../buttons/animation";

export default function HeroSection() {
  return (
    <AnimatedSection>
      <div className="min-h-96 flex flex-col justify-center space-y-4 items-start">
        <h1 className="text-primary text-6xl font-bold">./boot</h1>
        <p className="font-bold text-2xl text-muted-foreground">
          Build an OS, get hardware to run it
        </p>
        <div className="flex flex-row gap-2">
          <input
            type="email"
            placeholder="Enter your email"
            className="rounded-md border bg-background px-4 py-2 text-sm outline-none focus:ring-2 focus:ring-primary placeholder:text-muted-foreground h-10"
          />
          <ButtonAnimation>
            <Button size="lg" className="cursor-pointer">Get Started</Button>
          </ButtonAnimation>
        </div>
      </div>
    </AnimatedSection>
  );
}
