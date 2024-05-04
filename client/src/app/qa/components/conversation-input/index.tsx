"use client";

import { ChangeEvent, KeyboardEvent, useEffect, useState } from "react";

import { Button, Stack, SxProps, TextField, Theme } from "@mui/material";
import { PaperPlaneTilt } from "@phosphor-icons/react";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import CustomLoadingButton from "@/lib/components/loading-button";
import { addNewConversationHistoryThunk } from "@/lib/redux/features/chat-bot/conversation-history/conversationHistoryActions";
import { IConversationResponse } from "@/lib/types/backend";
import {
  appendSelfConversationHistoryLast,
  removeSelfConversationHistoryLast,
  resetConversationHistoryStatus,
} from "@/lib/redux/features/chat-bot/conversation-history/conversationHistorySlice";
import { ToastInformation } from "@/lib/types/component";

const ConversationInput = () => {
  // Redux
  const dispatch = useAppDispatch();
  const { savedConversation, saveConversationLoading, saveConversationError } =
    useAppSelector((state) => state.conversationHistory);

  const [question, setQuestion] = useState<string>("");
  const [toastInfo, setToastInfo] = useState<ToastInformation>();
  const [openToast, setOpenToast] = useState<boolean>(false);

  const handleQuestionChange = (e: ChangeEvent<HTMLInputElement>) => {
    setQuestion(e.target.value);
  };

  const handleSendQuestion = () => {
    if (question) {
      const newMessage: IConversationResponse = {
        id: -1,
        username: "",
        question: question,
        answer: "...",
        imageLink: null,
        createdDate: 0,
        lastModifiedDate: null,
      };

      dispatch(addNewConversationHistoryThunk({ query: question }));
      dispatch(appendSelfConversationHistoryLast({ selfConversationHistory: newMessage }));
      setQuestion("");
    }
  };

  const handleKeyDown = (e: KeyboardEvent<HTMLInputElement>) => {
    if (e.key === "Enter") {
      handleSendQuestion();
    }
  };

  useEffect(() => {
    if (savedConversation) {
      dispatch(removeSelfConversationHistoryLast());
      dispatch(appendSelfConversationHistoryLast({ selfConversationHistory: savedConversation }));
      dispatch(resetConversationHistoryStatus({ keys: ["savedConversation"] }));
    } else if (saveConversationError) {
      setOpenToast(true);
      setToastInfo({
        severity: "error",
        title: "Thất bại",
        message: saveConversationError,
      });
      dispatch(removeSelfConversationHistoryLast());
      dispatch(resetConversationHistoryStatus({ keys: ["saveConversationError"] }));
    }
  }, [savedConversation, saveConversationError]);

  return (
    <Stack sx={containerStyles}>
      <TextField
        sx={inputStyles}
        placeholder="Nhập câu hỏi của bạn..."
        value={question}
        onChange={handleQuestionChange}
        onKeyDown={handleKeyDown}
        InputProps={{
          endAdornment: (
            <>
              {saveConversationLoading ? (
                <CustomLoadingButton sx={{ height: "42px" }} />
              ) : (
                <Button
                  variant="contained"
                  color="primary"
                  onClick={handleSendQuestion}
                  disabled={!question}
                >
                  <PaperPlaneTilt size={28} />
                </Button>
              )}
            </>
          ),
        }}
      />
    </Stack>
  );
};

export default ConversationInput;

const containerStyles: SxProps<Theme> = {
  width: "100%",
  height: "fit-content",
  flexDirection: "row",
  alignItems: "center",
  justifyContent: "center",
};

const inputStyles: SxProps<Theme> = {
  "& .MuiInputBase-input": {
    height: "40px !important",
  },
};
