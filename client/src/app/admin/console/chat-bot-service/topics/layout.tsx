import { Metadata } from "next";

export const metadata: Metadata = {
  title: "Topic | Admin Console",
  description: "Topic | Admin Console",
};

export default function AdminConsoleLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return <>{children}</>;
}
