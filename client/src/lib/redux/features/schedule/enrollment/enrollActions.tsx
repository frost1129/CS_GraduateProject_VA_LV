import { TimetableRequestParams } from "@/lib/types/redux-scheudule";
import { createAsyncThunk } from "@reduxjs/toolkit";
import enrollApi from "./enrollApi";
import { IUploadFormData } from "@/lib/types/backend-schedule";

export const getTimeTableThunk = createAsyncThunk (
    "getTimeTables", 
    async (params: TimetableRequestParams, { rejectWithValue }) => {
        try {
            return await enrollApi.getTimeTable(params);
        } catch (error: any) {
            if (error.response && error.response.data && error.response.data.message)
                return rejectWithValue(error.response.data.message);
            return rejectWithValue(error.message);
        }
    }
);

export const uploadEnrollmentsThunk = createAsyncThunk (
    "uploadEnrollments", 
    async (requestObj: IUploadFormData, { rejectWithValue }) => {
        try {
            return await enrollApi.uploadEnrollments(requestObj);
        } catch (error: any) {
            if (error.response && error.response.data && error.response.data.message)
                return rejectWithValue(error.response.data.message);
            return rejectWithValue(error.message);
        }
    }
)