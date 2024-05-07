import { createAsyncThunk } from "@reduxjs/toolkit";
import masterApi from "./masterApi";

export const getSchoolYearsThunk = createAsyncThunk (
    "getSchoolYears",
    async (_, { rejectWithValue }) => {
        try {
            return await masterApi.getSchoolYears();
        } catch(error: any) {
            if (error.response && error.response.data && error.response.data.message)
                return rejectWithValue(error.response.data.message);
            return rejectWithValue(error.message);
        }
    }
);

export const getTimeSlotsThunk = createAsyncThunk (
    "getTimeSlots",
    async (_, { rejectWithValue }) => {
        try {
            return await masterApi.getTimeSlots();
        } catch (error: any) {
            if (error.response && error.response.data && error.response.data.message)
                return rejectWithValue(error.response.data.message);
            return rejectWithValue(error.message);
        }
    }
);

export const getYearCodeByYearsThunk = createAsyncThunk (
    "getYearCodesByYear",
    async (year: number, { rejectWithValue }) => {
        try {
            return await masterApi.getYearCodesByYear(year);
        } catch (error: any) {
            if (error.response && error.response.data && error.response.data.message)
                return rejectWithValue(error.response.data.message);
            return rejectWithValue(error.message);
        }
    }
);