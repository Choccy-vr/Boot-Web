import { defineDocs, defineConfig } from "fumadocs-mdx/config";
import lastModified from "fumadocs-mdx/plugins/last-modified";

export const guides = defineDocs({
  dir: "content/guides",
});

export default defineConfig({
  plugins: [lastModified()],
});
