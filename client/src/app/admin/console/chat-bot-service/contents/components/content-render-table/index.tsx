"use client";

import { useEffect, useState } from "react";

import { GridColDef } from "@mui/x-data-grid";

import CustomDataGrid from "@/lib/components/data-grid";
import ErrorRetrieveData from "@/lib/components/error-retrieve-data";
import LoadingData from "@/lib/components/loading-data";
import NoData from "@/lib/components/no-data";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { convertMillisecondsToDate } from "@/lib/utils";
import ContentActions from "../content-actions";
import { IContentResponse } from "@/lib/types/backend";
import { getContentsV2Thunk } from "@/lib/redux/features/chat-bot/content/contentActions";
import { ContentRequestParams } from "@/lib/types/redux";
import { useRouter } from "next/navigation";
import Routes from "@/lib/constants/Routes";

const ContentRenderTable = () => {
  const dispatch = useAppDispatch();
  const { contentDataResponse, listContentLoadingV2, listContentErrorV2 } =
    useAppSelector((state) => state.content);

  const router = useRouter();

  const [newColumns, setNewColumns] = useState<any>();

  const handlePageChange = (_: React.ChangeEvent<unknown>, value: number) => {
    let searchParams: ContentRequestParams = {};

    const queryParams = new URLSearchParams(window.location.search);

    const queryParts = [];

    const kw = queryParams.get("kw");
    if (kw) {
      queryParts.push(`kw=${encodeURIComponent(kw)}`);
      searchParams = { ...searchParams, keyword: kw };
    }

    const topicId = queryParams.get("topicId");
    if (topicId) {
      queryParts.push(`topicId=${encodeURIComponent(topicId)}`);
      searchParams = { ...searchParams, keyword: topicId };
    }

    const sYear = queryParams.get("sYear");
    if (sYear) {
      queryParts.push(`sYear=${encodeURIComponent(sYear)}`);
      searchParams = { ...searchParams, keyword: sYear };
    }

    queryParts.push(`page=${encodeURIComponent(value)}`);

    const queryString = queryParts.length > 0 ? `?${queryParts.join("&")}` : "";

    router.replace(Routes.ADMIN_ROUTES.CHAT_BOT_SERVICE.CONTENTS + queryString);
    dispatch(getContentsV2Thunk({ ...searchParams, page: value }));
  };

  useEffect(() => {
    const columns: GridColDef<IContentResponse[][number]>[] = [
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

  if (listContentLoadingV2) return <LoadingData />;
  else if (contentDataResponse?.data.length === 0) return <NoData />;
  else if (listContentErrorV2 !== null) return <ErrorRetrieveData />;

  return (
    <CustomDataGrid
      rows={contentDataResponse?.data}
      columns={newColumns}
      pagination={{
        currentPage: contentDataResponse?.currentPage || null,
        pageSize: contentDataResponse?.pageSize || null,
        totalPages: contentDataResponse?.totalPages || null,
      }}
      onPageChange={handlePageChange}
    />
  );
};

export default ContentRenderTable;
