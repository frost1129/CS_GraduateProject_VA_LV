"use client";

import { ChangeEvent, useEffect, useState } from "react";
import { useRouter } from "next/navigation";

import {
  Autocomplete,
  MenuItem,
  Stack,
  TextField,
  Typography,
  useMediaQuery,
} from "@mui/material";
import { MagnifyingGlass } from "@phosphor-icons/react";

import Routes from "@/lib/constants/Routes";
import { getContentsV2Thunk } from "@/lib/redux/features/chat-bot/content/contentActions";
import { getTopicsThunk } from "@/lib/redux/features/chat-bot/topic/topicActions";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import theme from "@/lib/theme";
import { ITopicResponse } from "@/lib/types/backend";
import { ContentRequestParams } from "@/lib/types/redux";

const ContentFilter = () => {
  const router = useRouter();
  const isTablet = useMediaQuery(theme.breakpoints.up("tablet"));

  const dispatch = useAppDispatch();
  const { topics, listTopicLoading, listTopicError } = useAppSelector(
    (state) => state.topic
  );

  const [keyword, setKeyword] = useState("");
  const [filterByTopicValue, setFilterByTopicValue] =
    useState<ITopicResponse | null>(null);

  const handleKeywordChange = (e: ChangeEvent<HTMLInputElement>) => {
    setKeyword(e.target.value);
  };

  const handleSearchByKeyword = (e: React.KeyboardEvent<HTMLInputElement>) => {
    if (e.key === "Enter") {
      let searchParams: ContentRequestParams = {};
      searchParams = { ...searchParams, keyword };

      const queryParams = new URLSearchParams(window.location.search);

      const queryParts = [];
      keyword && queryParts.push(`kw=${encodeURIComponent(keyword)}`);

      const topicId = queryParams.get("topicId");
      if (topicId) {
        queryParts.push(`topicId=${encodeURIComponent(topicId)}`);
        searchParams = { ...searchParams, topicId };
      }

      const sYear = queryParams.get("sYear");
      if (sYear) {
        queryParts.push(`sYear=${encodeURIComponent(sYear)}`);
        searchParams = { ...searchParams, sYear };
      }

      const queryString =
        queryParts.length > 0 ? `?${queryParts.join("&")}` : "";

      router.replace(
        Routes.ADMIN_ROUTES.CHAT_BOT_SERVICE.CONTENTS + queryString
      );
      dispatch(getContentsV2Thunk(searchParams));
    }
  };

  const handleSearchByTopic = (value: ITopicResponse | null) => {
    let searchParams: ContentRequestParams = {};
    searchParams = { ...searchParams, topicId: value?.id.toString() };

    const queryParams = new URLSearchParams(window.location.search);

    const queryParts = [];

    const kw = queryParams.get("kw");
    if (kw) {
      queryParts.push(`kw=${encodeURIComponent(kw)}`);
      searchParams = { ...searchParams, keyword: kw };
    }

    const sYear = queryParams.get("sYear");
    if (sYear) {
      queryParts.push(`sYear=${encodeURIComponent(sYear)}`);
      searchParams = { ...searchParams, keyword: sYear };
    }

    const page = queryParams.get("page");
    if (page) {
      queryParts.push(`page=${encodeURIComponent(page)}`);
      searchParams = { ...searchParams, page: Number(page) };
    }

    value && queryParts.push(`topicId=${encodeURIComponent(value.id)}`);

    const queryString = queryParts.length > 0 ? `?${queryParts.join("&")}` : "";

    router.replace(Routes.ADMIN_ROUTES.CHAT_BOT_SERVICE.CONTENTS + queryString);
    dispatch(getContentsV2Thunk({ ...searchParams }));
  };

  useEffect(() => {
    topics.length === 0 && dispatch(getTopicsThunk({}));
  }, []);

  useEffect(() => {
    if (typeof window !== "undefined" && topics.length > 0) {
      let searchParams: ContentRequestParams = {};
      const queryParams = new URLSearchParams(window.location.search);

      const kw = queryParams.get("kw");
      if (kw) {
        setKeyword(kw);
        searchParams = { ...searchParams, keyword: kw };
      }

      const page = queryParams.get("page");
      if (page) searchParams = { ...searchParams, page: Number(page) };

      const topicId = queryParams.get("topicId");
      if (topicId) {
        const topicObj = topics.find((t) => t.id === Number(topicId));
        setFilterByTopicValue(topicObj || null);
        topicObj &&
          (searchParams = { ...searchParams, topicId: topicObj.id.toString() });
      }

      dispatch(getContentsV2Thunk(searchParams));
    }
  }, [topics]);

  return (
    <Stack
      direction={isTablet ? "row" : "column"}
      gap={1}
      alignItems="center"
      width="100%"
    >
      <TextField
        sx={{ minWidth: "250px" }}
        placeholder="Nhập từ khóa..."
        value={keyword}
        onChange={handleKeywordChange}
        onKeyDown={handleSearchByKeyword}
        InputProps={{
          endAdornment: (
            <MagnifyingGlass size={32} style={{ color: "var(--primary)" }} />
          ),
        }}
      />
      <Autocomplete
        id="category-select"
        options={topics}
        autoHighlight
        sx={{ minWidth: "250px" }}
        getOptionLabel={(option) => option.description}
        disabled={listTopicLoading || listTopicError !== null}
        isOptionEqualToValue={(option, value) => option.id === value.id}
        value={filterByTopicValue}
        onChange={(_: any, newValue: ITopicResponse | null) => {
          setFilterByTopicValue(newValue);
          handleSearchByTopic(newValue);
        }}
        renderInput={(params) => (
          <TextField {...params} placeholder="Chọn 1 danh mục" />
        )}
        renderOption={(props, option) => (
          <MenuItem
            {...props}
            sx={{ marginX: 1, marginTop: 0.5 }}
            key={option.id}
          >
            <Stack direction="column" gap={0.25}>
              <Typography variant="caption">{option.intentCode}</Typography>
              <Typography variant="body2">{option.description}</Typography>
            </Stack>
          </MenuItem>
        )}
      />
    </Stack>
  );
};

export default ContentFilter;
