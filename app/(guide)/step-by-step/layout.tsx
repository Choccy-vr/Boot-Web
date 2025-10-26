import { source } from "@/lib/source";
import { DocsLayout } from "fumadocs-ui/layouts/docs";
import { baseOptions } from "@/lib/fumadocs/layout.shared";

export default function Layout({ children }: LayoutProps<"/step-by-step">) {
  return (
    <DocsLayout
      themeSwitch={{ enabled: false }}
      tree={source.pageTree}
      sidebar={{
        tabs: [
          {
            title: "Step By Step Guide",
            description: "A guide on building OSes",
            url: "/step-by-step",
          },
        ],
      }}
      {...baseOptions()}
    >
      {children}
    </DocsLayout>
  );
}
