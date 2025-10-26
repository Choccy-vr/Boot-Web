import type { BaseLayoutProps } from "fumadocs-ui/layouts/shared";

export function baseOptions(): BaseLayoutProps {
  return {
    nav: {
      title: "Boot",
    },
    themeSwitch: {
      enabled: false,
    },
  };
}
