import AnimatedSection from "@/components/animations/section";
import { Heart, Trophy, Server } from "lucide-react";
import { Button } from "@/components/ui/button";
import Link from "next/link";
import ButtonAnimation from "../buttons/animation";

export default function DonateSection() {
  return (
    <AnimatedSection>
      <h2 className="text-primary text-2xl">Support Boot</h2>
      <div className="bg-card p-6 border rounded-xl shadow-sm flex flex-row items-center">
        <div className="flex gap-4">
          <Heart />
          <span>Help us create an amazing YSWS</span>
        </div>
        <div className="grow"></div>
        <ButtonAnimation>
          <Button asChild size="lg" className="w-full md:w-auto">
            <Link
              href="https://hcb.hackclub.com/donations/start/boot"
              target="_blank"
            >
              <Heart />
              Donate
            </Link>
          </Button>
        </ButtonAnimation>
      </div>
      <h3 className="text-xl text-primary">Donations Help Fund</h3>
      <div className="grid md:grid-cols-2 gap-4">
        <div className="bg-card p-6 border rounded-xl shadow-sm">
          <div className="flex items-center gap-2 mb-3">
            <Trophy size={24} />
            <h3 className="text-xl">Prizes & Awards</h3>
          </div>
          <p>
            Hardware and other prizes for participants to reward creativity and
            innovation in OS development
          </p>
        </div>
        <div className="bg-card p-6 border rounded-xl shadow-sm">
          <div className="flex items-center gap-2 mb-3">
            <Server size={24} />
            <h3 className="text-xl">Infrastructure</h3>
          </div>
          <p>
            Cloud VMs, servers, and resources to keep Boot running smoothly for
            all participants
          </p>
        </div>
      </div>
    </AnimatedSection>
  );
}
