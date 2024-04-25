import { AdminLayout } from "@/lib/components/layouts";
import { Metadata } from "next";

export const metadata: Metadata = {
  title: "Bảng điều khiển",
  description: "Bảng điều khiển",
};

export default function AdminConsoleLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return <AdminLayout>{children}</AdminLayout>;
}
