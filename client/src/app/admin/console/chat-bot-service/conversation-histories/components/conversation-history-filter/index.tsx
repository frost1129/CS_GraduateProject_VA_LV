"use client";

import { ChangeEvent, useEffect, useState } from "react";
import { useRouter } from "next/navigation";

import { TextField } from "@mui/material";
import { MagnifyingGlass } from "@phosphor-icons/react";

import Routes from "@/lib/constants/Routes";
import { useAppDispatch } from "@/lib/redux/store";
import { getConversationHistoriesThunk } from "@/lib/redux/features/chat-bot/conversation-history/conversationHistoryActions";

const ConversationHistoryFilter = () => {
  const router = useRouter();

  const dispatch = useAppDispatch();

  const [keyword, setKeyword] = useState("");

  const handleKeywordChange = (e: ChangeEvent<HTMLInputElement>) => {
    setKeyword(e.target.value);
  };

  const handleSearch = (e: React.KeyboardEvent<HTMLInputElement>) => {
    if (e.key === "Enter") {
      router.replace(
        Routes.ADMIN_ROUTES.CHAT_BOT_SERVICE.CONVERSATION_HISTORIES +
          `${keyword !== "" ? `?username=${keyword}` : ""}`
      );
      dispatch(getConversationHistoriesThunk({ username: keyword }));
    }
  };

  useEffect(() => {
    if (typeof window !== "undefined") {
      const queryParams = new URLSearchParams(window.location.search);
      const username = queryParams.get("username");
      setKeyword(username ?? "");

      dispatch(getConversationHistoriesThunk({ username: username ?? "" }));
    }
  }, []);

  return (
    <TextField
      sx={{ minWidth: "250px" }}
      placeholder="Tìm theo tên người dùng..."
      value={keyword}
      onChange={handleKeywordChange}
      onKeyDown={handleSearch}
      InputProps={{
        endAdornment: (
          <MagnifyingGlass size={32} style={{ color: "var(--primary)" }} />
        ),
      }}
    />
  );
};

export default ConversationHistoryFilter;
