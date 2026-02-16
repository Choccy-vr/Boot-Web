import AnimatedSection from "@/components/animations/section";
import BootLog from "@/components/animations/boot-log";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { ArrowRight, Terminal, Coins, ShoppingBag, CheckCircle } from "lucide-react";
import ButtonAnimation from "@/components/buttons/animation";
import Image from "next/image";
import Link from "next/link";

export default function Variation2() {
  return (
    <div className="flex flex-col">
      {/* Hero Section - Split Layout */}
      <AnimatedSection className="relative min-h-screen w-screen ml-[calc(-50vw+50%)] -mt-4 flex items-center px-4 overflow-hidden">
        <BootLog className="absolute inset-0 w-full h-full opacity-30" />
        <div className="relative z-10 max-w-7xl w-full mx-auto grid md:grid-cols-2 gap-12 items-center">
          <div className="space-y-6">
            <div className="inline-block bg-primary/10 text-primary px-4 py-2 rounded-full text-sm font-semibold">
              Limited Time Event
            </div>
            <h1 className="text-primary text-6xl md:text-7xl font-bold leading-tight">
              ./boot
            </h1>
            <p className="text-2xl md:text-3xl font-semibold text-foreground">
              Build an operating system. Earn real hardware.
            </p>
            <div className="flex items-center gap-3 text-muted-foreground">
              <span className="text-base">01/31/26 <ArrowRight className="inline h-4 w-4" /> 03/03/26</span>
              <span>•</span>
              <span className="text-base">For ages 13-18</span>
            </div>
            <div className="pt-4 space-y-3">
              <input
                type="email"
                placeholder="your@email.com"
                className="w-full rounded-lg border-2 border-primary/20 bg-card px-5 py-3 text-base outline-none focus:border-primary transition-colors placeholder:text-muted-foreground"
              />
              <ButtonAnimation>
                <Button size="lg" className="w-full cursor-pointer text-lg py-6">
                  Join Boot Now
                </Button>
              </ButtonAnimation>
            </div>
          </div>
          <div className="hidden md:flex flex-col gap-4">
            <div className="bg-card/80 backdrop-blur p-6 rounded-xl border-2 border-primary/20">
              <div className="flex items-start gap-4">
                <CheckCircle className="h-6 w-6 text-primary mt-1" />
                <div>
                  <h4 className="font-bold text-lg mb-1">No Experience Required</h4>
                  <p className="text-muted-foreground text-sm">We&apos;ll guide you through everything</p>
                </div>
              </div>
            </div>
            <div className="bg-card/80 backdrop-blur p-6 rounded-xl border-2 border-primary/20">
              <div className="flex items-start gap-4">
                <CheckCircle className="h-6 w-6 text-primary mt-1" />
                <div>
                  <h4 className="font-bold text-lg mb-1">Earn Real Hardware</h4>
                  <p className="text-muted-foreground text-sm">Framework laptops, SSDs, and more</p>
                </div>
              </div>
            </div>
            <div className="bg-card/80 backdrop-blur p-6 rounded-xl border-2 border-primary/20">
              <div className="flex items-start gap-4">
                <CheckCircle className="h-6 w-6 text-primary mt-1" />
                <div>
                  <h4 className="font-bold text-lg mb-1">Join a Community</h4>
                  <p className="text-muted-foreground text-sm">Connect with teen developers worldwide</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </AnimatedSection>

      {/* How It Works - Timeline Style */}
      <AnimatedSection className="py-24 bg-background">
        <div className="max-w-6xl mx-auto px-4">
          <h2 className="text-primary text-5xl font-bold mb-4">The Journey</h2>
          <p className="text-xl text-muted-foreground mb-16">Three simple steps to earning hardware</p>
          <div className="relative">
            <div className="absolute left-8 md:left-1/2 top-0 bottom-0 w-1 bg-primary/20 -translate-x-1/2 hidden md:block" />
            <div className="space-y-12">
              <div className="relative grid md:grid-cols-2 gap-8 items-center">
                <Card className="md:text-right border-2">
                  <CardHeader>
                    <CardTitle className="text-3xl flex items-center justify-end gap-3">
                      <span>Build an OS</span>
                      <div className="flex h-16 w-16 items-center justify-center rounded-full bg-primary text-primary-foreground font-bold text-2xl">
                        1
                      </div>
                    </CardTitle>
                  </CardHeader>
                  <CardContent>
                    <p className="text-lg text-muted-foreground">
                      Start from scratch or customize an existing OS. Learn about kernels, bootloaders, and system architecture.
                    </p>
                  </CardContent>
                </Card>
                <div className="hidden md:block" />
              </div>
              
              <div className="relative grid md:grid-cols-2 gap-8 items-center">
                <div className="hidden md:block" />
                <Card className="border-2">
                  <CardHeader>
                    <CardTitle className="text-3xl flex items-center gap-3">
                      <div className="flex h-16 w-16 items-center justify-center rounded-full bg-primary text-primary-foreground font-bold text-2xl">
                        2
                      </div>
                      <span>Earn Coins</span>
                    </CardTitle>
                  </CardHeader>
                  <CardContent>
                    <p className="text-lg text-muted-foreground">
                      Complete challenges and implement features to earn coins. The more you build, the more you earn.
                    </p>
                  </CardContent>
                </Card>
              </div>

              <div className="relative grid md:grid-cols-2 gap-8 items-center">
                <Card className="md:text-right border-2">
                  <CardHeader>
                    <CardTitle className="text-3xl flex items-center justify-end gap-3">
                      <span>Get Hardware</span>
                      <div className="flex h-16 w-16 items-center justify-center rounded-full bg-primary text-primary-foreground font-bold text-2xl">
                        3
                      </div>
                    </CardTitle>
                  </CardHeader>
                  <CardContent>
                    <p className="text-lg text-muted-foreground">
                      Trade your coins for real hardware including Framework laptops, SSDs, and computer components.
                    </p>
                  </CardContent>
                </Card>
                <div className="hidden md:block" />
              </div>
            </div>
          </div>
        </div>
      </AnimatedSection>

      {/* What Counts - Cards with Icons */}
      <AnimatedSection className="py-24 bg-muted/30">
        <div className="max-w-6xl mx-auto px-4">
          <h2 className="text-primary text-5xl font-bold text-center mb-16">What Counts?</h2>
          <div className="grid md:grid-cols-2 gap-12">
            <div className="relative p-10 bg-card border-2 rounded-3xl shadow-xl hover:shadow-2xl transition-shadow">
              <div className="absolute -top-6 left-10 bg-primary text-primary-foreground px-6 py-2 rounded-full font-bold text-lg">
                Option A
              </div>
              <h3 className="text-3xl font-bold mt-4 mb-4">From Scratch</h3>
              <p className="text-lg text-muted-foreground leading-relaxed">
                Build your OS from the ground up, not based on any other OS. You may still use libraries and tools, but the core is yours.
              </p>
            </div>
            <div className="relative p-10 bg-card border-2 rounded-3xl shadow-xl hover:shadow-2xl transition-shadow">
              <div className="absolute -top-6 left-10 bg-primary text-primary-foreground px-6 py-2 rounded-full font-bold text-lg">
                Option B
              </div>
              <h3 className="text-3xl font-bold mt-4 mb-4">Base it Off</h3>
              <p className="text-lg text-muted-foreground leading-relaxed">
                Customize an existing OS (Debian, Arch, RPi OS, Ubuntu) and transform it into something uniquely yours.
              </p>
            </div>
          </div>
        </div>
      </AnimatedSection>

      {/* FAQs - Accordion Style */}
      <AnimatedSection className="py-24 bg-background">
        <div className="max-w-4xl mx-auto px-4">
          <h2 className="text-primary text-5xl font-bold text-center mb-16">Questions?</h2>
          <div className="space-y-6">
            <div className="bg-card p-8 rounded-2xl border-2 hover:border-primary transition-colors">
              <h3 className="font-bold text-2xl mb-3 text-primary">Who can participate?</h3>
              <p className="text-lg text-muted-foreground">
                Any teenager aged 13-18 can participate in Boot. No prior experience with OS development is required!
              </p>
            </div>
            <div className="bg-card p-8 rounded-2xl border-2 hover:border-primary transition-colors">
              <h3 className="font-bold text-2xl mb-3 text-primary">Don&apos;t know how to make an OS?</h3>
              <p className="text-lg text-muted-foreground">
                No problem! We&apos;ll provide you with all the necessary resources and support to help you get started.
              </p>
            </div>
            <div className="bg-card p-8 rounded-2xl border-2 hover:border-primary transition-colors">
              <h3 className="font-bold text-2xl mb-3 text-primary">Can I make multiple OSes?</h3>
              <p className="text-lg text-muted-foreground">
                Yes, but we highly encourage you to just make one and make it the best you can!
              </p>
            </div>
            <div className="bg-card p-8 rounded-2xl border-2 hover:border-primary transition-colors">
              <h3 className="font-bold text-2xl mb-3 text-primary">What is Hack Club?</h3>
              <p className="text-lg text-muted-foreground">
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
