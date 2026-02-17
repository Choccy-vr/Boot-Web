import Image from "next/image";
import Link from "next/link";

export default function Footer() {
  return (
    <footer className="border-t bg-card py-12">
      <div className="max-w-4xl w-full mx-auto px-6">
        <div className="flex flex-col gap-6">
          <div className="flex items-center gap-3">
            <Image alt="Boot Logo" src="/icon.svg" width={40} height={40} />
            <div className="text-primary text-2xl font-bold">Boot</div>
          </div>
          
          <p className="text-muted-foreground max-w-2xl">
            A Hack Club YSWS where teens from around the world build operating systems 
            and get hardware to run them.
          </p>

          <div className="text-sm text-muted-foreground">
            Website by{" "}
            <Link href="https://ingo.au" target="_blank" className="text-primary hover:underline">
              Ingo
            </Link>
          </div>
        </div>
      </div>
    </footer>
  );
}
