"use client";

import { useState } from "react";

import {
  Box,
  ClickAwayListener,
  Collapse,
  Grid,
  Stack,
  SxProps,
  Theme,
  useMediaQuery,
} from "@mui/material";

import theme from "@/lib/theme";
import { AdminHeader, ClientHeader } from "./header";
import CustomDrawer from "./drawer";

export const ClientLayout = ({ children }: { children: React.ReactNode }) => {
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
      <ClientHeader />
      <Box marginTop={2}>{children}</Box>
    </Box>
  );
};

export const AdminLayout = ({ children }: { children: React.ReactNode }) => {
  const isOversize = useMediaQuery(theme.breakpoints.up("oversize"));
  const isDesktop = useMediaQuery(theme.breakpoints.up("desktop"));
  const isTablet = useMediaQuery(theme.breakpoints.up("tablet"));

  const [openDrawer, setOpenDrawer] = useState(true);

  const responsivePadding = isOversize
    ? "160px"
    : isDesktop
    ? "64px"
    : isTablet
    ? "32px"
    : "16px";

  return (
    <Stack
      direction="row"
      component="main"
      paddingX={responsivePadding}
      sx={layoutStyles}
    >
      <Grid container columnSpacing={3}>
        {isDesktop && openDrawer && (
          <Grid item oversize={3} desktop={3}>
            <CustomDrawer />
          </Grid>
        )}
        {!isDesktop && !openDrawer && (
          <ClickAwayListener onClickAway={() => setOpenDrawer((prev) => !prev)}>
            <Stack sx={absoluteDrawerStyles}>
              <CustomDrawer />
            </Stack>
          </ClickAwayListener>
        )}
        <Grid item flex={1}>
          <AdminHeader setDrawerOpen={setOpenDrawer} />
          {children}
        </Grid>
      </Grid>
    </Stack>
  );
};

const layoutStyles: SxProps<Theme> = {
  position: "relative",
  height: "100vh",
};

const absoluteDrawerStyles: SxProps<Theme> = {
  position: "absolute",
  zIndex: 9999,
  width: "280px",
  backgroundColor: "var(--white)",
  height: "100%",
  paddingLeft: "8px",
};
