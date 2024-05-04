"use client";

import { useEffect, useRef, useState } from "react";

import { Button, Stack, SxProps, Theme } from "@mui/material";

import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import {
  getSelfConversationHistoriesPreviousThunk,
  getSelfConversationHistoriesThunk,
} from "@/lib/redux/features/chat-bot/conversation-history/conversationHistoryActions";
import ErrorRetrieveData from "@/lib/components/error-retrieve-data";
import EmptyDataPlaceholder from "@/lib/components/empty-data";
import LoadingData from "@/lib/components/loading-data";
import {
  appendSelfPreviousConversationHistories,
  resetConversationHistoryStatus,
} from "@/lib/redux/features/chat-bot/conversation-history/conversationHistorySlice";
import { ToastInformation } from "@/lib/types/component";
import CustomToast from "@/lib/components/toast";
import MessageItem from "./MessageItem";

const ConversationMessageBox = () => {
  const dispatch = useAppDispatch();
  const {
    listSelfConversationLoading,
    listSelfConversationError,
    selfConversationDataResponse,
    listPreviousLoading,
    listPrevious,
    listPreviousError,
  } = useAppSelector((state) => state.conversationHistory);

  const containerRef = useRef<HTMLDivElement>(null);
  const [page, setPage] = useState(1);
  const [action, setAction] = useState<"add" | "loadPrevious">("add");
  const [toastInfo, setToastInfo] = useState<ToastInformation>();
  const [openToast, setOpenToast] = useState<boolean>(false);

  const handleLoadPrevious = () => {
    setPage((prev) => prev + 1);
    setAction("loadPrevious");
    dispatch(getSelfConversationHistoriesPreviousThunk({ page: page + 1 }));
  };

  useEffect(() => {
    if (
      containerRef.current &&
      selfConversationDataResponse &&
      selfConversationDataResponse.data.length > 0
    ) {
      if (action === "add") {
        containerRef.current.scrollTop = containerRef.current.scrollHeight; // Scroll to the bottom
      } else if (action === "loadPrevious") {
        containerRef.current.scrollTop = 0; // Scroll to the top
      }
    }
  }, [selfConversationDataResponse?.data, action]);

  useEffect(() => {
    dispatch(getSelfConversationHistoriesThunk());
  }, []);

  useEffect(() => {
    if (listPrevious.length > 0) {
      dispatch(appendSelfPreviousConversationHistories({ listPrevious }));
      dispatch(resetConversationHistoryStatus({ keys: ["listPrevious"] }));
    } else if (listPreviousError) {
      setOpenToast(true);
      setToastInfo({
        severity: "error",
        title: "Thất bại",
        message: listPreviousError,
      });
      dispatch(resetConversationHistoryStatus({ keys: ["listPreviousError"] }));
    }
  }, [listPrevious, listPreviousError]);

  if (listSelfConversationLoading)
    return (
      <Stack sx={{ width: "100%", height: "100%" }}>
        <LoadingData />
      </Stack>
    );
  else if (listSelfConversationError)
    return (
      <Stack sx={{ width: "100%", height: "100%" }}>
        <ErrorRetrieveData />
      </Stack>
    );
  else if (selfConversationDataResponse?.data.length === 0)
    return (
      <Stack sx={{ width: "100%", height: "100%" }}>
        <EmptyDataPlaceholder />
      </Stack>
    );

    console.log(selfConversationDataResponse?.data)

  return (
    <>
      <Stack direction="column" gap={2} ref={containerRef} sx={containerStyles}>
        {selfConversationDataResponse?.data.map((cm, index) =>
          index === 0 ? (
            <Stack key={index}>
              {(page < selfConversationDataResponse.totalPages) && (
                <Button
                  variant="contained"
                  color="secondary"
                  onClick={handleLoadPrevious}
                  sx={loadPreviousConversationMessagesBtnStyles}
                  disabled={listPreviousLoading}
                >
                  {listPreviousLoading ? "Đang tải..." : "Tải thêm hội thoại"}
                </Button>
              )}

              <Stack direction="column" gap={2}>
                <MessageItem type="question" message={cm} />
                <MessageItem type="answer" message={cm} />
              </Stack>
            </Stack>
          ) : (
            <Stack direction="column" gap={2} key={index}>
              <MessageItem type="question" message={cm} />
              <MessageItem type="answer" message={cm} />
            </Stack>
          )
        )}
      </Stack>
      {openToast && (
        <CustomToast
          id="conversation-history-load-previous-toast"
          open={openToast}
          handleClose={() => setOpenToast(false)}
          title={toastInfo?.title!}
          message={toastInfo?.message!}
          severity={toastInfo?.severity}
        />
      )}
    </>
  );
};

export default ConversationMessageBox;

const containerStyles: SxProps<Theme> = {
  width: "100%",
  height: "calc(100vh - 20px)",
  overflow: "scroll",
};

const boxStyles: SxProps<Theme> = {
  height: "100px",
  width: "100px",
  backgroundColor: "green",
  marginTop: 1,
};

const loadPreviousConversationMessagesBtnStyles: SxProps<Theme> = {
  width: "fit-content",
  margin: "0px auto 24px",
};
