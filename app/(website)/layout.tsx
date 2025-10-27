import Navbar from "@/components/navbar";
import JoinButton from "@/components/buttons/join";
import Footer from "@/components/footer";

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <>
      <div className="min-h-screen flex flex-col">
        <Navbar />
        <main className="max-w-4xl w-screen mx-auto p-4">{children}</main>
        <div className="grow"></div>
        <Footer />
      </div>
    </>
  );
}
