"use client";

import theme from "@/lib/theme";
import { Autocomplete, MenuItem, TextField, Typography, useMediaQuery } from "@mui/material";
import { Stack } from "@mui/system";
import ExamCreator from "../exam-creator";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { IYearCodeDTO } from "@/lib/types/backend-schedule";
import { useEffect, useState } from "react";
import { getYearCodeExamTimeTableThunk } from "@/lib/redux/features/schedule/exam/examActions";
import { getAssignedYearCodeThunk } from "@/lib/redux/features/schedule/subject-class/subjectClassActions";

const ExamHeader = () => {
    const isTablet = useMediaQuery(theme.breakpoints.up("tablet"));
    const dispatch = useAppDispatch();
    const {
        getAssignedYearCodeLoading,
        assignedYearCode,
        getAssignedYearCodeError,
    } = useAppSelector((state) => state.subjectClass);

    const [selectedYearCode, setSelectedYearCode] =
        useState<IYearCodeDTO | null>(null);

    const handleGetExamScheduleByYearCode = (yearCode: number | undefined) => {
        if (yearCode) {
            dispatch(getYearCodeExamTimeTableThunk(yearCode));
        }
    };

    useEffect(() => {
        assignedYearCode.length === 0 && dispatch(getAssignedYearCodeThunk());
    }, []);

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
                {/* Year codes by the school year selector */}
                <Autocomplete
                    id="year-code-select"
                    options={assignedYearCode}
                    autoHighlight
                    sx={{ minWidth: "250px" }}
                    getOptionLabel={(option: IYearCodeDTO) =>
                        "Học kì " + option.yearCode.toString()
                    }
                    isOptionEqualToValue={(option, value) =>
                        option.id === value.id
                    }
                    value={selectedYearCode || null}
                    onChange={(_: any, newValue: IYearCodeDTO | null) => {
                        setSelectedYearCode(newValue);
                        handleGetExamScheduleByYearCode(newValue?.yearCode);
                    }}
                    renderInput={(params) => (
                        <TextField {...params} placeholder="Chọn học kì" />
                    )}
                    renderOption={(props, option) => (
                        <MenuItem
                            {...props}
                            sx={{ marginX: 1, marginTop: 0.5 }}
                            key={option.id}
                        >
                            <Typography variant="body2">
                                {option.yearCode}
                            </Typography>
                        </MenuItem>
                    )}
                />
                <ExamCreator />
            </Stack>
        </Stack>
    );
};

export default ExamHeader;
