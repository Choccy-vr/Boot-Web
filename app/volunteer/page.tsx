import TerminalBreadcrumbs from "@/components/terminal-breadcrumbs";

export default function Home() {
  return (
    <>
      <TerminalBreadcrumbs
        breadcrumbs={[
          { slug: "/", text: "home" },
          { slug: "/volunteer", text: "volunteer" },
        ]}
      />
    </>
  );
}
