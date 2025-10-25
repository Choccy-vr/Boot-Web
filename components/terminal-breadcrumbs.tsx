"use client";

import Link from "next/link";
import { useEffect, useState } from "react";

export default function TerminalBreadcrumbs({
  breadcrumbs = [],
}: {
  breadcrumbs: { slug: string; text: string }[];
}) {
  const [typing, setTyping] = useState(true);
  const [typingContent, setTypingContent] = useState("");

  const breadcrumbPath = breadcrumbs
    .map((breadcrumb) => `/${breadcrumb.text}`)
    .join("");

  useEffect(() => {
    const content = `[you@boot ~${breadcrumbPath}]$`;
    const timeouts: NodeJS.Timeout[] = [];

    for (let i = 0; i < content.length; i++) {
      timeouts.push(
        setTimeout(() => {
          setTypingContent((prevContent) => prevContent + content[i]);
        }, i * 10),
      );
    }

    timeouts.push(
      setTimeout(() => {
        setTyping(false);
      }, content.length * 10),
    );

    return () => {
      timeouts.forEach(clearTimeout);
    };
  }, [breadcrumbPath]);

  return (
    <div className="text-primary min-h-6">
      {typing ? (
        typingContent
      ) : (
        <>
          [you@boot{" "}
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
        </>
      )}
    </div>
  );
}
