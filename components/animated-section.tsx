"use client";

import clsx from "clsx";
import { motion } from "motion/react";

export default function AnimatedSection({
  children,
  className,
  delay = 0.3,
}: {
  children: React.ReactNode;
  className?: string;
  delay?: number;
}) {
  return (
    <motion.div
      initial={{ opacity: 0, y: 20 }}
      whileInView={{ opacity: 1, y: 0 }}
      viewport={{ once: true }}
      transition={{ ease: [0.165, 0.84, 0.44, 1.0], delay: delay }}
      className={clsx("pb-4 flex flex-col gap-2", className)}
    >
      {children}
    </motion.div>
  );
}
