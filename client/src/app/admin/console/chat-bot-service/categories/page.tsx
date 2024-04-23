import { Stack, SxProps, Theme } from "@mui/material";

import CategoryRenderTable from "./components/category-render-table";
import CategoryHeader from "./components/category-header";

const CategoryManagementPage = () => {
  return (
    <Stack direction="column" sx={pageContainerStyles}>
      <CategoryHeader />
      <CategoryRenderTable />
    </Stack>
  );
};

export default CategoryManagementPage;

const pageContainerStyles: SxProps<Theme> = {
  paddingTop: 2,
  paddingBottom: 3,
  height: "calc(100vh - var(--height-header))",
};
