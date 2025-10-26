import FormPage from "@/components/form-page";
import TerminalBreadcrumbs from "@/components/terminal-breadcrumbs";
import { Metadata } from "next";

export const metadata: Metadata = {
  title: "Volunteer",
};

export default function JoinPage() {
  return (
    <>
      <TerminalBreadcrumbs
        breadcrumbs={[
          { slug: "/", text: "home" },
          { slug: "/join", text: "join" },
        ]}
      />
      <FormPage filloutId="1pw821yNQpus" />
    </>
  );
}
