import { guide } from "@/.source";
import { loader } from "fumadocs-core/source";

export const source = loader({
  baseUrl: "/guide",
  source: guide.toFumadocsSource(),
});
