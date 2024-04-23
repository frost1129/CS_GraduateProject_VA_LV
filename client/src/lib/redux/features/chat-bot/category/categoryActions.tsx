import { createAsyncThunk } from "@reduxjs/toolkit";

import categoryApi from "./categoryApi";

export const getCategoriesThunk = createAsyncThunk(
  "getCategories",
  async (params: any, { rejectWithValue }) => {
    try {
      return (await categoryApi.getCategories(params)).data;
    } catch (error: any) {
      if (error.response && error.response.data.message)
        return rejectWithValue(error.response.data.message);
      return rejectWithValue(error.message);
    }
  }
);
