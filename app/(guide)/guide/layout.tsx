import { source } from "@/lib/source";
import { DocsLayout } from "fumadocs-ui/layouts/docs";
import { baseOptions } from "@/lib/guide/layout.shared";

export default function Layout({ children }: LayoutProps<"/guide">) {
  return (
    <DocsLayout
      themeSwitch={{ enabled: false }}
      tree={source.pageTree}
      {...baseOptions()}
    >
      {children}
    </DocsLayout>
  );
}
