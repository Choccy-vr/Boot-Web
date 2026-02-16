import AnimatedSection from "@/components/animations/section";
import { Button } from "@/components/ui/button";

export default function HeroSection() {
  return (
    <AnimatedSection>
      <div className="min-h-96 flex flex-col justify-center space-y-4 items-start">
        <h1 className="text-primary text-6xl font-bold">./boot</h1>
        <p className="text-xl text-muted-foreground">
          build an os, get hardware to run it
        </p>
        <div className="flex flex-row gap-2">
          <input
            type="email"
            placeholder="enter your email"
            className="rounded-md border bg-background px-4 py-2 text-sm outline-none focus:ring-2 focus:ring-primary"
          />
          <Button>get started</Button>
        </div>
      </div>
    </AnimatedSection>
  );
}
