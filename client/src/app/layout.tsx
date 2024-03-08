import type { Metadata } from "next";
import { Experimental_CssVarsProvider as CssVarsProvider } from "@mui/material/styles";
import { AppRouterCacheProvider } from "@mui/material-nextjs/v14-appRouter";

import StoreProvider from "../lib/redux/store/StoreProvider";
import theme from "@/lib/theme";
import "./globals.scss";
import "./App.scss";

export const metadata: Metadata = {
  title: "OU Graduation",
  description: "OU Graduation",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body>
        <StoreProvider>
          <AppRouterCacheProvider>
            <CssVarsProvider theme={theme}>{children}</CssVarsProvider>
          </AppRouterCacheProvider>
        </StoreProvider>
      </body>
    </html>
  );
}
