"use client";

import { Box, useMediaQuery } from "@mui/material";

import theme from "@/lib/theme";

const CategoryFilter = () => {
  const isTablet = useMediaQuery(theme.breakpoints.up("tablet"));
  return <Box>CategoryFilter</Box>;
};

export default CategoryFilter;
