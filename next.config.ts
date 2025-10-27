import type { NextConfig } from "next";
import { createMDX } from "fumadocs-mdx/next";

const nextConfig: NextConfig = {};

const withMDX = createMDX({
  configPath: "source.config.ts",
});

export default withMDX(nextConfig);
