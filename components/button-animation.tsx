"use client";

import { motion } from "motion/react";

export default function ButtonAnimation({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <motion.div whileHover={{ scale: 1.03 }} whileTap={{ scale: 0.97 }}>
      {children}
    </motion.div>
  );
}
