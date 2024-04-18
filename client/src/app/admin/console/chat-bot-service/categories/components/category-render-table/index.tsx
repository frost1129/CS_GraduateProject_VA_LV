"use client";

import CustomDataGrid from "@/lib/components/data-grid";
import { CategoryRenderTableProps } from "@/lib/types/component";
import { convertMillisecondsToDate } from "@/lib/utils";
import CategoryActions from "../category-action";
import { useEffect, useState } from "react";
import { GridColDef } from "@mui/x-data-grid";

const CategoryRenderTable = (props: CategoryRenderTableProps) => {
  const { rows } = props;

  const [newColumns, setNewColumns] = useState<any>();

  useEffect(() => {
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
        headerAlign: "right",
        align: "right",
        valueGetter: (value: any) => convertMillisecondsToDate(value),
      },
      {
        field: "lastModifiedDate",
        headerName: "Last Modified Date",
        type: "number",
        width: 200,
        editable: false,
        headerAlign: "right",
        align: "right",
        valueGetter: (value: any) => {
          if (value === null) return "-";
          else convertMillisecondsToDate(value);
        },
      },
      {
        field: "actions",
        headerName: "Actions",
        width: 150,
        editable: false,
        headerAlign: "center",
        sortable: false,
        renderCell: (value) => <CategoryActions value={value.row} />,
      },
    ];

    setNewColumns(columns);
  }, [rows]);

  return <CustomDataGrid rows={rows} columns={newColumns} />;
};

export default CategoryRenderTable;
