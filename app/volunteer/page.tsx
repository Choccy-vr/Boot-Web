"use client";

import TerminalBreadcrumbs from "@/components/terminal-breadcrumbs";
import { FilloutStandardEmbed } from "@fillout/react";

export default function VolunteerPage() {
  return (
    <>
      <TerminalBreadcrumbs
        breadcrumbs={[
          { slug: "/", text: "home" },
          { slug: "/join", text: "join" },
        ]}
      />
      <div className="pb-10 pt-2">
        <FilloutStandardEmbed filloutId="" dynamicResize />
      </div>
    </>
  );
}
