"use client";

import Link from "next/link";
import { useEffect, useState } from "react";

export default function TerminalBreadcrumbs({
  breadcrumbs = [],
}: {
  breadcrumbs: { slug: string; text: string }[];
}) {
  const content =
    "[you@bootos ~" +
    breadcrumbs.map((breadcrumb, index) => `/${breadcrumb.text}`) +
    "]$";
  const [typing, setTyping] = useState(true);
  const [typingContent, setTypingContent] = useState("");

  useEffect(() => {
    for (let i = 0; i < content.length; i++) {
      setTimeout(() => {
        setTypingContent((prevContent) => prevContent + content[i]);
      }, i * 10);
    }

    setTimeout(() => {
      setTyping(false);
    }, content.length * 10);
  }, []);

  if (typing) {
    return <div className="text-primary">{typingContent}</div>;
  } else {
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
}
