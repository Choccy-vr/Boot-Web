import { Rocket } from "lucide-react";
import { Button } from "./ui/button";
import Link from "next/link";

export default function JoinButton({
  ...props
}: React.ComponentProps<typeof Button>) {
  return (
    <Button {...props} asChild>
      <Link href="https://boot.fillout.com/t/1pw821yNQpus" target="_blank">
        <Rocket />
        RSVP
      </Link>
    </Button>
  );
}
