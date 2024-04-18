"use client";

import { ChangeEvent, useState } from "react";

import { TextField } from "@mui/material";
import { MagnifyingGlass } from "@phosphor-icons/react";

const CategoryFilter = () => {
  const [keyword, setKeyword] = useState("");

  const handleKeywordChange = (e: ChangeEvent<HTMLInputElement>) => {
    setKeyword(e.target.value);
  };

  const handleSearch = (e: React.KeyboardEvent<HTMLInputElement>) => {
    if (e.key === "Enter") {
      console.log(keyword);
    }
  };

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
