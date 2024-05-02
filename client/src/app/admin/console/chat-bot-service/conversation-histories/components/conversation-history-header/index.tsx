"use client";

import { Stack, Typography, useMediaQuery } from "@mui/material";

import theme from "@/lib/theme";
import ConversationHistoryFilter from "../conversation-history-filter";

const ConversationHistoryHeader = () => {
    const isTablet = useMediaQuery(theme.breakpoints.up("tablet"));

    return (
      <Stack
        direction={isTablet ? "row" : "column"}
        justifyContent="space-between"
        sx={{ marginBottom: 2 }}
        gap={1}
      >
        <Typography variant="h4" marginBottom={isTablet ? 0 : 1}>
          Lịch sử hỏi đáp
        </Typography>
        <Stack
          direction={isTablet ? "row" : "column-reverse"}
          alignItems="center"
          gap={2}
        >
          <ConversationHistoryFilter />
        </Stack>
      </Stack>
    );
}

export default ConversationHistoryHeader