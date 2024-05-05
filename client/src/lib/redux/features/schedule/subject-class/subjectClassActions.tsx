import { SearchRequestParams } from "@/lib/types/redux-scheudule";
import { createAsyncThunk } from "@reduxjs/toolkit";
import subjectClassApi from "../subject-class/subjectClassApi";
import { IUploadFormData } from "@/lib/types/backend-schedule";

export const getSubjectClassesThunk = createAsyncThunk (
    "getSubjectClasses", 
    async (params: SearchRequestParams, { rejectWithValue }) => {
        try {
            return await subjectClassApi.getSubjectClasses(params);
        } catch (error: any) {
            if (error.response && error.response.data && error.response.data.message)
                return rejectWithValue(error.response.data.message);
            return rejectWithValue(error.message);
        }
    }
);

export const uploadSubjectClassThunk = createAsyncThunk (
    "uploadSubjectClass", 
    async (requestObj: IUploadFormData, { rejectWithValue }) => {
        try {
            return await subjectClassApi.uploadSubjectClasses(requestObj);
        } catch (error: any) {
            if (error.response && error.response.data && error.response.data.message)
                return rejectWithValue(error.response.data.message);
            return rejectWithValue(error.message);
        }
    }
);