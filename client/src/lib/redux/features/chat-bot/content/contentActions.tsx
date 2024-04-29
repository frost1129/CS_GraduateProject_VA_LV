import { createAsyncThunk } from "@reduxjs/toolkit";

import contentApi from "./contentApi";
import { ContentRequestParams } from "@/lib/types/redux";
import {
  ISaveContentRequest,
  IUpdateContentRequest,
} from "@/lib/types/backend";

export const getContentsThunk = createAsyncThunk(
  "getContents",
  async (params: ContentRequestParams, { rejectWithValue }) => {
    try {
      return await contentApi.getContents(params);
    } catch (error: any) {
      if (error.response && error.response.data && error.response.data.message)
        return rejectWithValue(error.response.data.message);
      return rejectWithValue(error.message);
    }
  }
);

export const getContentsV2Thunk = createAsyncThunk(
  "getContentsV2",
  async (params: ContentRequestParams, { rejectWithValue }) => {
    try {
      return await contentApi.getContentsV2(params);
    } catch (error: any) {
      if (error.response && error.response.data && error.response.data.message)
        return rejectWithValue(error.response.data.message);
      return rejectWithValue(error.message);
    }
  }
);

export const addNewContentThunk = createAsyncThunk(
  "addNewContent",
  async (content: ISaveContentRequest, { rejectWithValue }) => {
    try {
      return await contentApi.addNewContent(content);
    } catch (error: any) {
      if (error.response && error.response.data && error.response.data.message)
        return rejectWithValue(error.response.data.message);
      return rejectWithValue(error.message);
    }
  }
);

export const updateContentThunk = createAsyncThunk(
  "updateContent",
  async (
    {
      contentId,
      content,
    }: { contentId: string; content: IUpdateContentRequest },
    { rejectWithValue }
  ) => {
    try {
      return await contentApi.updateContent(contentId, content);
    } catch (error: any) {
      if (error.response && error.response.data && error.response.data.message)
        return rejectWithValue(error.response.data.message);
      return rejectWithValue(error.message);
    }
  }
);

export const deleteContentThunk = createAsyncThunk(
  "deleteContent",
  async (contentId: string, { rejectWithValue }) => {
    try {
      return await contentApi.deleteContent(contentId);
    } catch (error: any) {
      if (error.response && error.response.data && error.response.data.message)
        return rejectWithValue(error.response.data.message);
      return rejectWithValue(error.message);
    }
  }
);
