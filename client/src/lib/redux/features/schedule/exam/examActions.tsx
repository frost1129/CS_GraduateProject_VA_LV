import { DNA, IExamScheduleRequest } from "@/lib/types/backend-schedule";
import { createAsyncThunk } from "@reduxjs/toolkit";
import examApi from "./examApi";

export const generateExamScheduleThunk = createAsyncThunk (
    "generateExamSchedules", 
    async (requestObj: IExamScheduleRequest, { rejectWithValue }) => {
        try {
            return await examApi.generateExamSchedule(requestObj);
        } catch (error: any) {
            if (error.response && error.response.data && error.response.data.message)
                return rejectWithValue(error.response.data.message);
            return rejectWithValue(error.message);
        }
    }
);

export const saveExamScheduleThunk = createAsyncThunk (
    "saveExamSchedules", 
    async (dna: DNA, { rejectWithValue }) => {
        try {
            return await examApi.saveExamSchedules(dna);
        } catch (error: any) {
            if (error.response && error.response.data && error.response.data.message)
                return rejectWithValue(error.response.data.message);
            return rejectWithValue(error.message);
        }
    }
)