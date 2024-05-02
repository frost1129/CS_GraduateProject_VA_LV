import { Stack, SxProps, Theme } from "@mui/material";
import ConversationHistoryHeader from "./components/conversation-history-header";
import ConversationHistoryRenderTable from "./components/conversation-history-render-table";

const ConversationHistory = () => {
  return (
    <Stack direction="column" sx={pageContainerStyles}>
      <ConversationHistoryHeader />
      <ConversationHistoryRenderTable />
    </Stack>
  );
};

export default ConversationHistory;

const pageContainerStyles: SxProps<Theme> = {
  paddingTop: 2,
  paddingBottom: 3,
  height: "calc(100vh - var(--height-header))",
};
