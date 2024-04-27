import { Stack, SxProps, Theme } from "@mui/material";

import ContentHeader from "./components/content-header";
import ContentRenderTable from "./components/content-render-table";

const ContentPage = () => {
  return (
    <Stack direction="column" sx={pageContainerStyles}>
      <ContentHeader />
      <ContentRenderTable />
    </Stack>
  );
};

export default ContentPage;

const pageContainerStyles: SxProps<Theme> = {
  paddingTop: 2,
  paddingBottom: 3,
  height: "calc(100vh - var(--height-header))",
};
