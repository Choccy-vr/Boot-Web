"use client";

import { motion } from "motion/react";

export default function ButtonAnimation({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <motion.div
      whileHover={{ scale: 1.02, y: -1 }}
      whileTap={{ scale: 0.99, y: 0, filter: "brightness(0.7)" }}
    >
      {children}
    </motion.div>
  );
}
