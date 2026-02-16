import AnimatedSection from "@/components/animations/section";
import BootLog from "@/components/animations/boot-log";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { ArrowRight, Terminal, Coins, ShoppingBag, Lightbulb } from "lucide-react";
import ButtonAnimation from "@/components/buttons/animation";
import Image from "next/image";
import Link from "next/link";

export default function Variation1() {
  return (
    <div className="flex flex-col gap-16">
      {/* Hero Section - Centered Layout */}
      <AnimatedSection className="relative min-h-screen w-screen ml-[calc(-50vw+50%)] -mt-4 flex items-center justify-center px-4 overflow-hidden">
        <BootLog className="absolute inset-0 w-full h-full" />
        <div className="relative z-10 max-w-5xl w-full flex flex-col items-center text-center space-y-6">
          <h1 className="text-primary text-7xl md:text-8xl font-bold">./boot</h1>
          <p className="font-bold text-3xl md:text-4xl text-foreground max-w-3xl">
            Build an OS, get hardware to run it
          </p>
          <div className="flex flex-wrap gap-x-4 gap-y-2 text-lg text-muted-foreground justify-center">
            <span>01/31/26 <ArrowRight className="inline h-4 w-4" /> 03/03/26</span>
            <span>|</span>
            <span>Ages 13-18</span>
          </div>
          <div className="flex flex-col sm:flex-row gap-3 w-full max-w-md">
            <input
              type="email"
              placeholder="Enter your email"
              className="flex-1 rounded-md border bg-card px-5 py-3 text-base outline-none focus:ring-2 focus:ring-primary placeholder:text-muted-foreground"
            />
            <ButtonAnimation>
              <Button size="lg" className="cursor-pointer whitespace-nowrap px-8">
                Get Started
              </Button>
            </ButtonAnimation>
          </div>
        </div>
      </AnimatedSection>

      {/* How It Works - Horizontal Cards */}
      <AnimatedSection className="py-20 bg-muted/20">
        <div className="max-w-7xl mx-auto px-4">
          <h2 className="text-primary text-4xl font-bold text-center mb-12">How It Works</h2>
          <div className="grid gap-8 md:grid-cols-3">
            <Card className="border-2 hover:border-primary transition-all duration-300">
              <CardHeader>
                <div className="mb-4 flex h-20 w-20 items-center justify-center rounded-xl bg-primary/10 mx-auto">
                  <Terminal className="h-10 w-10 text-primary" />
                </div>
                <CardTitle className="text-2xl text-center">Build an OS</CardTitle>
              </CardHeader>
              <CardContent>
                <p className="text-muted-foreground text-center">
                  Create your own operating system from scratch or base it off an existing one.
                </p>
              </CardContent>
            </Card>
            <Card className="border-2 hover:border-primary transition-all duration-300">
              <CardHeader>
                <div className="mb-4 flex h-20 w-20 items-center justify-center rounded-xl bg-primary/10 mx-auto">
                  <Coins className="h-10 w-10 text-primary" />
                </div>
                <CardTitle className="text-2xl text-center">Get Coins</CardTitle>
              </CardHeader>
              <CardContent>
                <p className="text-muted-foreground text-center">
                  Earn coins by completing challenges and building features for your OS.
                </p>
              </CardContent>
            </Card>
            <Card className="border-2 hover:border-primary transition-all duration-300">
              <CardHeader>
                <div className="mb-4 flex h-20 w-20 items-center justify-center rounded-xl bg-primary/10 mx-auto">
                  <ShoppingBag className="h-10 w-10 text-primary" />
                </div>
                <CardTitle className="text-2xl text-center">Spend in Shop</CardTitle>
              </CardHeader>
              <CardContent>
                <p className="text-muted-foreground text-center">
                  Use your coins to buy Framework laptops, SSDs, and other hardware.
                </p>
              </CardContent>
            </Card>
          </div>
        </div>
      </AnimatedSection>

      {/* What Counts - Side by Side */}
      <AnimatedSection className="py-16">
        <h2 className="text-primary text-4xl font-bold text-center mb-12">What Counts as an OS?</h2>
        <div className="grid md:grid-cols-2 gap-8 max-w-5xl mx-auto">
          <div className="bg-gradient-to-br from-primary/5 to-primary/10 p-8 border-2 border-primary/20 rounded-2xl shadow-lg hover:shadow-xl transition-shadow">
            <h3 className="text-2xl font-bold mb-4">From Scratch</h3>
            <p className="text-muted-foreground">
              Build your OS from the ground up, not based on any other OS (May still use other libraries, etc)
            </p>
          </div>
          <div className="bg-gradient-to-br from-primary/5 to-primary/10 p-8 border-2 border-primary/20 rounded-2xl shadow-lg hover:shadow-xl transition-shadow">
            <h3 className="text-2xl font-bold mb-4">Base it off</h3>
            <p className="text-muted-foreground">
              Make an OS based off an existing OS (Debian, Arch, RPi OS, Ubuntu, etc) and make it your own!
            </p>
          </div>
        </div>
      </AnimatedSection>

      {/* FAQs - Compact Grid */}
      <AnimatedSection className="py-16 bg-muted/20">
        <div className="max-w-6xl mx-auto">
          <h2 className="text-primary text-4xl font-bold text-center mb-12">FAQ</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            <div className="bg-card p-6 rounded-xl border">
              <h3 className="font-bold text-xl mb-3">Who can participate?</h3>
              <p className="text-muted-foreground">
                Any teenager 13-18 can participate in Boot. No prior experience with OS development is required!
              </p>
            </div>
            <div className="bg-card p-6 rounded-xl border">
              <h3 className="font-bold text-xl mb-3">Don&apos;t know how to make an OS?</h3>
              <p className="text-muted-foreground">
                No problem! We&apos;ll provide you with all the necessary resources and support to help you get started.
              </p>
            </div>
            <div className="bg-card p-6 rounded-xl border">
              <h3 className="font-bold text-xl mb-3">Can I make multiple OSes?</h3>
              <p className="text-muted-foreground">
                Yes, but we highly encourage you to just make one and make it the best you can!
              </p>
            </div>
            <div className="bg-card p-6 rounded-xl border">
              <h3 className="font-bold text-xl mb-3">What is Hack Club?</h3>
              <p className="text-muted-foreground">
                Fill me in, please!
              </p>
            </div>
          </div>
        </div>
      </AnimatedSection>

      <Link href="https://hackclub.com" target="_blank">
        <Image
          src="/flag-orpheus-left.svg"
          alt="Hack Club"
          width={280}
          height={158}
          className="fixed bottom-4 left-0 z-50 w-40 -translate-x-2 -rotate-3 hover:translate-x-0 hover:rotate-0 duration-200"
        />
      </Link>
    </div>
  );
}
