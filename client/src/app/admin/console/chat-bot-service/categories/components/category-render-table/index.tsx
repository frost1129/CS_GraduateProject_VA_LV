"use client";

import CustomDataGrid from "@/lib/components/data-grid";
import { CategoryRenderTableProps } from "@/lib/types/component";
import { convertMillisecondsToDate } from "@/lib/utils";
import CategoryActions from "../category-action";
import { useEffect, useState } from "react";

const CategoryRenderTable = (props: CategoryRenderTableProps) => {
  const { rows, columns } = props;

  const [newColumns, setNewColumns] = useState<any>();

  useEffect(() => {
    let editedColumns = columns.map((col) => {
      if (col.field === "createdDate")
        return {
          ...col,
          headerAlign: "right",
          align: "right",
          valueGetter: (value: any) => convertMillisecondsToDate(value),
        };
      if (col.field === "lastModifiedDate")
        return {
          ...col,
          headerAlign: "right",
          align: "right",
          valueGetter: (value: any) => {
            if (value === null) return "-";
            else convertMillisecondsToDate(value);
          },
        };
      return col;
    });

    editedColumns = [
      ...editedColumns,
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

    setNewColumns(editedColumns);
  }, [rows]);

  return <CustomDataGrid rows={rows} columns={newColumns} />;
};

export default CategoryRenderTable;
