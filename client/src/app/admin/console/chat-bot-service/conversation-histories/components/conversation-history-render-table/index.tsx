"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";

import { GridColDef } from "@mui/x-data-grid";

import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { IConversationResponse } from "@/lib/types/backend";
import { convertMillisecondsToDate } from "@/lib/utils";
import NoData from "@/lib/components/no-data";
import ErrorRetrieveData from "@/lib/components/error-retrieve-data";
import CustomDataGrid from "@/lib/components/data-grid";
import LoadingData from "@/lib/components/loading-data";
import { ConversationHistoryRequestParams } from "@/lib/types/redux";
import Routes from "@/lib/constants/Routes";
import { getConversationHistoriesThunk } from "@/lib/redux/features/chat-bot/conversation-history/conversationHistoryActions";
import ConversationHistoryActions from "../conversation-history-actions";

const ConversationHistoryRenderTable = () => {
  const router = useRouter();

  const dispatch = useAppDispatch();
  const {
    conversationDataResponse,
    listConversationLoading,
    listConversationError,
  } = useAppSelector((state) => state.conversationHistory);

  const [newColumns, setNewColumns] = useState<any>();

  const handlePageChange = (_: React.ChangeEvent<unknown>, value: number) => {
    let searchParams: ConversationHistoryRequestParams = {};

    const queryParams = new URLSearchParams(window.location.search);

    const queryParts = [];

    const username = queryParams.get("username");
    if (username) {
      queryParts.push(`username=${encodeURIComponent(username)}`);
      searchParams = { ...searchParams, username };
    }
    queryParts.push(`page=${encodeURIComponent(value)}`);

    const queryString = queryParts.length > 0 ? `?${queryParts.join("&")}` : "";

    router.replace(Routes.ADMIN_ROUTES.CHAT_BOT_SERVICE.CONVERSATION_HISTORIES + queryString);
    dispatch(getConversationHistoriesThunk({ ...searchParams, page: value }));
  };

  useEffect(() => {
    const columns: GridColDef<IConversationResponse[][number]>[] = [
      {
        field: "id",
        headerName: "ID",
        width: 50,
        align: "center",
        headerAlign: "center",
      },
      {
        field: "username",
        headerName: "Tên người dùng",
        width: 300,
        editable: false,
      },
      {
        field: "question",
        headerName: "Câu hỏi",
        width: 300,
        editable: false,
      },
      {
        field: "answer",
        headerName: "Câu trả lời",
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
        renderCell: (value) => <ConversationHistoryActions value={value.row} />,
      },
    ];
    setNewColumns(columns);
  }, []);

  if (listConversationLoading) return <LoadingData />;
  else if (
    conversationDataResponse &&
    conversationDataResponse.data.length === 0
  )
    return <NoData />;
  else if (listConversationError !== null) return <ErrorRetrieveData />;

  return (
    <CustomDataGrid
      rows={conversationDataResponse?.data}
      columns={newColumns}
      pagination={{
        currentPage: conversationDataResponse?.currentPage || null,
        pageSize: conversationDataResponse?.pageSize || null,
        totalPages: conversationDataResponse?.totalPages || null,
      }}
      onPageChange={handlePageChange}
    />
  );
};

export default ConversationHistoryRenderTable;
