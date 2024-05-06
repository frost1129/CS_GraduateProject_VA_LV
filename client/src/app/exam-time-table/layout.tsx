import { ClientLayout } from "@/lib/components/layouts";
import { Metadata } from "next";

export const metadata: Metadata = {
  title: "Lịch thi",
  description: "Lịch thi",
};

export default function AdminConsoleLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return <ClientLayout>{children}</ClientLayout>;
}
