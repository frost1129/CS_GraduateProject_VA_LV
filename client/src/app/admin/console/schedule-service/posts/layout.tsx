import { Metadata } from "next";

export const metadata: Metadata = {
  title: "Bài đăng | Bảng điều khiển",
  description: "Bài đăng | Bảng điều khiển",
};

export default function AdminConsoleLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return <>{children}</>;
}