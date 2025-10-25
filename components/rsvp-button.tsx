import { Rocket } from "lucide-react";
import { Button } from "./ui/button";

export default function RSVPButton({
  ...props
}: React.ComponentProps<typeof Button>) {
  return (
    <Button {...props}>
      <Rocket />
      RSVP
    </Button>
  );
}
