"use client";

import theme from "@/lib/theme";
import { Autocomplete, MenuItem, TextField, Typography, useMediaQuery } from "@mui/material";
import { Stack } from "@mui/system";
import ClassFilter from "../class-filter";
import ClassCreator from "../class-creator";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { useEffect, useState } from "react";
import { ISchoolYearDTO, IYearCodeDTO } from "@/lib/types/backend-schedule";
import { getSchoolYearsThunk, getYearCodeByYearsThunk } from "@/lib/redux/features/schedule/master/masterAction";
import { resetMasterStatus } from "@/lib/redux/features/schedule/master/masterSlide";
import { getSubjectClassesThunk } from "@/lib/redux/features/schedule/subject-class/subjectClassActions";
import { SelectedYearCodeProps } from "@/lib/types/component";

const ClassHeader = ({ selectedYearCode, setSelectedYearCode }: SelectedYearCodeProps) => {
    const isTablet = useMediaQuery(theme.breakpoints.up("tablet"));
    const dispatch = useAppDispatch();
    const {
        getYearCodeLoading,
        yearCodes,
        getYearCodeError,
        getSchoolYearLoading,
        schoolYears,
        getSchoolYearError,
    } = useAppSelector((state) => state.master);

    const [selectedSchoolYear, setSelectedSchoolYear] =
        useState<ISchoolYearDTO | null>(null);

    const handleGetYearCodesByYear = (year: number | undefined | null) => {
        if (year) dispatch(getYearCodeByYearsThunk(year));
        else {
            setSelectedYearCode(null);
            dispatch(
                resetMasterStatus({
                    keys: [
                        "yearCodes",
                        "getYearCodeLoading",
                        "getSchoolYearError",
                    ],
                })
            );
        }
    };

    useEffect(() => {
        if (selectedYearCode !== null) {
            const initialSearchParams = { 
                page: 1,
                yearCode: selectedYearCode.yearCode, 
            };
            dispatch(getSubjectClassesThunk(initialSearchParams));
        }
    }, [selectedYearCode]);

    useEffect(() => {
        schoolYears.length === 0 && dispatch(getSchoolYearsThunk());
    }, []);

    return (
        <Stack
            direction={isTablet ? "row" : "column"}
            justifyContent="space-between"
            sx={{ marginBottom: 2 }}
            gap={1}
        >
            <Typography variant="h4" marginBottom={isTablet ? 0 : 1}>
                Quản lý lớp học
            </Typography>
            <Stack
                direction={isTablet ? "row" : "column-reverse"}
                alignItems="center"
                gap={2}
            >
                {/* School years selector */}
                <Autocomplete
                    id="year-select"
                    options={schoolYears}
                    autoHighlight
                    sx={{ minWidth: "250px" }}
                    getOptionLabel={(option: ISchoolYearDTO) =>
                        "Năm học " + option.year.toString()
                    }
                    disabled={
                        getSchoolYearLoading || getSchoolYearError !== null
                    }
                    isOptionEqualToValue={(option, value) =>
                        option.id === value.id
                    }
                    value={selectedSchoolYear || null}
                    onChange={(_: any, newValue: ISchoolYearDTO | null) => {
                        setSelectedSchoolYear(newValue);
                        handleGetYearCodesByYear(newValue?.year);
                    }}
                    renderInput={(params) => (
                        <TextField {...params} placeholder="Năm học" />
                    )}
                    renderOption={(props, option) => (
                        <MenuItem
                            {...props}
                            sx={{ marginX: 1, marginTop: 0.5 }}
                            key={option.id}
                        >
                            <Typography variant="body2">
                                {option.year}
                            </Typography>
                        </MenuItem>
                    )}
                />

                {/* Year codes by the school year selector */}
                <Autocomplete
                    id="year-code-select"
                    options={yearCodes}
                    autoHighlight
                    sx={{ minWidth: "200px" }}
                    getOptionLabel={(option: IYearCodeDTO) =>
                        "Học kì " + option.yearCode.toString()
                    }
                    disabled={
                        getYearCodeLoading ||
                        getYearCodeError !== null ||
                        yearCodes.length === 0
                    }
                    isOptionEqualToValue={(option, value) =>
                        option.id === value.id
                    }
                    value={selectedYearCode || null}
                    onChange={(_: any, newValue: IYearCodeDTO | null) => {
                        setSelectedYearCode(newValue);
                    }}
                    renderInput={(params) => (
                        <TextField {...params} placeholder="Học kì" />
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
                {/* <ClassFilter /> */}
                <ClassCreator selectedYearCode={selectedYearCode} />
            </Stack>
        </Stack>
    );
};

export default ClassHeader;
