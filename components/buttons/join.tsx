import { Rocket } from "lucide-react";
import { Button } from "../ui/button";
import Link from "next/link";

export default function JoinButton({
  text = "Join",
  ...props
}: React.ComponentProps<typeof Button> & { text?: string }) {
  return (
    <Button {...props} asChild>
      <Link href="https://boot.fillout.com/t/1pw821yNQpus" target="_blank">
        <Rocket />
        {text}
      </Link>
    </Button>
  );
}
