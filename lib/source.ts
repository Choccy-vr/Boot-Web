import { stepByStep } from "@/.source";
import { loader } from "fumadocs-core/source";

export const source = loader({
  baseUrl: "/step-by-step",
  source: stepByStep.toFumadocsSource(),
});
