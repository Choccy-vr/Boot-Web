import Link from "next/link";
import JoinButton from "./join-button";
import { Button } from "./ui/button";
import { Terminal } from "lucide-react";
import ButtonAnimation from "./button-animation";

export default function Navbar() {
  return (
    <div className="w-full">
      <nav className="flex flex-row gap-2 p-2 max-w-4xl mx-auto items-center">
        <Link href="/" className="flex flex-row gap-4 items-center">
          <div className="bg-accent border border-primary shadow-2xl aspect-square p-2 rounded flex justify-center items-center">
            <Terminal className="size-4 text-primary" />
          </div>
          <div className="text-2xl text-primary">Boot</div>
        </Link>
        <div className="grow"></div>
        <ButtonAnimation>
          <Button variant="secondary" asChild>
            <Link href="/volunteer">Volunteer</Link>
          </Button>
        </ButtonAnimation>
        <ButtonAnimation>
          <JoinButton />
        </ButtonAnimation>
      </nav>
    </div>
  );
}
