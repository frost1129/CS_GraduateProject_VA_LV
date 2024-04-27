import { Metadata } from "next";

export const metadata: Metadata = {
  title: "Nội dung học vụ | Bảng điều khiển",
  description: "Nội dung học vụ | Bảng điều khiển",
};

export default function AdminConsoleLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return <>{children}</>;
}
