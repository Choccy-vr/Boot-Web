import Image from "next/image";
import Link from "next/link";

export default function Footer() {
  return (
    <footer className="border-t bg-card py-16">
      <div className="max-w-4xl w-full mx-auto px-6">
        <div className="flex flex-col md:flex-row gap-12 md:gap-16 items-start">
          {/* Orpheus Image */}
          <div className="shrink-0">
            <Image 
              alt="Hack Club Orpheus" 
              src="/hack-club-orpheus.png" 
              width={120} 
              height={120}
              className="object-contain"
            />
          </div>
          
          {/* Content Section */}
          <div className="flex flex-col gap-6 flex-1">
            <div className="flex items-center gap-3">
              <Image alt="Boot Logo" src="/icon.svg" width={40} height={40} />
              <div className="text-primary text-2xl font-bold">Boot</div>
            </div>
            
            <p className="text-muted-foreground leading-relaxed">
              A Hack Club YSWS where teens from around the world build operating systems 
              and get hardware to run them.
            </p>

            <div className="text-sm text-muted-foreground mt-auto">
              Website by{" "}
              <Link href="https://ingo.au" target="_blank" className="text-primary hover:underline">
                Ingo
              </Link>
            </div>
          </div>
        </div>
      </div>
    </footer>
  );
}
