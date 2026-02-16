import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import Link from "next/link";
import { ArrowRight, Layout, Layers, Zap, Sparkles } from "lucide-react";

export default function VariationsPage() {
  const variations = [
    {
      number: 1,
      title: "Centered & Modern",
      description: "A centered hero layout with gradient accents, large typography, and hover effects on cards. Features a clean, contemporary design with generous spacing.",
      icon: Layout,
      path: "/variation1",
      highlights: ["Centered hero section", "Gradient backgrounds", "Hover animations", "Modern card design"]
    },
    {
      number: 2,
      title: "Split Timeline",
      description: "Split layout hero with feature highlights. Timeline-style 'How It Works' section with alternating cards. Emphasizes the journey and progression.",
      icon: Layers,
      path: "/variation2",
      highlights: ["Split hero layout", "Timeline design", "Feature badges", "Progressive flow"]
    },
    {
      number: 3,
      title: "Bold & Minimal",
      description: "Ultra-bold typography with sharp edges and high contrast. Minimalist design language with strong visual hierarchy and geometric shapes.",
      icon: Zap,
      path: "/variation3",
      highlights: ["Bold typography", "Sharp aesthetics", "High contrast", "Geometric design"]
    },
    {
      number: 4,
      title: "Gradient & Soft",
      description: "Soft gradients throughout with modern glassmorphism effects. Rounded corners, smooth transitions, and a polished, premium feel.",
      icon: Sparkles,
      path: "/variation4",
      highlights: ["Soft gradients", "Glassmorphism", "Rounded elements", "Premium feel"]
    }
  ];

  return (
    <div className="min-h-screen py-20 px-4">
      <div className="max-w-7xl mx-auto">
        {/* Header */}
        <div className="text-center mb-16 space-y-6">
          <h1 className="text-5xl md:text-6xl font-extrabold text-primary">
            Homepage Variations
          </h1>
          <p className="text-xl text-muted-foreground max-w-2xl mx-auto">
            Explore 4 different design approaches for the Boot homepage. Each variation maintains the same content with unique layouts and styling.
          </p>
          <div className="pt-4">
            <Link href="/">
              <Button variant="outline" size="lg" className="gap-2">
                <ArrowRight className="rotate-180 h-4 w-4" />
                Back to Original
              </Button>
            </Link>
          </div>
        </div>

        {/* Variations Grid */}
        <div className="grid md:grid-cols-2 gap-8 mb-12">
          {variations.map((variant) => {
            const Icon = variant.icon;
            return (
              <Card 
                key={variant.number} 
                className="group hover:shadow-2xl transition-all duration-300 border-2 hover:border-primary overflow-hidden"
              >
                <CardHeader>
                  <div className="flex items-start justify-between mb-4">
                    <div className="flex items-center gap-4">
                      <div className="h-16 w-16 rounded-xl bg-primary/10 flex items-center justify-center group-hover:bg-primary group-hover:text-primary-foreground transition-colors">
                        <Icon className="h-8 w-8 text-primary group-hover:text-primary-foreground" />
                      </div>
                      <div>
                        <div className="text-sm font-semibold text-primary mb-1">
                          VARIATION {variant.number}
                        </div>
                        <CardTitle className="text-2xl">{variant.title}</CardTitle>
                      </div>
                    </div>
                  </div>
                  <CardDescription className="text-base leading-relaxed">
                    {variant.description}
                  </CardDescription>
                </CardHeader>
                <CardContent>
                  <div className="space-y-4">
                    <div>
                      <h4 className="font-semibold text-sm mb-3 text-muted-foreground">Key Features:</h4>
                      <ul className="grid grid-cols-2 gap-2">
                        {variant.highlights.map((highlight, idx) => (
                          <li key={idx} className="flex items-center gap-2 text-sm">
                            <div className="h-1.5 w-1.5 rounded-full bg-primary" />
                            <span>{highlight}</span>
                          </li>
                        ))}
                      </ul>
                    </div>
                    <Link href={variant.path} className="block">
                      <Button className="w-full gap-2 group-hover:shadow-lg transition-shadow">
                        View Variation {variant.number}
                        <ArrowRight className="h-4 w-4 group-hover:translate-x-1 transition-transform" />
                      </Button>
                    </Link>
                  </div>
                </CardContent>
              </Card>
            );
          })}
        </div>

        {/* Comparison Notes */}
        <Card className="border-2 bg-muted/20">
          <CardHeader>
            <CardTitle className="text-2xl">Design Philosophy</CardTitle>
          </CardHeader>
          <CardContent className="space-y-4 text-muted-foreground">
            <p>
              Each variation presents a unique approach to the same content, demonstrating how design choices can dramatically change the user experience:
            </p>
            <ul className="space-y-3 pl-6">
              <li className="flex items-start gap-3">
                <span className="text-primary font-bold mt-1">1.</span>
                <span><strong>Variation 1</strong> focuses on balance and modern aesthetics with centered content and subtle gradients.</span>
              </li>
              <li className="flex items-start gap-3">
                <span className="text-primary font-bold mt-1">2.</span>
                <span><strong>Variation 2</strong> emphasizes storytelling through split layouts and timeline progression.</span>
              </li>
              <li className="flex items-start gap-3">
                <span className="text-primary font-bold mt-1">3.</span>
                <span><strong>Variation 3</strong> takes a bold, editorial approach with striking typography and high contrast.</span>
              </li>
              <li className="flex items-start gap-3">
                <span className="text-primary font-bold mt-1">4.</span>
                <span><strong>Variation 4</strong> offers a polished, premium experience with soft gradients and smooth transitions.</span>
              </li>
            </ul>
            <p className="pt-4 text-sm italic">
              Note: All variations use the same core components and maintain the original functionality. The differences are purely aesthetic and structural.
            </p>
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
