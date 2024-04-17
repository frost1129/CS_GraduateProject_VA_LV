import { Box, Stack, SxProps, Theme, Typography } from "@mui/material";
import { GridColDef } from "@mui/x-data-grid";

import CustomDataGrid from "@/lib/components/data-grid";
import axiosServer from "@/lib/redux/apis/axiosServer";
import DataShower from "./components/DataShower";

const fetchData = async () => {
  try {
    return (
      await axiosServer.get(
        `${process.env.NEXT_PUBLIC_API_HOST_CHAT_BOT_SERVICE}/contents`
      )
    ).data;
  } catch (error: any) {
    console.log(error.response);
  }
};

const CategoryManagementPage = async () => {
  return (
    <Stack direction="column" sx={pageContainerStyles}>
      <DataShower data={(await fetchData())} />
      <Box sx={{ marginBottom: 2 }}>
        <Typography variant="h4">Categories</Typography>
      </Box>
      <CustomDataGrid rows={rows} colums={columns} />
    </Stack>
  );
};

export default CategoryManagementPage;

const pageContainerStyles: SxProps<Theme> = {
  paddingTop: 2,
  paddingBottom: 3,
  height: "calc(100vh - var(--height-header))",
};

const columns: GridColDef<(typeof rows)[number]>[] = [
  { field: "id", headerName: "ID", width: 90 },
  {
    field: "firstName",
    headerName: "First name",
    width: 150,
    editable: true,
  },
  {
    field: "lastName",
    headerName: "Last name",
    width: 150,
    editable: true,
  },
  {
    field: "age",
    headerName: "Age",
    type: "number",
    width: 110,
    editable: true,
  },
];

const rows = [
  { id: 1, lastName: "Snow", firstName: "Jon", age: 14 },
  { id: 2, lastName: "Lannister", firstName: "Cersei", age: 31 },
  { id: 3, lastName: "Lannister", firstName: "Jaime", age: 31 },
  { id: 4, lastName: "Stark", firstName: "Arya", age: 11 },
  { id: 5, lastName: "Targaryen", firstName: "Daenerys", age: null },
  { id: 6, lastName: "Melisandre", firstName: null, age: 150 },
  { id: 7, lastName: "Clifford", firstName: "Ferrara", age: 44 },
  { id: 8, lastName: "Frances", firstName: "Rossini", age: 36 },
  { id: 9, lastName: "Roxie", firstName: "Harvey", age: 65 },
];
