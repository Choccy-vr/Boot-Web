"use client";

import { motion } from "motion/react";

export default function ButtonAnimation({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <motion.div
      whileHover={{ scale: 1.03, y: -1 }}
      whileTap={{ scale: 0.97, y: 0 }}
    >
      {children}
    </motion.div>
  );
}
