import Image from "next/image";
import Link from "next/link";

export default function Footer() {
  return (
    <footer className="py-10 border-t bg-card shadow-sm">
      <div className="max-w-4xl w-full mx-auto px-4 flex flex-col gap-4">
        <div className="flex flex-row gap-2 items-center">
          <Image alt="Boot Logo" src="/icon.svg" width={36} height={36} />
          <div className="text-primary text-2xl">Boot</div>
        </div>
        <div className="grid grid-cols-1 gap-4">
          <div className="flex flex-col gap-2">
            A YSWS (You Ship We Ship) where teens from around the world build
            operating systems.
          </div>
          <div className="flex flex-row justify-center gap-4 h-fit">
            <Link href="/join" className="underline">
              Join
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
        <div className="text-sm duration-100 opacity-50 hover:opacity-100 text-center">
          Website by{" "}
          <Link href="https://ingo.au" target="_blank">
            Ingo
          </Link>
        </div>
      </div>
    </footer>
  );
}
