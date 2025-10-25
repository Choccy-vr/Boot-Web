"use client";

import TerminalBreadcrumbs from "@/components/terminal-breadcrumbs";
import { FilloutStandardEmbed } from "@fillout/react";

export default function JoinPage() {
  return (
    <>
      <TerminalBreadcrumbs
        breadcrumbs={[
          { slug: "/", text: "home" },
          { slug: "/join", text: "join" },
        ]}
      />
      <div className="pb-10 pt-2">
        <FilloutStandardEmbed filloutId="1pw821yNQpus" dynamicResize />
      </div>
    </>
  );
}
