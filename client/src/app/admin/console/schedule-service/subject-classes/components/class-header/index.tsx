"use client";

import theme from "@/lib/theme";
import { Typography, useMediaQuery } from "@mui/material";
import { Stack } from "@mui/system";
import ClassFilter from "../class-filter";
import ClassCreator from "../class-creator";

const ClassHeader = () => {
    const isTablet = useMediaQuery(theme.breakpoints.up("tablet"));

    return (
        <Stack
            direction={isTablet ? "row" : "column"}
            justifyContent="space-between"
            sx={{ marginBottom: 2 }}
            gap={1}
        >
            <Typography variant="h4" marginBottom={isTablet ? 0 : 1}>
                Quản lý lớp theo môn học
            </Typography>
            <Stack
                direction={isTablet ? "row" : "column-reverse"}
                alignItems="center"
                gap={2}
            >
                <ClassFilter />
                <ClassCreator />
            </Stack>
        </Stack>
    );
};

export default ClassHeader;
