"use client";

import { Box, Typography } from "@mui/material";

import CustomLayout from "@/lib/components/layouts";
import { useAppSelector } from "@/lib/redux/store";

const HomePage = () => {
  const { userProfile } = useAppSelector((state) => state.auth);
  
  return (
    <CustomLayout>
      <Box height={"10000px"}>
        <Typography>
          {userProfile?.name}
        </Typography>
      </Box>
    </CustomLayout>
  );
};

export default HomePage;
