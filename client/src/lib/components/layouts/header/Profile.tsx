"use client";

import { useState } from "react";
import Link from "next/link";

import {
  Box,
  MenuItem,
  Popover,
  Stack,
  SxProps,
  Theme,
  Typography,
} from "@mui/material";
import { SignOut, UserCircle } from "@phosphor-icons/react";

import { useAppSelector } from "@/lib/redux/store";
import CustomAvatar from "../../custom-avatar";

const Profile = () => {
  const { userProfile } = useAppSelector((state) => state.auth);

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
  const id = open ? "profile-actions" : undefined;

  return (
    <>
      <Box
        id={id}
        component="button"
        onClick={handleClick}
        className="reset-btn-style"
      >
        <Stack direction="row" alignItems="center" gap={1.5}>
          <Stack direction="column" gap={0.5} alignItems="flex-end">
            <Typography variant="label2">{userProfile?.name}</Typography>
            <Typography variant="body3">{userProfile?.email}</Typography>
          </Stack>
          <Stack>
            <CustomAvatar
              width={45}
              height={45}
              alt="user-avatar"
              sx={{ cursor: "pointer" }}
              className="avatar-ring"
            />
          </Stack>
        </Stack>
      </Box>
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
  );
};

export default Profile;

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
