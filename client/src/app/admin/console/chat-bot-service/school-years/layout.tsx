import { Metadata } from "next";

export const metadata: Metadata = {
  title: "Năm học | Bảng điều khiển",
  description: "Năm học | Bảng điều khiển",
};

export default function AdminConsoleLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return <>{children}</>;
}
