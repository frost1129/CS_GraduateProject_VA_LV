"use client";

import { useEffect, useState } from "react";

import { GridColDef } from "@mui/x-data-grid";

import CustomDataGrid from "@/lib/components/data-grid";
import ErrorRetrieveData from "@/lib/components/error-retrieve-data";
import LoadingData from "@/lib/components/loading-data";
import NoData from "@/lib/components/no-data";
import { useAppSelector } from "@/lib/redux/store";
import { convertMillisecondsToDate } from "@/lib/utils";
import ContentActions from "../content-actions";

const ContentRenderTable = () => {
  const { contents, listContentLoading, listContentError } = useAppSelector(
    (state) => state.content
  );

  const [newColumns, setNewColumns] = useState<any>();

  useEffect(() => {
    const columns: GridColDef<(typeof contents)[number]>[] = [
      {
        field: "id",
        headerName: "ID",
        width: 50,
        align: "center",
        headerAlign: "center",
      },
      {
        field: "intentCode",
        headerName: "Chuỗi xác định",
        width: 250,
        editable: false,
      },
      {
        field: "topic",
        headerName: "Chủ đề",
        width: 300,
        editable: false,
        valueGetter: (value: any) => value.description,
      },
      {
        field: "title",
        headerName: "Tiêu đề",
        width: 300,
        editable: false,
      },
      {
        field: "text",
        headerName: "Nội dung",
        width: 300,
        editable: false,
      },
      {
        field: "createdDate",
        headerName: "Ngày tạo",
        type: "number",
        width: 200,
        editable: false,
        headerAlign: "right",
        align: "right",
        valueGetter: (value: any) => convertMillisecondsToDate(value),
      },
      {
        field: "lastModifiedDate",
        headerName: "Ngày chỉnh sửa",
        type: "number",
        width: 200,
        editable: false,
        headerAlign: "right",
        align: "right",
        valueGetter: (value: any) => {
          if (value === null) return "-";
          else return convertMillisecondsToDate(value);
        },
      },
      {
        field: "actions",
        headerName: "Tác vụ",
        width: 150,
        editable: false,
        headerAlign: "center",
        sortable: false,
        renderCell: (value) => <ContentActions value={value.row} />,
      },
    ];
    setNewColumns(columns);
  }, []);

  if (listContentLoading) return <LoadingData />;
  else if (contents.length === 0) return <NoData />;
  else if (listContentError !== null) return <ErrorRetrieveData />;

  return <CustomDataGrid rows={contents} columns={newColumns} />;
};

export default ContentRenderTable;
