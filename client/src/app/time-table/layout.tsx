import { ClientLayout } from "@/lib/components/layouts";
import { Metadata } from "next";

export const metadata: Metadata = {
  title: "Lịch học",
  description: "Lịch học",
};

export default function AdminConsoleLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return <ClientLayout>{children}</ClientLayout>;
}
