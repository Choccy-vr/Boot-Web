import { Rocket } from "lucide-react";
import { Button } from "../ui/button";
import Link from "next/link";

export default function JoinButton({
  text = "Go To Dashboard",
  ...props
}: React.ComponentProps<typeof Button> & { text?: string }) {
  return (
    <Button {...props} asChild>
      <Link href="/dashboard">
        <Rocket />
        {text}
      </Link>
    </Button>
  );
}
