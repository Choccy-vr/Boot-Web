import AnimatedSection from "@/components/animations/section";

export default function VolunteerSection() {
  return (
    <AnimatedSection>
      <h2 className="text-primary text-2xl">Volunteer With Us</h2>
      <div className="grid md:grid-cols-2 gap-4">
        <div className="bg-card p-6 border rounded-xl shadow-sm">
          <h2 className="text-xl">Designer</h2>
          Help us create visuals
        </div>
        <div className="bg-card p-6 border rounded-xl shadow-sm">
          <h2 className="text-xl">Reviewer</h2>
          Help review projects
        </div>
        <div className="bg-card p-6 border rounded-xl shadow-sm">
          <h2 className="text-xl">Writer</h2>
          Write help guides and material
        </div>
        <div className="bg-card p-6 border rounded-xl shadow-sm">
          <h2 className="text-xl">Anything Else</h2>
          Whatever you can offer
        </div>
      </div>
    </AnimatedSection>
  );
}
