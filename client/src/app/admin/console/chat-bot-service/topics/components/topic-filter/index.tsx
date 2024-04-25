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
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { getTopicsThunk } from "@/lib/redux/features/chat-bot/topic/topicActions";
import { getCategoriesThunk } from "@/lib/redux/features/chat-bot/category/categoryActions";
import theme from "@/lib/theme";
import { ICategoryResponse } from "@/lib/types/backend";

const TopicFilter = () => {
  const router = useRouter();
  const isTablet = useMediaQuery(theme.breakpoints.up("tablet"));

  const dispatch = useAppDispatch();
  const { categories, listCategoryLoading, listCategoryError } = useAppSelector(
    (state) => state.category
  );

  const [keyword, setKeyword] = useState("");
  const [filterByCategoryValue, setFilterByCategoryValue] =
    useState<ICategoryResponse | null>(null);

  const handleKeywordChange = (e: ChangeEvent<HTMLInputElement>) => {
    setKeyword(e.target.value);
  };

  const handleSearchByKeyword = (e: React.KeyboardEvent<HTMLInputElement>) => {
    if (e.key === "Enter") {
      let searchParams = {};
      searchParams = { ...searchParams, keyword };

      const queryParams = new URLSearchParams(window.location.search);
      const categoryId = queryParams.get("categoryId");

      const queryParts = [];
      keyword && queryParts.push(`kw=${encodeURIComponent(keyword)}`);

      if (categoryId) {
        queryParts.push(`categoryId=${encodeURIComponent(categoryId)}`);
        searchParams = { ...searchParams, categoryId };
      }

      const queryString =
        queryParts.length > 0 ? `?${queryParts.join("&")}` : "";

      router.replace(Routes.ADMIN_ROUTES.CHAT_BOT_SERVICE.TOPICS + queryString);
      dispatch(getTopicsThunk(searchParams));
    }
  };

  const handleSearchByCategory = (value: ICategoryResponse | null) => {
    let searchParams = {};
    searchParams = { ...searchParams, categoryId: value?.id };

    const queryParams = new URLSearchParams(window.location.search);
    const kw = queryParams.get("kw");

    const queryParts = [];

    if (kw) {
      queryParts.push(`kw=${encodeURIComponent(kw)}`);
      searchParams = { ...searchParams, keyword: kw };
    }

    value && queryParts.push(`categoryId=${encodeURIComponent(value.id)}`);

    const queryString = queryParts.length > 0 ? `?${queryParts.join("&")}` : "";

    router.replace(Routes.ADMIN_ROUTES.CHAT_BOT_SERVICE.TOPICS + queryString);
    dispatch(getTopicsThunk(searchParams));
  };

  useEffect(() => {
    categories.length === 0 && dispatch(getCategoriesThunk({}));
  }, []);

  useEffect(() => {
    if (typeof window !== "undefined") {
      let searchParams = {};
      const queryParams = new URLSearchParams(window.location.search);

      const kw = queryParams.get("kw");
      if (kw) {
        setKeyword(kw);
        searchParams = { ...searchParams, keyword: kw };
      }

      const categoryId = queryParams.get("categoryId");
      if (categoryId) {
        const categoryObj = categories.find((c) => c.id === Number(categoryId));
        setFilterByCategoryValue(categoryObj || null);
        categoryObj &&
          (searchParams = { ...searchParams, categoryId: categoryObj.id });
      }

      // Dispatch to fetch topics based on search parameters from URL
      dispatch(getTopicsThunk(searchParams));
    }
  }, [categories]);

  useEffect(() => {
    handleSearchByCategory(filterByCategoryValue);
  }, [filterByCategoryValue]);

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
        options={categories}
        autoHighlight
        sx={{ minWidth: "250px" }}
        getOptionLabel={(option) => option.description}
        disabled={listCategoryLoading || listCategoryError !== null}
        isOptionEqualToValue={(option, value) => option.id === value.id}
        value={filterByCategoryValue}
        onChange={(_: any, newValue: ICategoryResponse | null) => {
          setFilterByCategoryValue(newValue);
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

export default TopicFilter;
