"use client";

import { useEffect } from "react";
import Link from "next/link";
import Image from "next/image";
import { useDispatch } from "react-redux";

import { MenuItem, Stack, SxProps, Theme } from "@mui/material";
import { List } from "@phosphor-icons/react";

import { getUserProfileFromLocalStorage } from "@/lib/redux/features/auth/authSlice";
import { AppDispatch } from "@/lib/redux/store";
import { AdminHeaderProps } from "@/lib/types/component";
import NavbarAndProfile from "./NavbarAndProfile";
import Profile from "./Profile";
import { images } from "@/lib/assets/img";
import "./style.scss";

export const ClientHeader = () => {
  const dispatch = useDispatch<AppDispatch>();

  useEffect(() => {
    dispatch(getUserProfileFromLocalStorage());
  }, []);

  return (
    <>
      <Stack
        direction="row"
        component="header"
        paddingX={3}
        justifyContent="space-between"
        alignItems="center"
        className="header"
        marginTop={2}
      >
        <Stack
          direction="row"
          flex={1}
          justifyContent="space-between"
          alignItems="center"
        >
          <Link href="/" style={{ lineHeight: 0 }}>
            <Image src={images.logoOU} alt="logo-ou" width={54} />
          </Link>
          <NavbarAndProfile />
        </Stack>
      </Stack>
    </>
  );
};

export const AdminHeader = (props: AdminHeaderProps) => {
  const { setDrawerOpen } = props;

  const dispatch = useDispatch<AppDispatch>();

  const handleToggleOpenDrawer = () => {
    setDrawerOpen((prev: boolean) => !prev);
  };

  useEffect(() => {
    dispatch(getUserProfileFromLocalStorage());
  }, []);

  return (
    <Stack
      direction="row"
      justifyContent="space-between"
      alignItems="center"
      sx={adminHeaderStyles}
    >
      <MenuItem
        onClick={handleToggleOpenDrawer}
        sx={{ backgroundColor: "var(--grey-primary-40)" }}
      >
        <List size={32} />
      </MenuItem>
      <Profile />
    </Stack>
  );
};

const adminHeaderStyles: SxProps<Theme> = {
  height: 'var(--height-header)'
};
