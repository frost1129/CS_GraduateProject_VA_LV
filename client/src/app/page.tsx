"use client";

import { useAppSelector } from "@/lib/redux/store";
import { Typography } from "@mui/material"

const HomePage = () => {
  const { userProfile } = useAppSelector(state => state.auth);
  console.log(userProfile)
  return (
    <Typography>{userProfile?.name}hhh</Typography>
  )
}

export default HomePage