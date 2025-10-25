import { Rocket } from "lucide-react";
import { Button } from "../ui/button";
import Link from "next/link";

export default function JoinButton({
  text = "Join",
  ...props
}: React.ComponentProps<typeof Button> & { text?: string }) {
  return (
    <Button {...props} asChild>
      <Link href="/join" target="_blank">
        <Rocket />
        {text}
      </Link>
    </Button>
  );
}
