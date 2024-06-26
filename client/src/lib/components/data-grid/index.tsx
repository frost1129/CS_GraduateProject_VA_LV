import { DataGrid, GridColDef } from "@mui/x-data-grid";

import { CustomDataGridProps } from "@/lib/types/component";
import CustomPagination from "./CustomPagination";

const CustomDataGrid = (props: CustomDataGridProps) => {
  const {
    rows = [],
    columns,
    hidePagination = false,
    pagination,
    onPageChange,
  } = props;

  return (
    <>
      <DataGrid
        rows={rows || defaultRows}
        columns={columns || defaultColumns}
        disableColumnFilter
        disableColumnMenu
        hideFooter
        autoHeight={false}
      />
      {(!hidePagination || rows.length === 0) && (
        <CustomPagination pagination={pagination} onPageChange={onPageChange} />
      )}
    </>
  );
};

export default CustomDataGrid;

const defaultColumns: GridColDef<(typeof defaultRows)[number]>[] = [
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
  {
    field: "fullName",
    headerName: "Full name",
    description: "This column has a value getter and is not sortable.",
    sortable: false,
    width: 160,
    valueGetter: (value, row) => `${row.firstName || ""} ${row.lastName || ""}`,
  },
];

const defaultRows = [
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
