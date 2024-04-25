"use client";

import { useEffect, useState } from "react";

import { GridColDef } from "@mui/x-data-grid";

import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { convertMillisecondsToDate } from "@/lib/utils";
import { getTopicsThunk } from "@/lib/redux/features/chat-bot/topic/topicActions";
import LoadingData from "@/lib/components/loading-data";
import NoData from "@/lib/components/no-data";
import ErrorRetrieveData from "@/lib/components/error-retrieve-data";
import CustomDataGrid from "@/lib/components/data-grid";
import TopicActions from "../topic-actions";
import { ITopicResponse } from "@/lib/types/backend";

const TopicRenderTable = () => {
  const dispatch = useAppDispatch();
  const { topics, listTopicLoading, listTopicError } = useAppSelector(
    (state) => state.topic
  );

  const [newColumns, setNewColumns] = useState<any>();

  useEffect(() => {
    const columns: GridColDef<(typeof topics)[number]>[] = [
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
        width: 200,
        editable: false,
      },
      {
        field: "description",
        headerName: "Mô tả",
        width: 300,
        editable: false,
      },
      {
        field: "category",
        headerName: "Danh mục",
        width: 300,
        editable: false,
        valueGetter: (value: any) => value.description,
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
        renderCell: (value) => <TopicActions value={value.row} />,
      },
    ];
    setNewColumns(columns);
  }, []);

  useEffect(() => {
    if (typeof window !== "undefined") {
      const queryParams = new URLSearchParams(window.location.search);
      const kw = queryParams.get("kw");
      if (kw !== null) dispatch(getTopicsThunk({ keyword: kw }));
      else dispatch(getTopicsThunk({}));
    }
  }, []);

  if (listTopicLoading) return <LoadingData />;
  else if (topics.length === 0) return <NoData />;
  else if (listTopicError !== null) return <ErrorRetrieveData />;

  return <CustomDataGrid rows={topics} columns={newColumns} />;
};

export default TopicRenderTable;
