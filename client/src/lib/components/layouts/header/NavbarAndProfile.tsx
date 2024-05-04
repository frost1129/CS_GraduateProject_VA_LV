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
import { CalendarCheck, CalendarDots, List, SignOut, Sparkle, UserCircle } from "@phosphor-icons/react";

import theme from "@/lib/theme";
import Routes from "@/lib/constants/Routes";
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
              <Box key={item.id} sx={item.sx}>
                <Link href={item.link}>
                  <Stack direction="row" gap={1} alignItems="center">
                    {item.id === 3 && item.icon}
                    <Typography variant="body2">{item.title}</Typography>
                  </Stack>
                </Link>
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
            <Link href={Routes.ADMIN_ROUTES.CHAT_BOT_SERVICE.CATEGORIES}>
              <MenuItem onClick={handleClose}>
                <Stack direction="row" alignItems="center" gap={1}>
                  <UserCircle size={24} />
                  <Typography variant="body2">Bảng điều khiển</Typography>
                </Stack>
              </MenuItem>
            </Link>
            <Divider sx={{ marginY: 1 }} />
            <Stack direction="column" gap={0.5}>
              {navItems.map((item) => (
                <Box key={item.id} sx={item.sx}>
                  <Link href={item.link}>
                  <Stack direction="row" gap={1} alignItems="center">
                    {item.icon}
                    <Typography variant="body2">{item.title}</Typography>
                  </Stack>
                </Link>
                </Box>
              ))}
            </Stack>
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
    transition: "background-color 0.s, color 0.2s", // Added transition for background
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
    title: "Lịch thi",
    link: Routes.EXAM_TIME_TABLE,
    icon: <CalendarCheck size={24} />,
    sx: { ...navItemStyles },
  },
  {
    id: 2,
    title: "Lịch học",
    link: Routes.TIME_TABLE,
    icon: <CalendarDots size={24} />,
    sx: { ...navItemStyles },
  },
  {
    id: 3,
    title: "Hỏi đáp",
    link: Routes.ACADEMIC_Q_AND_A,
    sx: {
      ...navItemStyles,
      background: "var(--gradient)",
      color: "var(--white)",
      ":hover": { background: "var(--gradient-active)" },
    },
    icon: <Sparkle size={24} />,
  },
];
