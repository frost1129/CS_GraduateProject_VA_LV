import { Box, Stack, SxProps, Theme, Typography } from "@mui/material";
import { GridColDef } from "@mui/x-data-grid";

import axiosServer from "@/lib/redux/apis/axiosServer";
import { ICategoryResponse } from "@/lib/types/backend";
import NoData from "@/lib/components/no-data";
import CategoryRenderTable from "./components/category-render-table";

const fetchCategoryData = async () => {
  try {
    return (
      await axiosServer.get(
        `${process.env.NEXT_PUBLIC_API_HOST_CHAT_BOT_SERVICE}/categories`
      )
    ).data;
  } catch (error: any) {
    console.log(error.response);
  }
};

const CategoryManagementPage = async () => {
  const rows: ICategoryResponse[] = (await fetchCategoryData()) || [];
  const columns: GridColDef<(typeof rows)[number]>[] = [
    {
      field: "id",
      headerName: "ID",
      width: 50,
      align: "center",
      headerAlign: "center",
    },
    {
      field: "intentCode",
      headerName: "Intent",
      width: 200,
      editable: false,
    },
    {
      field: "description",
      headerName: "Description",
      flex: 1,
      editable: false,
    },
    {
      field: "createdDate",
      headerName: "Created Date",
      type: "number",
      width: 200,
      editable: false,
    },
    {
      field: "lastModifiedDate",
      headerName: "Last Modified Date",
      type: "number",
      width: 200,
      editable: false,
    },
  ];

  return (
    <Stack direction="column" sx={pageContainerStyles}>
      <Box sx={{ marginBottom: 2 }}>
        <Typography variant="h4">Categories</Typography>
      </Box>
      {rows.length > 0 ? (
        <CategoryRenderTable rows={rows} columns={columns} />
      ) : (
        <NoData />
      )}
    </Stack>
  );
};

export default CategoryManagementPage;

const pageContainerStyles: SxProps<Theme> = {
  paddingTop: 2,
  paddingBottom: 3,
  height: "calc(100vh - var(--height-header))",
};
