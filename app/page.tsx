import AnimatedSection from "@/components/animated-section";
import ButtonAnimation from "@/components/button-animation";
import JoinButton from "@/components/join-button";
import TerminalBreadcrumbs from "@/components/terminal-breadcrumbs";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { ArrowRight, Clock, Trophy } from "lucide-react";

export default function Home() {
  return (
    <>
      <TerminalBreadcrumbs breadcrumbs={[{ slug: "/", text: "home" }]} />
      <AnimatedSection>
        <div className="min-h-96 flex flex-col justify-center space-y-4 items-start">
          <Badge>
            <Clock /> Winter 2025
          </Badge>
          <h1 className="text-primary text-6xl">Boot</h1>
          <h3 className="text-xl p-4 bg-primary/25 border rounded">
            Build your OS. Share. Get prizes.
          </h3>
          <div className="flex flex-row gap-4">
            <ButtonAnimation>
              <JoinButton text="Join YSWS" />
            </ButtonAnimation>
            <ButtonAnimation>
              <Button variant="secondary">More Info</Button>
            </ButtonAnimation>
          </div>
        </div>
      </AnimatedSection>
      <AnimatedSection>
        <h2 className="text-primary text-2xl">About Boot</h2>
        <Card>
          <CardContent className="space-y-4">
            <p>
              Boot is a YSWS (You Ship We Ship) where teens from around the
              world come together to build their own operating systems — from
              the ground up or from something already great.
            </p>
            <p>
              Whether you&apos;re going completely custom with LFS or Buildroot,
              or remixing a distro like Ubuntu into something entirely your own,
              the choice is yours.
            </p>
            <div className="p-4 bg-primary/25 rounded flex flex-row gap-4 items-center border shadow-sm">
              <Trophy className="text-primary" />
              <p>
                Throughout the event, participants will make, test, and vote on
                each other&apos;s OSes. Sweet prizes await!
              </p>
            </div>
          </CardContent>
        </Card>
        <div className="grid md:grid-cols-2 gap-2">
          <Card>
            <CardContent>
              When:{" "}
              <span className="inline-flex items-center gap-2 text-primary">
                12/01/25 <ArrowRight /> 04/01/26
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
    </>
  );
}
