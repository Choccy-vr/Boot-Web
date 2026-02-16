import AnimatedSection from "@/components/animations/section";
import BootLog from "@/components/animations/boot-log";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { ArrowRight, Terminal, Coins, ShoppingBag, Code2, Cpu, HardDrive } from "lucide-react";
import ButtonAnimation from "@/components/buttons/animation";
import Image from "next/image";
import Link from "next/link";

export default function Variation3() {
  return (
    <div className="flex flex-col">
      {/* Hero Section - Minimal & Bold */}
      <AnimatedSection className="relative min-h-screen w-screen ml-[calc(-50vw+50%)] -mt-4 flex items-center justify-center px-4 overflow-hidden">
        <BootLog className="absolute inset-0 w-full h-full opacity-20" />
        <div className="relative z-10 max-w-6xl w-full flex flex-col items-start space-y-8">
          <div className="space-y-4">
            <h1 className="text-primary text-8xl md:text-9xl font-black tracking-tighter">
              ./boot
            </h1>
            <div className="h-2 w-32 bg-primary" />
          </div>
          <div className="max-w-3xl space-y-6">
            <p className="text-4xl md:text-5xl font-bold text-foreground leading-tight">
              Build an operating system.<br />Get hardware to run it.
            </p>
            <div className="flex flex-wrap gap-4 text-lg font-mono text-muted-foreground">
              <span className="bg-muted px-4 py-2 rounded">01/31/26 → 03/03/26</span>
              <span className="bg-muted px-4 py-2 rounded">Ages 13-18</span>
              <span className="bg-muted px-4 py-2 rounded">Free to join</span>
            </div>
          </div>
          <div className="flex flex-col sm:flex-row gap-4 pt-4 w-full max-w-2xl">
            <input
              type="email"
              placeholder="Enter your email"
              className="flex-1 rounded-none border-2 border-foreground bg-background px-6 py-4 text-lg outline-none focus:border-primary transition-colors placeholder:text-muted-foreground font-mono"
            />
            <ButtonAnimation>
              <Button size="lg" className="cursor-pointer rounded-none text-lg px-10 py-6 font-bold">
                START BUILDING
              </Button>
            </ButtonAnimation>
          </div>
        </div>
      </AnimatedSection>

      {/* Stats Section */}
      <AnimatedSection className="py-20 bg-foreground text-background">
        <div className="max-w-7xl mx-auto px-4 grid grid-cols-1 md:grid-cols-3 gap-12 text-center">
          <div>
            <div className="text-6xl font-black mb-4 text-primary">∞</div>
            <p className="text-xl font-semibold">Possibilities</p>
          </div>
          <div>
            <div className="text-6xl font-black mb-4 text-primary">$$$</div>
            <p className="text-xl font-semibold">Real Hardware Rewards</p>
          </div>
          <div>
            <div className="text-6xl font-black mb-4 text-primary">5wks</div>
            <p className="text-xl font-semibold">To Build & Ship</p>
          </div>
        </div>
      </AnimatedSection>

      {/* How It Works - Bold Grid */}
      <AnimatedSection className="py-24 bg-background">
        <div className="max-w-7xl mx-auto px-4">
          <h2 className="text-6xl font-black mb-16 tracking-tight">
            <span className="text-foreground">HOW IT</span>{" "}
            <span className="text-primary">WORKS</span>
          </h2>
          <div className="grid md:grid-cols-3 gap-8">
            <div className="group">
              <div className="bg-primary/10 p-8 aspect-square flex items-center justify-center mb-6 group-hover:bg-primary transition-colors">
                <Code2 className="h-24 w-24 text-primary group-hover:text-primary-foreground transition-colors" />
              </div>
              <div className="text-6xl font-black text-primary mb-4">01</div>
              <h3 className="text-2xl font-bold mb-3">BUILD</h3>
              <p className="text-muted-foreground text-lg">
                Create your own operating system from scratch or customize an existing one.
              </p>
            </div>
            <div className="group">
              <div className="bg-primary/10 p-8 aspect-square flex items-center justify-center mb-6 group-hover:bg-primary transition-colors">
                <Coins className="h-24 w-24 text-primary group-hover:text-primary-foreground transition-colors" />
              </div>
              <div className="text-6xl font-black text-primary mb-4">02</div>
              <h3 className="text-2xl font-bold mb-3">EARN</h3>
              <p className="text-muted-foreground text-lg">
                Complete challenges and ship features to earn coins for the shop.
              </p>
            </div>
            <div className="group">
              <div className="bg-primary/10 p-8 aspect-square flex items-center justify-center mb-6 group-hover:bg-primary transition-colors">
                <HardDrive className="h-24 w-24 text-primary group-hover:text-primary-foreground transition-colors" />
              </div>
              <div className="text-6xl font-black text-primary mb-4">03</div>
              <h3 className="text-2xl font-bold mb-3">CLAIM</h3>
              <p className="text-muted-foreground text-lg">
                Exchange coins for Framework laptops, SSDs, and other hardware.
              </p>
            </div>
          </div>
        </div>
      </AnimatedSection>

      {/* What Counts - Full Width Blocks */}
      <AnimatedSection className="py-24 bg-muted/50">
        <div className="max-w-7xl mx-auto px-4">
          <h2 className="text-6xl font-black mb-16 tracking-tight">
            <span className="text-foreground">WHAT</span>{" "}
            <span className="text-primary">COUNTS?</span>
          </h2>
          <div className="space-y-8">
            <div className="bg-card border-l-8 border-primary p-10">
              <div className="flex items-start justify-between gap-8">
                <div className="flex-1">
                  <h3 className="text-4xl font-black mb-4">FROM SCRATCH</h3>
                  <p className="text-xl text-muted-foreground">
                    Build your OS from the ground up, not based on any other OS. You may still use libraries and frameworks, but the core architecture is entirely yours.
                  </p>
                </div>
                <div className="text-8xl font-black text-primary/10">A</div>
              </div>
            </div>
            <div className="bg-card border-l-8 border-primary p-10">
              <div className="flex items-start justify-between gap-8">
                <div className="flex-1">
                  <h3 className="text-4xl font-black mb-4">CUSTOMIZE EXISTING</h3>
                  <p className="text-xl text-muted-foreground">
                    Take an existing OS like Debian, Arch, RPi OS, or Ubuntu and make it completely your own with custom features and modifications.
                  </p>
                </div>
                <div className="text-8xl font-black text-primary/10">B</div>
              </div>
            </div>
          </div>
        </div>
      </AnimatedSection>

      {/* FAQs - Two Column */}
      <AnimatedSection className="py-24 bg-background">
        <div className="max-w-7xl mx-auto px-4">
          <h2 className="text-6xl font-black mb-16 tracking-tight">
            <span className="text-foreground">FREQUENTLY</span>{" "}
            <span className="text-primary">ASKED</span>
          </h2>
          <div className="grid md:grid-cols-2 gap-x-16 gap-y-12">
            <div>
              <h3 className="font-black text-2xl mb-4 text-primary">Who can participate?</h3>
              <p className="text-lg text-muted-foreground">
                Any teenager 13-18 can participate in Boot. No prior experience with OS development is required!
              </p>
            </div>
            <div>
              <h3 className="font-black text-2xl mb-4 text-primary">Don&apos;t know how to make an OS?</h3>
              <p className="text-lg text-muted-foreground">
                No problem! We&apos;ll provide you with all the necessary resources and support to help you get started.
              </p>
            </div>
            <div>
              <h3 className="font-black text-2xl mb-4 text-primary">Can I make multiple OSes?</h3>
              <p className="text-lg text-muted-foreground">
                Yes, but we highly encourage you to just make one and make it the best you can!
              </p>
            </div>
            <div>
              <h3 className="font-black text-2xl mb-4 text-primary">What is Hack Club?</h3>
              <p className="text-lg text-muted-foreground">
                Fill me in, please!
              </p>
            </div>
          </div>
        </div>
      </AnimatedSection>

      {/* CTA Section */}
      <AnimatedSection className="py-32 bg-primary text-primary-foreground">
        <div className="max-w-4xl mx-auto px-4 text-center space-y-8">
          <h2 className="text-6xl md:text-7xl font-black">READY TO BUILD?</h2>
          <p className="text-2xl opacity-90">Join hundreds of teen developers building the future</p>
          <ButtonAnimation>
            <Button 
              size="lg" 
              variant="secondary"
              className="cursor-pointer rounded-none text-xl px-12 py-8 font-bold"
            >
              GET STARTED NOW
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
