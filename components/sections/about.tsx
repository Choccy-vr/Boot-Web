import AnimatedSection from "@/components/animations/section";
import { Card, CardContent } from "@/components/ui/card";
import { ArrowRight, Trophy } from "lucide-react";

export default function AboutSection() {
  return (
    <AnimatedSection id="about">
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
      <div className="grid md:grid-cols-2 gap-4">
        <Card>
          <CardContent>
            When:{" "}
            <span className="inline-flex items-center gap-2 text-primary">
              TBA <ArrowRight /> 04/01/26
            </span>
          </CardContent>
        </Card>
        <Card>
          <CardContent>
            Platform:{" "}
            <span className="inline-flex items-center gap-2 text-primary">
              Virtual
            </span>
          </CardContent>
        </Card>
        <Card>
          <CardContent>
            Age:{" "}
            <span className="inline-flex items-center gap-2 text-primary">
              13-18 years
            </span>
          </CardContent>
        </Card>
        <Card>
          <CardContent>
            Cost:{" "}
            <span className="inline-flex items-center gap-2 text-primary">
              Free!
            </span>
          </CardContent>
        </Card>
      </div>
    </AnimatedSection>
  );
}
