"use client";

import { Box, SxProps, Theme, useMediaQuery } from "@mui/material";

import theme from "@/lib/theme";
import CustomHeader from "./header";

const CustomLayout = ({ children }: { children: React.ReactNode }) => {
  const isOversize = useMediaQuery(theme.breakpoints.up("oversize"));
  const isDesktop = useMediaQuery(theme.breakpoints.up("desktop"));
  const isTablet = useMediaQuery(theme.breakpoints.up("tablet"));

  const responsivePadding = isOversize
    ? "160px"
    : isDesktop
    ? "64px"
    : isTablet
    ? "32px"
    : "16px";

  return (
    <Box component="main" paddingX={responsivePadding} sx={layoutStyles}>
      <CustomHeader />
      <Box marginTop={2}>{children}</Box>
    </Box>
  );
};

export default CustomLayout;

const layoutStyles: SxProps<Theme> = {
  position: "relative",
  maxWidth: "1920px",
  margin: "auto",
};
