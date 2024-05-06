"use client";

import Routes from "@/lib/constants/Routes";
import { getSubjectsThunk } from "@/lib/redux/features/schedule/subject/subjectActions";
import { useAppDispatch } from "@/lib/redux/store";
import theme from "@/lib/theme";
import { SearchRequestParams } from "@/lib/types/redux-scheudule";
import { Stack, TextField, useMediaQuery } from "@mui/material";
import { MagnifyingGlass } from "@phosphor-icons/react";
import { useRouter } from "next/navigation";
import React, { ChangeEvent, useState } from "react";

const SubjectFilter = () => {
    const router = useRouter();
    const isTablet = useMediaQuery(theme.breakpoints.up("tablet"));

    const dispatch = useAppDispatch();

    const [kw, setKw] = useState("");
    const handleKeywordChange = (e: ChangeEvent<HTMLInputElement>) => {
        setKw(e.target.value);
    };

    const handleSearchByKeyword = (
        e: React.KeyboardEvent<HTMLInputElement>
    ) => {
        if (e.key === "Enter") {
            let searchParams: SearchRequestParams = {};
            searchParams = { ...searchParams, kw };

            const queryParts = [];
            kw && queryParts.push(`kw=${encodeURIComponent(kw)}`);

            const queryString =
                queryParts.length > 0 ? `?${queryParts.join("&")}` : "";

            router.replace(
                Routes.ADMIN_ROUTES.SCHEDULE_SERVICE.SUBJECTS + queryString
            );
            dispatch(getSubjectsThunk(searchParams));
        }
    };

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
                value={kw}
                onChange={handleKeywordChange}
                onKeyDown={handleSearchByKeyword}
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
    );
};

export default SubjectFilter;
