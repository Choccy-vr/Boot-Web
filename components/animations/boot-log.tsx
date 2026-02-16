"use client";

import { useEffect, useRef } from "react";

const BOOT_LINES = [
  "[    0.000000] Linux version 6.8.0-boot (gcc 13.2.0)",
  "[    0.000000] Command line: BOOT_IMAGE=/vmlinuz root=/dev/sda1",
  "[    0.000012] BIOS-provided physical RAM map:",
  "[    0.000015]  BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable",
  "[    0.000018]  BIOS-e820: [mem 0x0000000000100000-0x00000000bfffffff] usable",
  "[    0.000034] NX (Execute Disable) protection: active",
  "[    0.000041] SMBIOS 3.4.0 present.",
  "[    0.000089] tsc: Fast TSC calibration using PIT",
  "[    0.000102] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved",
  "[    0.000190] Kernel command line: root=/dev/sda1 ro quiet",
  "[    0.001204] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point'",
  "[    0.001206] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'",
  "[    0.001340] signal: max sigframe size: 1040",
  "[    0.001881] ACPI: Early table checksum verified",
  "[    0.001922] ACPI: RSDP 0x00000000000F0490 000024 (v02 BOCHS )",
  "[    0.002150] Zone ranges:",
  "[    0.002151]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]",
  "[    0.002153]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]",
  "[    0.002610] Booting paravirtualized kernel on bare hardware",
  "[    0.002820] clocksource: refined-jiffies defaulted to viable",
  "[    0.003014] Memory: 4028456K/4194304K available",
  "[    0.003450] ACPI: PM-Timer IO Port: 0x608",
  "[    0.003890] Built 1 zonelists, mobility grouping on. Total pages: 1032192",
  "[    0.004200] rcu: Hierarchical RCU implementation.",
  "[    0.004880] Calibrating delay loop (skipped), value calculated using timer",
  "[    0.005110] pid_max: default: 32768 minimum: 301",
  "[    0.005640] LSM: initializing lsm=capability,yama",
  "[    0.006012] Mount-cache hash table entries: 16384",
  "[    0.006334] CPU: Physical Processor ID: 0",
  "[    0.006780] mce: CPU0: Thermal monitoring enabled (TCC activation)",
  "[    0.007100] process: using mwait in idle threads",
  "[    0.007540] Spectre V2 : Mitigation: Retpolines",
  "[    0.008002] devtmpfs: initialized",
  "[    0.008430] clocksource: jiffies defaulted to viable",
  "[    0.008812] NET: Registered PF_NETLINK/PF_ROUTE protocol family",
  "[    0.009210] DMA: preallocated 512 KiB GFP_KERNEL pool",
  "[    0.009640] audit: initializing netlink subsys (disabled)",
  "[    0.010050] thermal_sys: Registered thermal governor 'step_wise'",
  "[    0.010340] cpuidle: using governor menu",
  "[    0.010780] PCI: Using configuration type 1 for base access",
  "[    0.011100] kprobes: kprobe jump-optimization is enabled",
  "[    0.011890] HugeTLB: registered 2.00 MiB page size",
  "[    0.012200] raid6: avx2x4 gen() 14400 MB/s",
  "[    0.012580] xor: automatically using best checksumming function",
  "[    0.013100] Block layer SCSI generic driver version 0.4 loaded",
  "[    0.013500] io scheduler mq-deadline registered",
  "[    0.014020] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled",
  "[    0.014300] printk: legacy console [ttyS0] enabled",
  "[    0.015100] ahci 0000:00:1f.2: AHCI 0001.0300 32 slots",
  "[    0.015800] scsi host0: ahci",
  "[    0.016200] ata1: SATA max UDMA/133 abar m2048@0xfebf1000",
  "[    0.016800] e1000: Intel(R) PRO/1000 Network Driver",
  "[    0.017200] e1000 0000:00:03.0: eth0: (PCI:33MHz:32-bit) MAC addr",
  "[    0.017800] input: AT Translated Set 2 keyboard as /devices/input0",
  "[    0.018300] EXT4-fs (sda1): mounted filesystem with ordered data mode",
  "[    0.018900] VFS: Mounted root (ext4 filesystem) readonly on device 8:1.",
  "[    0.019400] systemd[1]: Detected architecture x86-64.",
  "[    0.019900] systemd[1]: Set hostname to <boot-os>.",
  "[    0.020500] systemd[1]: Reached target - Local File Systems.",
  "[    0.021000] systemd[1]: Started Journal Service.",
  "[    0.021600] systemd[1]: Starting Network Configuration...",
  "[    0.022100] systemd[1]: Boot complete. Welcome to Boot OS.",
];

const COLUMNS = 1;
const LINE_HEIGHT = 16;
const SCROLL_SPEED = 0.3;
const OPACITY = 0.12;
const FONT_SIZE = 11;

export default function BootLog({ className }: { className?: string }) {
  const canvasRef = useRef<HTMLCanvasElement>(null);
  const animationRef = useRef<number>(0);
  const offsetRef = useRef(0);
  const columnOffsetsRef = useRef<number[]>([]);

  useEffect(() => {
    const canvas = canvasRef.current;
    if (!canvas) return;

    const ctx = canvas.getContext("2d");
    if (!ctx) return;

    let w = 0;
    let h = 0;

    const totalHeight = BOOT_LINES.length * LINE_HEIGHT;

    columnOffsetsRef.current = Array.from(
      { length: COLUMNS },
      (_, i) => Math.floor((BOOT_LINES.length / COLUMNS) * i) * LINE_HEIGHT
    );

    const resize = () => {
      const dpr = window.devicePixelRatio || 1;
      const rect = canvas.getBoundingClientRect();
      w = rect.width;
      h = rect.height;
      canvas.width = w * dpr;
      canvas.height = h * dpr;
      ctx.scale(dpr, dpr);
    };

    resize();
    window.addEventListener("resize", resize);

    const animate = () => {
      ctx.clearRect(0, 0, w, h);

      ctx.font = `${FONT_SIZE}px "Geist Mono", "Fira Code", monospace`;
      ctx.textBaseline = "top";

      offsetRef.current -= SCROLL_SPEED;
      if (offsetRef.current < 0) {
        offsetRef.current += totalHeight;
      }

      const cw = w / COLUMNS;
      const fadeZone = 80;

      for (let col = 0; col < COLUMNS; col++) {
        const colOffset = offsetRef.current + columnOffsetsRef.current[col];

        ctx.save();
        ctx.beginPath();
        ctx.rect(col * cw, 0, cw, h);
        ctx.clip();

        const startLine = Math.floor(colOffset / LINE_HEIGHT);
        const pixelOffset = colOffset % LINE_HEIGHT;
        const visibleLines = Math.ceil(h / LINE_HEIGHT) + 1;

        for (let i = 0; i < visibleLines; i++) {
          const lineIdx = (startLine + i) % BOOT_LINES.length;
          const y = h - (i * LINE_HEIGHT - pixelOffset) - LINE_HEIGHT;

          if (y < -LINE_HEIGHT || y > h) continue;

          let fadeMult = 1;
          if (y > h - fadeZone) {
            fadeMult = (h - y) / fadeZone;
          } else if (y < fadeZone) {
            fadeMult = y / fadeZone;
          }

          const alpha = Math.max(0, OPACITY * fadeMult);
          ctx.fillStyle = `rgba(34, 255, 34, ${alpha})`;
          ctx.fillText(BOOT_LINES[lineIdx], col * cw + 12, y);
        }

        ctx.restore();
      }

      animationRef.current = requestAnimationFrame(animate);
    };

    animationRef.current = requestAnimationFrame(animate);

    return () => {
      cancelAnimationFrame(animationRef.current);
      window.removeEventListener("resize", resize);
    };
  }, []);

  return (
    <canvas
      ref={canvasRef}
      className={className}
      style={{ display: "block" }}
    />
  );
}
