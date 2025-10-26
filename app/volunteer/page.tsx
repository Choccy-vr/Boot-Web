"use client";

import TerminalBreadcrumbs from "@/components/terminal-breadcrumbs";
import { FilloutStandardEmbed } from "@fillout/react";

export default function VolunteerPage() {
  return (
    <>
      <TerminalBreadcrumbs
        breadcrumbs={[
          { slug: "/", text: "home" },
          { slug: "/volunteer", text: "volunteer" },
        ]}
      />
      <div className="pb-10 pt-2">
        <FilloutStandardEmbed filloutId="" dynamicResize />
      </div>
    </>
  );
}
