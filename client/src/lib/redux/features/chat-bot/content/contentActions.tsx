import { createAsyncThunk } from "@reduxjs/toolkit";

import contentApi from "./contentApi";

export const getAllContentThunk = createAsyncThunk(
  "getAllContent",
  async (_, { rejectWithValue }) => {
    try {
      return (await contentApi.getAllContents()).data;
    } catch (error: any) {
      if (error.response && error.response.data.message)
        return rejectWithValue(error.response.data.message);
      return rejectWithValue(error.message);
    }
  }
);
