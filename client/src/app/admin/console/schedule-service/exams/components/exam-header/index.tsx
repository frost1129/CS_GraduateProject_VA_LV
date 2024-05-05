"use client";

import theme from "@/lib/theme";
import { Typography, useMediaQuery } from "@mui/material";
import { Stack } from "@mui/system";
import ExamFilter from "../exam-filter";
import ExamCreator from "../exam-creator";

const ExamHeader = () => {
    const isTablet = useMediaQuery(theme.breakpoints.up("tablet"));

    return (
        <Stack
            direction={isTablet ? "row" : "column"}
            justifyContent="space-between"
            sx={{ marginBottom: 2 }}
            gap={1}
        >
            <Typography variant="h4" marginBottom={isTablet ? 0 : 1}>
                Quản lý lịch thi
            </Typography>
            <Stack
                direction={isTablet ? "row" : "column-reverse"}
                alignItems="center"
                gap={2}
            >
                <ExamFilter />
                <ExamCreator />
            </Stack>
        </Stack>
    );
};

export default ExamHeader;
