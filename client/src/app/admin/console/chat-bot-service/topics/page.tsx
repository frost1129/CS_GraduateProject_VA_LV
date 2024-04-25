import { Stack, SxProps, Theme } from "@mui/material";

import TopicHeader from "./components/topic-header";
import TopicRenderTable from "./components/topic-render-table";

const TopicManagementPage = () => {
  return (
    <Stack direction="column" sx={pageContainerStyles}>
      <TopicHeader />
      <TopicRenderTable />
    </Stack>
  );
};

export default TopicManagementPage;

const pageContainerStyles: SxProps<Theme> = {
  paddingTop: 2,
  paddingBottom: 3,
  height: "calc(100vh - var(--height-header))",
};
