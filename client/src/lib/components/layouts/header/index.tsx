"use client";

import { useEffect } from "react";
import Link from "next/link";
import Image from "next/image";
import { useDispatch } from "react-redux";

import { Box, Stack, useMediaQuery } from "@mui/material";

import { AppDispatch } from "@/lib/redux/store";
import { getUserProfileFromLocalStorage } from "@/lib/redux/features/auth/authSlice";
import { images } from "@/lib/assets/img";
import NavbarAndProfile from "./NavbarAndProfile";
import "./style.scss";

const CustomHeader = () => {
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

export default CustomHeader;
