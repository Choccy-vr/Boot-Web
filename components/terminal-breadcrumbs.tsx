import Link from "next/link";

export default function TerminalBreadcrumbs({
  breadcrumbs = [],
}: {
  breadcrumbs: { slug: string; text: string }[];
}) {
  return (
    <div className="text-primary">
      [you@bootos{" "}
      <Link href="/" className="hover:underline">
        ~
      </Link>
      {breadcrumbs.map((breadcrumb, index) => (
        <span key={index}>
          /
          <Link href={breadcrumb.slug} className="hover:underline">
            {breadcrumb.text}
          </Link>
        </span>
      ))}
      ]$
    </div>
  );
}
