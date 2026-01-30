"use client";

import { useEffect, useState } from "react";

interface TimeLeft {
    days: number;
    hours: number;
    minutes: number;
    seconds: number;
}

export default function Countdown() {
    const [timeLeft, setTimeLeft] = useState<TimeLeft | null>(null);
    const [mounted, setMounted] = useState(false);

    useEffect(() => {
        setMounted(true);

        const calculateTimeLeft = (): TimeLeft | null => {
            // January 31st, 2026 at 11:59:59 EST
            const targetDate = new Date("2026-01-31T11:59:59-05:00");
            const now = new Date();
            const difference = targetDate.getTime() - now.getTime();

            if (difference <= 0) {
                return null;
            }

            return {
                days: Math.floor(difference / (1000 * 60 * 60 * 24)),
                hours: Math.floor((difference / (1000 * 60 * 60)) % 24),
                minutes: Math.floor((difference / (1000 * 60)) % 60),
                seconds: Math.floor((difference / 1000) % 60),
            };
        };

        setTimeLeft(calculateTimeLeft());

        const timer = setInterval(() => {
            setTimeLeft(calculateTimeLeft());
        }, 1000);

        return () => clearInterval(timer);
    }, []);

    const formatNumber = (num: number): string => {
        return num.toString().padStart(2, "0");
    };

    if (!mounted) {
        return (
            <div className="font-mono text-sm text-muted-foreground">
                <span className="animate-pulse">loading_timer...</span>
            </div>
        );
    }

    if (!timeLeft) {
        return (
            <div className="font-mono text-sm text-primary">
                <span className="text-destructive">&gt;</span> deadline_reached
            </div>
        );
    }

    return (
        <div className="font-mono flex flex-col gap-2">
            <div className="text-xs text-muted-foreground flex items-center gap-2">
                <span>launches_on: jan_31_2026_est</span>
            </div>
            <div className="flex items-center gap-1 text-sm sm:text-base">
                <span className="text-muted-foreground">&gt;</span>
                <span className="text-primary">time_remaining</span>
                <span className="text-muted-foreground">=</span>
                <span className="text-primary">[</span>

                <TimeUnit value={timeLeft.days} label="d" />
                <span className="text-muted-foreground">:</span>
                <TimeUnit value={timeLeft.hours} label="h" />
                <span className="text-muted-foreground">:</span>
                <TimeUnit value={timeLeft.minutes} label="m" />
                <span className="text-muted-foreground">:</span>
                <TimeUnit value={timeLeft.seconds} label="s" />

                <span className="text-primary">]</span>
                <span className="text-primary animate-pulse">█</span>
            </div>
        </div>
    );
}

function TimeUnit({ value, label }: { value: number; label: string }) {
    const formatted = value.toString().padStart(2, "0");

    return (
        <span className="inline-flex items-baseline">
            <span className="text-primary font-bold tabular-nums tracking-tight">
                {formatted}
            </span>
            <span className="text-muted-foreground ml-0.5">{label}</span>
        </span>
    );
}
