import { AdminLayout } from "@/lib/components/layouts";
import { Metadata } from "next";

export const metadata: Metadata = {
  title: "Admin Console",
  description: "Admin Console",
};

export default function AdminConsoleLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return <AdminLayout>{children}</AdminLayout>;
}
