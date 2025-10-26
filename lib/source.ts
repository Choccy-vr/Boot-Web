import { guides } from "@/.source";
import { loader } from "fumadocs-core/source";

export const source = loader({
  baseUrl: "/guides",
  source: guides.toFumadocsSource(),
});
