import Image from "next/image";
import Link from "next/link";

export default function Footer() {
  return (
    <footer className="py-10 border-t bg-card shadow-sm">
      <div className="max-w-4xl w-full mx-auto px-4 flex flex-col gap-4">
        <div className="flex flex-row gap-2 items-center">
          <Image alt="Boot Logo" src="/icon.png" width={36} height={36} />
          <div className="text-primary text-2xl">Boot</div>
        </div>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          <div className="flex flex-col gap-2">
            A YSWS (You Ship We Ship) where teens from around the world build
            operating systems.
          </div>
          <div className="grid grid-cols-2 gap-4 h-fit">
            <Link href="/join" className="underline">
              Join
            </Link>
            <Link href="/volunteer" className="underline">
              Volunteer
            </Link>
            <Link href="mailto:gino@boot-os.com" className="underline">
              Sponsor Us
            </Link>
            <Link
              href="https://hcb.hackclub.com/donations/start/boot"
              target="_blank"
              className="underline"
            >
              Donate
            </Link>
          </div>
        </div>
        <div className="p-4 border rounded-xl bg-card shadow-sm">
          Boot is fiscally sponsored by The Hack Foundation (d.b.a. Hack Club),
          a 501(c)(3) nonprofit (EIN: 81-2908499).
        </div>
      </div>
    </footer>
  );
}
