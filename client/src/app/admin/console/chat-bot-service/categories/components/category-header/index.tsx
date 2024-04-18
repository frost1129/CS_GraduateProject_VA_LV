"use client";

import { Box, Stack, Typography } from "@mui/material";
import CategoryCreator from "../category-creator";

const CategoryHeader = () => {
  return (
    <Stack
      direction="row"
      justifyContent="space-between"
      alignItems='center'
      sx={{ marginBottom: 2 }}
    >
      <Typography variant="h4">Categories</Typography>
      <Stack direction="row" alignItems="center">
        <CategoryCreator />
      </Stack>
    </Stack>
  );
};

export default CategoryHeader;
