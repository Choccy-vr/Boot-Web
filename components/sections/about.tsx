import AnimatedSection from "@/components/animations/section";
import { Card, CardContent } from "@/components/ui/card";
import { Trophy } from "lucide-react";

export default function AboutSection() {
  return (
    <AnimatedSection id="about" className="py-16">
      <h2 className="text-primary text-2xl">About Boot</h2>
      <Card>
        <CardContent className="space-y-4">
          <p>
            Boot is a YSWS (You Ship We Ship) where teens from around the world
            come together to build their own operating systems — from the ground
            up or from something already great.
          </p>
          <p>
            Whether you&apos;re going completely custom with LFS or Buildroot,
            or remixing a distro like Ubuntu into something entirely your own,
            the choice is yours.
          </p>
        </CardContent>
      </Card>
    </AnimatedSection>
  );
}
