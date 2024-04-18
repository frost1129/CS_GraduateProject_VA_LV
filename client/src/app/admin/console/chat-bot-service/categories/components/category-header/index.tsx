"use client";

import { Stack, Typography, useMediaQuery } from "@mui/material";

import theme from "@/lib/theme";
import CategoryCreator from "../category-creator";
import CategoryFilter from "../category-filter";

const CategoryHeader = () => {
  const isTablet = useMediaQuery(theme.breakpoints.up("tablet"));

  return (
    <Stack
      direction={isTablet ? "row" : "column"}
      justifyContent="space-between"
      sx={{ marginBottom: 2 }}
      gap={1}
    >
      <Typography variant="h4" marginBottom={isTablet ? 0 : 1}>
        Categories
      </Typography>
      <Stack
        direction={isTablet ? "row" : "column-reverse"}
        alignItems="center"
        gap={2}
      >
        <CategoryFilter />
        <CategoryCreator />
      </Stack>
    </Stack>
  );
};

export default CategoryHeader;
