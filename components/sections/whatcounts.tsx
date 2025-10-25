import AnimatedSection from "@/components/animations/section";

export default function WhatCountsSection() {
  return (
    <AnimatedSection>
      <h2 className="text-primary text-2xl">What Counts as an OS?</h2>
      <div className="grid md:grid-cols-2 gap-2">
        <div className="bg-card p-6 border rounded-xl shadow-sm">
          <h2 className="text-xl">From Scratch</h2>
          Build your OS from the ground up, not based on any other OS (May still
          use other libraries, etc)
        </div>
        <div className="bg-card p-6 border rounded-xl shadow-sm">
          <h2 className="text-xl">Base it off</h2>
          Make an OS based off an existing OS (Debian, Fedora, Arch, RPi OS,
          Ubuntu, etc) and make it your own!
        </div>
      </div>
    </AnimatedSection>
  );
}
