import Link from "next/link";
import JoinButton from "./buttons/join";
import { Button } from "./ui/button";
import ButtonAnimation from "./buttons/animation";
import Image from "next/image";

export default function Navbar() {
  return (
    <div className="w-full">
      <nav className="flex flex-row gap-2 p-2 py-4 max-w-4xl mx-auto items-center">
        <Link href="/" className="flex flex-row gap-4 items-center">
          <Image alt="Boot Logo" src="/icon.png" width={36} height={36} />
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
