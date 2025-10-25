import TerminalBreadcrumbs from "@/components/terminal-breadcrumbs";
import { Card, CardContent } from "@/components/ui/card";
import { ArrowRight } from "lucide-react";

export default function Home() {
  return (
    <>
      <TerminalBreadcrumbs breadcrumbs={[{ slug: "/", text: "home" }]} />
      <div className="pb-4 flex flex-col gap-2">
        <h2 className="text-primary text-2xl">About Boot</h2>
        <Card>
          <CardContent>
            <p>
              Boot is a YSWS (You Ship We Ship) where teens from around the
              world come together to build their own operating systems — from
              the ground up or from something already great.
            </p>
            <p>
              Whether you&apos;re going completely custom with LFS or Buildroot,
              or remixing a distro like Ubuntu into something entirely your own,
              the choice is yours.
            </p>
          </CardContent>
        </Card>
        <div className="grid md:grid-cols-2 gap-2">
          <Card>
            <CardContent>
              When:{" "}
              <span className="inline-flex items-center gap-2 text-primary">
                12/01/25 <ArrowRight /> 04/01/26
              </span>
            </CardContent>
          </Card>
          <Card>
            <CardContent>
              Platform:{" "}
              <span className="inline-flex items-center gap-2 text-primary">
                Virtual
              </span>
            </CardContent>
          </Card>
          <Card>
            <CardContent>
              Age:{" "}
              <span className="inline-flex items-center gap-2 text-primary">
                13-18 years
              </span>
            </CardContent>
          </Card>
          <Card>
            <CardContent>
              Cost:{" "}
              <span className="inline-flex items-center gap-2 text-primary">
                Free!
              </span>
            </CardContent>
          </Card>
        </div>
      </div>
    </>
  );
}
