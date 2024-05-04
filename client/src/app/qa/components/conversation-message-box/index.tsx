"use client";

import { useEffect, useRef, useState } from "react";

import { Button, Stack, SxProps, Theme } from "@mui/material";

import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { getSelfConversationHistoriesThunk } from "@/lib/redux/features/chat-bot/conversation-history/conversationHistoryActions";
import ErrorRetrieveData from "@/lib/components/error-retrieve-data";
import EmptyDataPlaceholder from "@/lib/components/empty-data";
import LoadingData from "@/lib/components/loading-data";
import MessageItem from "./MessageItem";

const ConversationMessageBox = () => {
  const dispatch = useAppDispatch();
  const {
    listSelfConversationLoading,
    listSelfConversationError,
    selfConversationDataResponse,
  } = useAppSelector((state) => state.conversationHistory);

  const containerRef = useRef<HTMLDivElement>(null);
  const [page, setPage] = useState(1);
  const [action, setAction] = useState<"add" | "loadPrevious">("add");

  const handleLoadPrevious = () => {
    setPage((prev) => prev + 1);
    setAction("loadPrevious");
    // dispatch(getSelfConversationHistoriesThunk({ page }));
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
    dispatch(getSelfConversationHistoriesThunk({}));
  }, []);

  console.log("re-render");

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

  return (
    <Stack direction='column' gap={2} ref={containerRef} sx={containerStyles}>
      {selfConversationDataResponse?.data.map((cm, index) =>
        index === 0 ? (
          <Stack key={index}>
            {page < selfConversationDataResponse.totalPages && (
              <Button
                variant="contained"
                color="secondary"
                onClick={handleLoadPrevious}
                sx={loadPreviousConversationMessagesBtnStyles}
              >
                Load previous
              </Button>
            )}

            <Stack direction="column" gap={2}>
              <MessageItem type="question" content={cm.question} />
              <MessageItem type="answer" content={cm.answer} />
            </Stack>
          </Stack>
        ) : (
          <Stack direction="column" gap={2} key={index}>
            <MessageItem type="question" content={cm.question} />
            <MessageItem type="answer" content={cm.answer} />
          </Stack>
        )
      )}
    </Stack>
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
