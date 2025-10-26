import { stepByStep } from "@/.source";
import { loader } from "fumadocs-core/source";

export const source = loader({
  baseUrl: "/guides/step-by-step",
  source: stepByStep.toFumadocsSource(),
});
