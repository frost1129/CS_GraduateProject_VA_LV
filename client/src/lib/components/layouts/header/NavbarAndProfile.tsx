"use client";

import { useState } from "react";
import Link from "next/link";

import {
  Box,
  Divider,
  MenuItem,
  Popover,
  Stack,
  SxProps,
  Theme,
  Typography,
  useMediaQuery,
} from "@mui/material";
import { List, SignOut, UserCircle } from "@phosphor-icons/react";

import theme from "@/lib/theme";
import Profile from "./Profile";

const NavbarAndProfile = () => {
  const isTablet = useMediaQuery(theme.breakpoints.up("tablet"));

  const [anchorEl, setAnchorEl] = useState<HTMLButtonElement | null>(null);

  const handleClick = (event: React.MouseEvent<HTMLButtonElement>) => {
    setAnchorEl(event.currentTarget);
  };

  const handleClose = () => {
    setAnchorEl(null);
  };

  const handleLogout = () => {
    handleClose();
  };

  const open = Boolean(anchorEl);
  const id = open ? "nav-actions" : undefined;

  return (
    <>
      {isTablet ? (
        <Stack direction="row">
          <Stack
            direction="row"
            justifyContent="space-between"
            alignItems="center"
            marginRight={3}
            gap={2}
          >
            {navItems.map((item) => (
              <Box key={item.id} sx={navItemStyles}>
                <Typography variant="body2">{item.title}</Typography>
              </Box>
            ))}
          </Stack>
          <Profile />
        </Stack>
      ) : (
        <>
          <Stack component="button" className="reset-btn" onClick={handleClick}>
            <List size={32} />
          </Stack>
          <Popover
            id={id}
            open={open}
            anchorEl={anchorEl}
            onClose={handleClose}
            anchorOrigin={{
              vertical: "bottom",
              horizontal: "right",
            }}
            transformOrigin={{
              vertical: "top",
              horizontal: "right",
            }}
            sx={popoverStyles}
          >
            <Link href="/profile">
              <MenuItem onClick={handleClose}>
                <Stack direction="row" alignItems="center" gap={1}>
                  <UserCircle size={24} />
                  <Typography variant="body2">Trang cá nhân</Typography>
                </Stack>
              </MenuItem>
            </Link>
            <Divider sx={{ marginY: 1 }} />
            {navItems.map((item) => (
              <Box key={item.id} sx={navItemStyles}>
                <Typography variant="body2">{item.title}</Typography>
              </Box>
            ))}
            <Divider sx={{ marginY: 1 }} />
            <Link href="/auth/login">
              <MenuItem onClick={handleLogout} sx={logoutBtnStyles}>
                <Stack direction="row" alignItems="center" gap={1}>
                  <SignOut size={24} />
                  <Typography variant="body2">Đăng xuất</Typography>
                </Stack>
              </MenuItem>
            </Link>
          </Popover>
        </>
      )}
    </>
  );
};

export default NavbarAndProfile;

const navItemStyles: SxProps<Theme> = {
  padding: "10px 20px",
  borderRadius: "6px",
  "&:hover": {
    backgroundColor: "var(--primary)",
    color: "var(--white)",
    cursor: "pointer",
  },
};

const popoverStyles: SxProps<Theme> = {
  "& .MuiPaper-root": {
    minWidth: "260px",
    padding: 1,
    marginTop: "12px",
    boxShadow: "0px 2px 4px 0px rgba(30, 32, 32, 0.4)",
  },
};

const logoutBtnStyles: SxProps<Theme> = {
  color: "var(--alert)",
  ":hover": {
    backgroundColor: "var(--alert)",
    color: "var(--white)",
  },
};

const navItems = [
  {
    id: 1,
    title: "Nav 1",
    link: "#",
  },
  {
    id: 2,
    title: "Nav 2",
    link: "#",
  },
  {
    id: 3,
    title: "Nav 3",
    link: "#",
  },
  {
    id: 4,
    title: "Nav 4",
    link: "#",
  },
];
