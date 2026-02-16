import AnimatedSection from "@/components/animations/section";
import BootLog from "@/components/animations/boot-log";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { ArrowRight, Terminal, Coins, ShoppingBag, Sparkles, Zap, Award } from "lucide-react";
import ButtonAnimation from "@/components/buttons/animation";
import Image from "next/image";
import Link from "next/link";

export default function Variation4() {
  return (
    <div className="flex flex-col gap-0">
      {/* Hero Section - Gradient & Modern */}
      <AnimatedSection className="relative min-h-screen w-screen ml-[calc(-50vw+50%)] -mt-4 flex items-center justify-center px-4 overflow-hidden bg-gradient-to-br from-background via-primary/5 to-background">
        <BootLog className="absolute inset-0 w-full h-full opacity-10" />
        <div className="absolute inset-0 bg-[radial-gradient(circle_at_50%_50%,rgba(var(--primary-rgb),0.1),transparent_50%)]" />
        <div className="relative z-10 max-w-5xl w-full text-center space-y-8">
          <div className="inline-flex items-center gap-2 bg-primary/10 text-primary px-5 py-2 rounded-full text-sm font-semibold border border-primary/20">
            <Sparkles className="h-4 w-4" />
            Limited Event: Jan 31 - Mar 3, 2026
          </div>
          <div className="space-y-4">
            <h1 className="text-primary text-7xl md:text-8xl font-extrabold tracking-tight">
              ./boot
            </h1>
            <div className="h-1 w-24 bg-gradient-to-r from-transparent via-primary to-transparent mx-auto" />
          </div>
          <p className="text-3xl md:text-4xl font-bold text-foreground max-w-3xl mx-auto leading-snug">
            Build your own operating system and earn real hardware
          </p>
          <p className="text-xl text-muted-foreground max-w-2xl mx-auto">
            A free 5-week program for teen developers aged 13-18. No experience required.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center items-center pt-6 max-w-xl mx-auto">
            <input
              type="email"
              placeholder="your.email@example.com"
              className="w-full sm:flex-1 rounded-full border-2 bg-background/50 backdrop-blur px-6 py-4 text-base outline-none focus:border-primary transition-all placeholder:text-muted-foreground shadow-lg"
            />
            <ButtonAnimation>
              <Button size="lg" className="cursor-pointer rounded-full px-8 py-6 text-lg font-semibold shadow-lg hover:shadow-xl transition-shadow">
                <Zap className="h-5 w-5" />
                Join Now
              </Button>
            </ButtonAnimation>
          </div>
          <div className="flex flex-wrap justify-center gap-8 pt-8 text-sm text-muted-foreground">
            <div className="flex items-center gap-2">
              <Award className="h-4 w-4 text-primary" />
              <span>100% Free</span>
            </div>
            <div className="flex items-center gap-2">
              <Award className="h-4 w-4 text-primary" />
              <span>Real Rewards</span>
            </div>
            <div className="flex items-center gap-2">
              <Award className="h-4 w-4 text-primary" />
              <span>Global Community</span>
            </div>
          </div>
        </div>
      </AnimatedSection>

      {/* How It Works - Card Carousel Style */}
      <AnimatedSection className="py-28 bg-gradient-to-b from-muted/20 to-background">
        <div className="max-w-7xl mx-auto px-4">
          <div className="text-center mb-16 space-y-4">
            <h2 className="text-5xl md:text-6xl font-extrabold bg-gradient-to-r from-primary to-primary/60 bg-clip-text text-transparent">
              How It Works
            </h2>
            <p className="text-xl text-muted-foreground">Three simple steps to success</p>
          </div>
          <div className="grid gap-8 md:grid-cols-3">
            <Card className="relative overflow-hidden border-2 hover:border-primary transition-all hover:shadow-2xl hover:-translate-y-2 duration-300 bg-gradient-to-br from-card to-card/50">
              <div className="absolute top-0 right-0 w-32 h-32 bg-primary/5 rounded-full -translate-y-16 translate-x-16" />
              <CardHeader>
                <div className="mb-6 flex h-20 w-20 items-center justify-center rounded-2xl bg-gradient-to-br from-primary to-primary/70 shadow-lg">
                  <Terminal className="h-10 w-10 text-primary-foreground" />
                </div>
                <div className="text-sm font-bold text-primary mb-2">STEP 01</div>
                <CardTitle className="text-2xl">Build Your OS</CardTitle>
              </CardHeader>
              <CardContent>
                <p className="text-muted-foreground leading-relaxed">
                  Create from scratch or customize existing systems like Debian, Arch, or Ubuntu. We&apos;ll guide you every step of the way.
                </p>
              </CardContent>
            </Card>

            <Card className="relative overflow-hidden border-2 hover:border-primary transition-all hover:shadow-2xl hover:-translate-y-2 duration-300 bg-gradient-to-br from-card to-card/50">
              <div className="absolute top-0 right-0 w-32 h-32 bg-primary/5 rounded-full -translate-y-16 translate-x-16" />
              <CardHeader>
                <div className="mb-6 flex h-20 w-20 items-center justify-center rounded-2xl bg-gradient-to-br from-primary to-primary/70 shadow-lg">
                  <Coins className="h-10 w-10 text-primary-foreground" />
                </div>
                <div className="text-sm font-bold text-primary mb-2">STEP 02</div>
                <CardTitle className="text-2xl">Earn Coins</CardTitle>
              </CardHeader>
              <CardContent>
                <p className="text-muted-foreground leading-relaxed">
                  Complete challenges, implement features, and ship updates. Every milestone brings you closer to hardware rewards.
                </p>
              </CardContent>
            </Card>

            <Card className="relative overflow-hidden border-2 hover:border-primary transition-all hover:shadow-2xl hover:-translate-y-2 duration-300 bg-gradient-to-br from-card to-card/50">
              <div className="absolute top-0 right-0 w-32 h-32 bg-primary/5 rounded-full -translate-y-16 translate-x-16" />
              <CardHeader>
                <div className="mb-6 flex h-20 w-20 items-center justify-center rounded-2xl bg-gradient-to-br from-primary to-primary/70 shadow-lg">
                  <ShoppingBag className="h-10 w-10 text-primary-foreground" />
                </div>
                <div className="text-sm font-bold text-primary mb-2">STEP 03</div>
                <CardTitle className="text-2xl">Get Hardware</CardTitle>
              </CardHeader>
              <CardContent>
                <p className="text-muted-foreground leading-relaxed">
                  Trade your coins for Framework laptops, SSDs, components, and more. Real rewards for real work.
                </p>
              </CardContent>
            </Card>
          </div>
        </div>
      </AnimatedSection>

      {/* What Counts - Colored Sections */}
      <AnimatedSection className="py-28 bg-background">
        <div className="max-w-6xl mx-auto px-4">
          <div className="text-center mb-16 space-y-4">
            <h2 className="text-5xl md:text-6xl font-extrabold bg-gradient-to-r from-primary to-primary/60 bg-clip-text text-transparent">
              What Counts as an OS?
            </h2>
            <p className="text-xl text-muted-foreground">Choose your path</p>
          </div>
          <div className="grid md:grid-cols-2 gap-10">
            <div className="relative p-10 bg-gradient-to-br from-primary/10 via-primary/5 to-transparent border-2 border-primary/20 rounded-3xl shadow-xl hover:shadow-2xl transition-all group">
              <div className="absolute -top-4 -left-4 bg-primary text-primary-foreground w-12 h-12 rounded-full flex items-center justify-center text-xl font-bold shadow-lg">
                1
              </div>
              <h3 className="text-3xl font-bold mb-5 mt-2 group-hover:text-primary transition-colors">
                From Scratch
              </h3>
              <p className="text-lg text-muted-foreground leading-relaxed">
                Build your operating system from the ground up. You may use libraries and tools, but the core architecture and design are entirely yours to create.
              </p>
            </div>
            <div className="relative p-10 bg-gradient-to-br from-primary/10 via-primary/5 to-transparent border-2 border-primary/20 rounded-3xl shadow-xl hover:shadow-2xl transition-all group">
              <div className="absolute -top-4 -left-4 bg-primary text-primary-foreground w-12 h-12 rounded-full flex items-center justify-center text-xl font-bold shadow-lg">
                2
              </div>
              <h3 className="text-3xl font-bold mb-5 mt-2 group-hover:text-primary transition-colors">
                Customize Existing
              </h3>
              <p className="text-lg text-muted-foreground leading-relaxed">
                Take an existing OS like Debian, Arch, Raspberry Pi OS, or Ubuntu and transform it with your own features, interface, and modifications.
              </p>
            </div>
          </div>
        </div>
      </AnimatedSection>

      {/* FAQs - Clean List */}
      <AnimatedSection className="py-28 bg-gradient-to-b from-muted/20 to-background">
        <div className="max-w-4xl mx-auto px-4">
          <div className="text-center mb-16 space-y-4">
            <h2 className="text-5xl md:text-6xl font-extrabold bg-gradient-to-r from-primary to-primary/60 bg-clip-text text-transparent">
              FAQ
            </h2>
            <p className="text-xl text-muted-foreground">Everything you need to know</p>
          </div>
          <div className="space-y-6">
            <div className="bg-card/50 backdrop-blur p-8 rounded-2xl border-2 border-transparent hover:border-primary/30 transition-all">
              <h3 className="font-bold text-xl mb-3 flex items-center gap-3">
                <span className="text-primary">Q:</span>
                <span>Who can participate?</span>
              </h3>
              <p className="text-muted-foreground pl-8">
                Any teenager aged 13-18 can participate in Boot. No prior experience with OS development is required!
              </p>
            </div>
            <div className="bg-card/50 backdrop-blur p-8 rounded-2xl border-2 border-transparent hover:border-primary/30 transition-all">
              <h3 className="font-bold text-xl mb-3 flex items-center gap-3">
                <span className="text-primary">Q:</span>
                <span>Don&apos;t know how to make an OS?</span>
              </h3>
              <p className="text-muted-foreground pl-8">
                No problem! We&apos;ll provide you with all the necessary resources and support to help you get started.
              </p>
            </div>
            <div className="bg-card/50 backdrop-blur p-8 rounded-2xl border-2 border-transparent hover:border-primary/30 transition-all">
              <h3 className="font-bold text-xl mb-3 flex items-center gap-3">
                <span className="text-primary">Q:</span>
                <span>Can I make multiple OSes?</span>
              </h3>
              <p className="text-muted-foreground pl-8">
                Yes, but we highly encourage you to just make one and make it the best you can!
              </p>
            </div>
            <div className="bg-card/50 backdrop-blur p-8 rounded-2xl border-2 border-transparent hover:border-primary/30 transition-all">
              <h3 className="font-bold text-xl mb-3 flex items-center gap-3">
                <span className="text-primary">Q:</span>
                <span>What is Hack Club?</span>
              </h3>
              <p className="text-muted-foreground pl-8">
                Fill me in, please!
              </p>
            </div>
          </div>
        </div>
      </AnimatedSection>

      {/* Final CTA */}
      <AnimatedSection className="py-24 bg-gradient-to-br from-primary/5 via-transparent to-primary/5">
        <div className="max-w-3xl mx-auto px-4 text-center space-y-6">
          <h2 className="text-4xl md:text-5xl font-bold">Ready to start building?</h2>
          <p className="text-xl text-muted-foreground">Join the community of teen OS developers today</p>
          <ButtonAnimation>
            <Button size="lg" className="cursor-pointer rounded-full px-10 py-7 text-lg font-semibold shadow-xl hover:shadow-2xl transition-shadow">
              <Sparkles className="h-5 w-5" />
              Get Started Free
            </Button>
          </ButtonAnimation>
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
