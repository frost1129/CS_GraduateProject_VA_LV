import { Metadata } from "next";

export const metadata: Metadata = {
  title: "Lịch sử hỏi đáp | Bảng điều khiển",
  description: "Lịch sử hỏi đáp | Bảng điều khiển",
};

export default function AdminConsoleLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return <>{children}</>;
}
