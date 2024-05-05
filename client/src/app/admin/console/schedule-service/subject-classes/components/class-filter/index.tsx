"use client";

import theme from "@/lib/theme";
import { Stack, TextField, useMediaQuery } from "@mui/material";
import { MagnifyingGlass } from "@phosphor-icons/react";
import { useRouter } from "next/router";

const ClassFilter = () => {
    // const router = useRouter();
    const isTablet = useMediaQuery(theme.breakpoints.up("tablet"));

    return (
        <>
            <Stack
                direction={isTablet ? "row" : "column"}
                gap={1}
                alignItems="center"
                width="100%"
            >
                <TextField
                    sx={{ minWidth: "250px" }}
                    placeholder="Nhập từ khóa..."
                    // value={keyword}
                    // onChange={handleKeywordChange}
                    // onKeyDown={handleSearchByKeyword}
                    InputProps={{
                        endAdornment: (
                            <MagnifyingGlass
                                size={32}
                                style={{ color: "var(--primary)" }}
                            />
                        ),
                    }}
                />
            </Stack>
        </>
    );
};

export default ClassFilter;
