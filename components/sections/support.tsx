import AnimatedSection from "@/components/animations/section";
import { Heart, Trophy, Server } from "lucide-react";
import { Button } from "@/components/ui/button";
import Link from "next/link";

export default function SupportSection() {
  return (
    <AnimatedSection>
      <h2 className="text-primary text-2xl">Support Boot</h2>
      <div className="bg-card p-6 border rounded-xl shadow-sm">
        <div className="flex flex-col md:flex-row items-start md:items-center gap-4 md:justify-between">
          <div className="flex gap-4">
            <Heart className="text-primary shrink-0" />
            <span>
              Your donations help us support the OS development community and
              make Boot accessible to everyone.
            </span>
          </div>
          <Button asChild size="lg" className="w-full md:w-auto">
            <Link href="" target="_blank">
              <Heart />
              Donate
            </Link>
          </Button>
        </div>
      </div>
      <h3 className="text-xl mb-3 text-primary">Donations Help Fund</h3>
      <div className="grid md:grid-cols-2 gap-4">
        <div className="bg-card p-6 border rounded-xl shadow-sm">
          <div className="flex items-center gap-2 mb-3">
            <Trophy className="text-primary" size={24} />
            <h3 className="text-xl">Prizes & Awards</h3>
          </div>
          <p className="text-muted-foreground">
            Hardware and other prizes for participants to reward creativity and
            innovation in OS development
          </p>
        </div>
        <div className="bg-card p-6 border rounded-xl shadow-sm">
          <div className="flex items-center gap-2 mb-3">
            <Server className="text-primary" size={24} />
            <h3 className="text-xl">Infrastructure</h3>
          </div>
          <p className="text-muted-foreground">
            Cloud VMs, servers, and resources to keep Boot running smoothly for
            all participants
          </p>
        </div>
      </div>
    </AnimatedSection>
  );
}
