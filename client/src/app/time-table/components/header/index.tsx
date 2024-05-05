"use client";

import { useEffect, useState } from "react";

import {
  Autocomplete,
  MenuItem,
  Stack,
  TextField,
  Typography,
  useMediaQuery,
} from "@mui/material";

import theme from "@/lib/theme";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import {
  getSchoolYearsThunk,
  getYearCodeByYearsThunk,
} from "@/lib/redux/features/schedule/master/masterAction";
import { ISchoolYearDTO, IYearCodeDTO } from "@/lib/types/backend-schedule";
import { getTimeTableThunk } from "@/lib/redux/features/schedule/enrollment/enrollActions";
import { TimetableRequestParams } from "@/lib/types/redux-scheudule";
import { resetMasterStatus } from "@/lib/redux/features/schedule/master/masterSlide";

const TimeTableHeader = () => {
  // Redux
  const dispatch = useAppDispatch();
  const {} = useAppSelector((state) => state.enroll);
  const {
    getYearCodeLoading,
    yearCodes,
    getYearCodeError,
    getSchoolYearLoading,
    schoolYears,
    getSchoolYearError,
  } = useAppSelector((state) => state.master);
  const { userProfile } = useAppSelector((state) => state.auth);
  const { timeTables, getTimeTableLoading, getTimeTableError } = useAppSelector((state) => state.enroll);

  const isTablet = useMediaQuery(theme.breakpoints.up("tablet"));

  const [selectedSchoolYear, setSelectedSchoolYear] =
    useState<ISchoolYearDTO | null>(null);
  const [selectedYearCode, setSelectedYearCode] = useState<IYearCodeDTO | null>(
    null
  );

  const handleGetYearCodesByYear = (year: number | undefined | null) => {
    if (year) dispatch(getYearCodeByYearsThunk(year));
    else {
      setSelectedYearCode(null);
      dispatch(
        resetMasterStatus({
          keys: ["yearCodes", "getYearCodeLoading", "getSchoolYearError"],
        })
      );
    }
  };

  const handleGetStudentTimeTable = (yearCode: number | undefined) => {
    if (yearCode) {
      const params: TimetableRequestParams = {
        // NEED_TO_DO_NEXT
        studentId: userProfile?.preferred_username || undefined, // hard code test: "2030099"
        yearCode,
      };
      dispatch(getTimeTableThunk(params));
    }
  };

  useEffect(() => {
    schoolYears.length === 0 && dispatch(getSchoolYearsThunk());
  }, []);

  useEffect(() => {
    // NEED_TO_DO_NEXT
    console.log(timeTables);
  }, [timeTables, getTimeTableError]);

  return (
    <Stack
      direction={isTablet ? "row" : "column"}
      justifyContent="space-between"
      sx={{ marginBottom: 2 }}
      gap={1}
    >
      <Typography variant="h4" marginBottom={isTablet ? 0 : 1}>
        Lịch học cá nhân
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
            "Năm " + option.year.toString()
          }
          disabled={getSchoolYearLoading || getSchoolYearError !== null}
          isOptionEqualToValue={(option, value) => option.id === value.id}
          value={selectedSchoolYear || null}
          onChange={(_: any, newValue: ISchoolYearDTO | null) => {
            setSelectedSchoolYear(newValue);
            handleGetYearCodesByYear(newValue?.year);
          }}
          renderInput={(params) => (
            <TextField {...params} placeholder="Chọn năm học" />
          )}
          renderOption={(props, option) => (
            <MenuItem
              {...props}
              sx={{ marginX: 1, marginTop: 0.5 }}
              key={option.id}
            >
              <Typography variant="body2">{option.year}</Typography>
            </MenuItem>
          )}
        />

        {/* Year codes by the school year selector */}
        <Autocomplete
          id="year-code-select"
          options={yearCodes}
          autoHighlight
          sx={{ minWidth: "250px" }}
          getOptionLabel={(option: IYearCodeDTO) =>
            "Học kì " + option.yearCode.toString()
          }
          disabled={
            getYearCodeLoading ||
            getYearCodeError !== null ||
            yearCodes.length === 0
          }
          isOptionEqualToValue={(option, value) => option.id === value.id}
          value={selectedYearCode || null}
          onChange={(_: any, newValue: IYearCodeDTO | null) => {
            setSelectedYearCode(newValue);
            handleGetStudentTimeTable(newValue?.yearCode);
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
              <Typography variant="body2">{option.yearCode}</Typography>
            </MenuItem>
          )}
        />
      </Stack>
    </Stack>
  );
};

export default TimeTableHeader;
