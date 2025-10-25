import { Button } from "./ui/button";
import { Rocket, Terminal } from "lucide-react";

export default function Navbar() {
  return (
    <div className="w-full">
      <nav className="flex flex-row gap-2 p-2 max-w-4xl mx-auto items-center">
        <div className="flex flex-row gap-4 items-center">
          <div className="bg-accent border border-primary shadow-2xl aspect-square p-2 rounded flex justify-center items-center">
            <Terminal className="size-4 text-primary" />
          </div>
          <div className="text-2xl text-primary">Boot</div>
        </div>
        <div className="grow"></div>
        <Button variant="secondary">Volunteer</Button>
        <Button>
          <Rocket />
          RSVP
        </Button>
      </nav>
    </div>
  );
}
