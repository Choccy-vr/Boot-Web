import FormPage from "@/components/form-page";
import TerminalBreadcrumbs from "@/components/terminal-breadcrumbs";
import { Metadata } from "next";

export const metadata: Metadata = {
  title: "Join",
};

export default function VolunteerPage() {
  return (
    <>
      <TerminalBreadcrumbs
        breadcrumbs={[
          { slug: "/", text: "home" },
          { slug: "/volunteer", text: "volunteer" },
        ]}
      />
      <FormPage filloutId="" />
    </>
  );
}
