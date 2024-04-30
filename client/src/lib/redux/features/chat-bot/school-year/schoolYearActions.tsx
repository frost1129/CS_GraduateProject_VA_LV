import { createAsyncThunk } from "@reduxjs/toolkit";

import { ISchoolYearRequest, ITopicRequest } from "@/lib/types/backend";
import { SchoolYearRequestParams } from "@/lib/types/redux";
import schoolYearApi from "./schoolYearApi";

export const getSchoolYearsThunk = createAsyncThunk(
  "getSchoolYears",
  async (params: SchoolYearRequestParams, { rejectWithValue }) => {
    try {
      return await schoolYearApi.getSchoolYears(params);
    } catch (error: any) {
      if (error.response && error.response.data && error.response.data.message)
        return rejectWithValue(error.response.data.message);
      return rejectWithValue(error.message);
    }
  }
);

export const addNewSchoolYearThunk = createAsyncThunk(
  "addNewSchoolYear",
  async (schoolYear: ISchoolYearRequest, { rejectWithValue }) => {
    try {
      return await schoolYearApi.addNewSchoolYear(schoolYear);
    } catch (error: any) {
      if (error.response && error.response.data && error.response.data.message)
        return rejectWithValue(error.response.data.message);
      return rejectWithValue(error.message);
    }
  }
);

export const updateSchoolYearThunk = createAsyncThunk(
  "updateSchoolYear",
  async (
    {
      schoolYearId,
      schoolYear,
    }: { schoolYearId: string; schoolYear: ISchoolYearRequest },
    { rejectWithValue }
  ) => {
    try {
      return await schoolYearApi.updateSchoolYear(schoolYearId, schoolYear);
    } catch (error: any) {
      if (error.response && error.response.data && error.response.data.message)
        return rejectWithValue(error.response.data.message);
      return rejectWithValue(error.message);
    }
  }
);

export const deleteSchoolYearThunk = createAsyncThunk(
  "deleteSchoolYear",
  async (schoolYearId: string, { rejectWithValue }) => {
    try {
      return await schoolYearApi.deleteSchoolYear(schoolYearId);
    } catch (error: any) {
      if (error.response && error.response.data && error.response.data.message)
        return rejectWithValue(error.response.data.message);
      return rejectWithValue(error.message);
    }
  }
);
