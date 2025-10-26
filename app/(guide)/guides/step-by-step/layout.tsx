import { source } from "@/lib/source";
import { DocsLayout } from "fumadocs-ui/layouts/docs";
import { baseOptions } from "@/lib/fumadocs/layout.shared";
import { TABS } from "@/lib/fumadocs/constants";

export default function Layout({
  children,
}: LayoutProps<"/guides/step-by-step">) {
  return (
    <DocsLayout
      themeSwitch={{ enabled: false }}
      tree={source.pageTree}
      sidebar={{
        tabs: TABS,
      }}
      {...baseOptions()}
    >
      {children}
    </DocsLayout>
  );
}
