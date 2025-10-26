import type { BaseLayoutProps } from "fumadocs-ui/layouts/shared";

export function Fa7BrandsSlack(props: React.SVGProps<SVGSVGElement>) {
  return (
    <svg
      xmlns="http://www.w3.org/2000/svg"
      width="0.88em"
      height="1em"
      viewBox="0 0 448 512"
      {...props}
    >
      {/* Icon from Font Awesome Brands by Dave Gandy - https://creativecommons.org/licenses/by/4.0/ */}
      <path
        fill="currentColor"
        d="M94.1 315.1c0 25.9-21.2 47.1-47.1 47.1S0 341 0 315.1S21.2 268 47.1 268h47.1v47.1zm23.7 0c0-25.9 21.2-47.1 47.1-47.1s47.1 21.2 47.1 47.1v117.8c0 25.9-21.2 47.1-47.1 47.1s-47.1-21.2-47.1-47.1zm47.1-189c-25.9 0-47.1-21.2-47.1-47.1s21.2-47 47.1-47S212 53.2 212 79.1v47.1h-47.1zm0 23.7c25.9 0 47.1 21.2 47.1 47.1S190.8 244 164.9 244H47.1C21.2 244 0 222.8 0 196.9s21.2-47.1 47.1-47.1zm189 47.1c0-25.9 21.2-47.1 47.1-47.1s47 21.2 47 47.1s-21.2 47.1-47.1 47.1h-47.1v-47.1zm-23.7 0c0 25.9-21.2 47.1-47.1 47.1S236 222.8 236 196.9V79.1c0-25.9 21.2-47.1 47.1-47.1s47.1 21.2 47.1 47.1zm-47.1 189c25.9 0 47.1 21.2 47.1 47.1s-21.2 47-47.1 47s-47.1-21.2-47.1-47.1v-47.1h47.1zm0-23.7c-25.9 0-47.1-21.2-47.1-47.1s21.2-47.1 47.1-47.1h117.8c25.9 0 47.1 21.2 47.1 47.1s-21.2 47.1-47.1 47.1z"
      />
    </svg>
  );
}
export function baseOptions(): BaseLayoutProps {
  return {
    nav: {
      title: "Boot",
    },
    themeSwitch: {
      enabled: false,
    },
    githubUrl: "https://github.com/Choccy-vr/Boot-Web",
    links: [
      {
        text: "Slack",
        url: "https://hackclub.slack.com/archives/C09EWDU9ZQT",
        icon: <Fa7BrandsSlack />,
        type: "icon",
      },
    ],
  };
}
