"use client";

import { Stack, Typography, useMediaQuery } from "@mui/material";

import theme from "@/lib/theme";
import ContentFilter from "../content-filter";
import ContentCreator from "../content-creator";

const ContentHeader = () => {
  const isTablet = useMediaQuery(theme.breakpoints.up("tablet"));

  return (
    <Stack
      direction={isTablet ? "row" : "column"}
      justifyContent="space-between"
      sx={{ marginBottom: 2 }}
      gap={1}
    >
      <Typography variant="h4" marginBottom={isTablet ? 0 : 1}>
        Nội dung học vụ
      </Typography>
      <Stack
        direction={isTablet ? "row" : "column-reverse"}
        alignItems="center"
        gap={2}
      >
        <ContentFilter />
        <ContentCreator />
      </Stack>
    </Stack>
  );
};

export default ContentHeader;
