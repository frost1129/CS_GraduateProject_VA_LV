import { Metadata } from "next";

export const metadata: Metadata = {
  title: "Category | Admin Console",
  description: "Category | Admin Console",
};

export default function AdminConsoleLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return <>{children}</>;
}
