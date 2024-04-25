import { Metadata } from "next";

export const metadata: Metadata = {
  title: "Chủ đề | Bảng điều khiển",
  description: "Chủ đề | Bảng điều khiển",
};

export default function AdminConsoleLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return <>{children}</>;
}
