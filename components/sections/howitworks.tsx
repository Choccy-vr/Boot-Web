import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import AnimatedSection from "@/components/animations/section";
import { Terminal, Coins, ShoppingBag } from "lucide-react";

export function HowItWorksSection() {
  const steps = [
    {
      icon: Terminal,
      title: "Build an OS",
      description:
        "Create your own operating system from scratch or base it off an existing one. Configure your bootloader, kernel, and system components.",
    },
    {
      icon: Coins,
      title: "Get Coins",
      description:
        "Earn coins by completing challenges and building features for your operating system.",
    },
    {
      icon: ShoppingBag,
      title: "Spend in Shop",
      description:
        "Use your earned coins to buy Framework laptops, computer components, SSDs, and other hardware.",
    },
  ];

  return (
    <AnimatedSection className="py-16">
      <h2 className="text-primary text-2xl">How It Works</h2>

      <div className="grid gap-6 md:grid-cols-3">
          {steps.map((step, index) => {
            const Icon = step.icon;
            return (
              <Card key={index} className="relative overflow-hidden">
                <CardHeader>
                  <div className="mb-4 flex h-16 w-16 items-center justify-center rounded-lg bg-primary/10">
                    <Icon className="h-8 w-8 text-primary" />
                  </div>
                  <CardTitle className="text-xl text-foreground">{step.title}</CardTitle>
                </CardHeader>
                <CardContent>
                  <p className="text-foreground text-sm">
                    {step.description}
                  </p>
                </CardContent>
              </Card>
            );
          })}
        </div>
      </AnimatedSection>
    );
  }
