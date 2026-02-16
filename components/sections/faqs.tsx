import AnimatedSection from "@/components/animations/section";

export default function FAQsSection() {
  return (
    <AnimatedSection id="faqs" className="py-16">
      <h2 className="text-primary text-2xl">Frequently Asked Questions</h2>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div>
          <h3 className="font-semibold mb-2">Who can participate?</h3>
          <p className="text-sm">
            Any teenager 13-18 can participate in Boot. No prior experience with
            OS development is required!
          </p>
        </div>
        <div>
          <h3 className="font-semibold mb-2">Don&apos;t know how to make an OS?</h3>
          <p className="text-sm">
            No problem! We&apos;ll provide you with all the necessary resources
            and support to help you get started.
          </p>
        </div>
        <div>
          <h3 className="font-semibold mb-2">Can I make multiple OSes</h3>
          <p className="text-sm">
            Yes, but we highly encourage you to just make one and make it the best you can!
          </p>
        </div>
        <div>
          <h3 className="font-semibold mb-2">What is Hack Club?</h3>
          <p className="text-sm">
            Fill me in, please!
          </p>
        </div>
      </div>
    </AnimatedSection>
  );
}
