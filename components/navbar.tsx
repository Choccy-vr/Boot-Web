import TerminalIcon from "@mui/icons-material/Terminal";

export default function Navbar() {
  return (
    <div className="w-full">
      <nav className="flex flex-row gap-2 p-2 max-w-4xl mx-auto items-center">
        <div className="flex flex-row gap-2 items-center">
          <div className="bg-primary/25 aspect-square p-2">
            <TerminalIcon className="text-primary" />
          </div>
          <div className="text-xl">Boot</div>
        </div>
      </nav>
    </div>
  );
}
