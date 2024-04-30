import { Stack, SxProps, Theme } from "@mui/material";

import SchoolYearHeader from "./components/school-year-header";
import SchoolYearRenderTable from "./components/school-year-render-table";

const SchoolYearPage = () => {
  return (
    <Stack direction="column" sx={pageContainerStyles}>
      <SchoolYearHeader />
      <SchoolYearRenderTable />
    </Stack>
  );
};

export default SchoolYearPage;

const pageContainerStyles: SxProps<Theme> = {
  paddingTop: 2,
  paddingBottom: 3,
  height: "calc(100vh - var(--height-header))",
};
