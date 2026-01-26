import type { NextConfig } from "next";
import { createMDX } from "fumadocs-mdx/next";

const nextConfig: NextConfig = {
  async rewrites() {
    return [
      {
        source: '/dashboard/:path*',
        destination: 'https://boot-lilac.vercel.app/:path*',
      },
    ];
  },
};

const withMDX = createMDX({
  configPath: "source.config.ts",
});

export default withMDX(nextConfig);
