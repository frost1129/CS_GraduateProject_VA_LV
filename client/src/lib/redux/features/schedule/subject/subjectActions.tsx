import { SearchRequestParams } from "@/lib/types/redux-scheudule";
import { createAsyncThunk } from "@reduxjs/toolkit";
import subjectApi from "./subjectApi";
import { ISubjectSaveDTO, IUploadFormData } from "@/lib/types/backend-schedule";

export const getSubjectsThunk = createAsyncThunk (
    "getSubjects", 
    async (params: SearchRequestParams, { rejectWithValue }) => {
        try {
            return await subjectApi.getSubjects(params);
        } catch (error: any) {
            if (error.response && error.response.data && error.response.data.message)
                return rejectWithValue(error.response.data.message);
            return rejectWithValue(error.message);
        }
    }
);

export const addSubjectThunk = createAsyncThunk (
    "addSubject", 
    async (subject: ISubjectSaveDTO, { rejectWithValue }) => {
        try {
            return await subjectApi.addSubject(subject);
        } catch (error: any) {
            if (error.response && error.response.data && error.response.data.message)
                return rejectWithValue(error.response.data.message);
            return rejectWithValue(error.message);
        }
    }
);

export const uploadSubjectsThunk = createAsyncThunk (
    "uploadSubjects", 
    async (requestObj: IUploadFormData, { rejectWithValue }) => {
        try {
            return await subjectApi.uploadSubjects(requestObj);
        } catch (error: any) {
            if (error.response && error.response.data && error.response.data.message)
                return rejectWithValue(error.response.data.message);
            return rejectWithValue(error.message);
        }
    }
);