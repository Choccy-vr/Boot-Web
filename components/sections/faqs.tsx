import AnimatedSection from "@/components/animations/section";
import {
  Accordion,
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from "../ui/accordion";

export default function FAQsSection() {
  return (
    <AnimatedSection>
      <h2 className="text-primary text-2xl">Frequently Asked Questions</h2>
      <Accordion type="single" collapsible>
        <AccordionItem value="who-can-participate">
          <AccordionTrigger>Who can participate?</AccordionTrigger>
          <AccordionContent>
            Any teenager 13-18 can participate in Boot. No prior experience with
            OS development is required!
          </AccordionContent>
        </AccordionItem>
        <AccordionItem value="dont-know-how-to-make-os">
          <AccordionTrigger>
            Don&apos;t know how to make an OS?
          </AccordionTrigger>
          <AccordionContent>
            No problem! We&apos;ll provide you with all the necessary resources
            and support to help you get started.
          </AccordionContent>
        </AccordionItem>
        <AccordionItem value="can-build-multiple-os">
          <AccordionTrigger>Can I build multiple OSes</AccordionTrigger>
          <AccordionContent>[TODO: write something here]</AccordionContent>
        </AccordionItem>
      </Accordion>
    </AnimatedSection>
  );
}
