"use client";

import { Box, Typography } from "@mui/material";

import { useAppSelector } from "@/lib/redux/store";
import { ClientLayout } from "@/lib/components/layouts";

const HomePage = () => {
  const { userProfile } = useAppSelector((state) => state.auth);

  return (
    <ClientLayout>
      <Box height={"10000px"}>
        <Typography>{userProfile?.name}</Typography>
      </Box>
    </ClientLayout>
  );
};

export default HomePage;
