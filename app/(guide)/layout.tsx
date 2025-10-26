import { RootProvider } from "fumadocs-ui/provider/next";
import type { ReactNode } from "react";

export default function Layout({ children }: { children: ReactNode }) {
  return (
    <div
      // required styles
      className="flex flex-col min-h-screen"
    >
      <RootProvider theme={{ enabled: false, forcedTheme: "dark" }}>
        {children}
      </RootProvider>
    </div>
  );
}
