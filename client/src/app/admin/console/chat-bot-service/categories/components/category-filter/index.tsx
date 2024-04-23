"use client";

import { ChangeEvent, useEffect, useState } from "react";

import { TextField } from "@mui/material";
import { MagnifyingGlass } from "@phosphor-icons/react";
import { useAppDispatch } from "@/lib/redux/store";
import { getCategoriesThunk } from "@/lib/redux/features/chat-bot/category/categoryActions";
import { useRouter } from "next/navigation";
import Routes from "@/lib/constants/Routes";

const CategoryFilter = () => {
  const router = useRouter();

  const dispatch = useAppDispatch();

  const [keyword, setKeyword] = useState("");

  const handleKeywordChange = (e: ChangeEvent<HTMLInputElement>) => {
    setKeyword(e.target.value);
  };

  const handleSearch = (e: React.KeyboardEvent<HTMLInputElement>) => {
    if (e.key === "Enter") {
      router.replace(
        Routes.ADMIN_ROUTES.CHAT_BOT_SERVICE.CATEGORIES +
          `${keyword !== "" ? `?kw=${keyword}` : ""}`
      );
      dispatch(getCategoriesThunk({ keyword }));
    }
  };

  useEffect(() => {
    if (typeof window !== "undefined") {
      const queryParams = new URLSearchParams(window.location.search);
      const kw = queryParams.get("kw");
      setKeyword(kw === null ? "" : kw);
    }
  }, []);

  return (
    <TextField
      sx={{ minWidth: "250px" }}
      placeholder="Search..."
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

export default CategoryFilter;
