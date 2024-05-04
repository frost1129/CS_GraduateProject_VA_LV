"use client";

import { Box, Typography } from "@mui/material";

import { useAppSelector } from "@/lib/redux/store";
import { ClientLayout } from "@/lib/components/layouts";

const HomePage = () => {
  const { userProfile } = useAppSelector((state) => state.auth);

  return (
    <ClientLayout>
      <Box>
        <Typography>{userProfile?.name}</Typography>
      </Box>
    </ClientLayout>
  );
};

export default HomePage;
