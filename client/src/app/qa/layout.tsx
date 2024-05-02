import { ClientLayout } from "@/lib/components/layouts";
import { Metadata } from "next";

export const metadata: Metadata = {
  title: "Hỏi đáp học vụ",
  description: "Hỏi đáp học vụ",
};

export default function AdminConsoleLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return <ClientLayout>{children}</ClientLayout>;
}
