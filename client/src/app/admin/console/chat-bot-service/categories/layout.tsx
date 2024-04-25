import { Metadata } from "next";

export const metadata: Metadata = {
  title: "Danh mục | Bảng điều khiển",
  description: "Danh mục | Bảng điều khiển",
};

export default function AdminConsoleLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return <>{children}</>;
}
