"use client";

import { Stack, Typography, useMediaQuery } from "@mui/material";

import theme from "@/lib/theme";
import TopicFilter from "../topic-filter";
import TopicCreator from "../topic-creator";

const TopicHeader = () => {
  const isTablet = useMediaQuery(theme.breakpoints.up("tablet"));

  return (
    <Stack
      direction={isTablet ? "row" : "column"}
      justifyContent="space-between"
      sx={{ marginBottom: 2 }}
      gap={1}
    >
      <Typography variant="h4" marginBottom={isTablet ? 0 : 1}>
        Chủ đề
      </Typography>
      <Stack
        direction={isTablet ? "row" : "column-reverse"}
        alignItems="center"
        gap={2}
      >
        <TopicFilter />
        <TopicCreator />
      </Stack>
    </Stack>
  );
};

export default TopicHeader;
