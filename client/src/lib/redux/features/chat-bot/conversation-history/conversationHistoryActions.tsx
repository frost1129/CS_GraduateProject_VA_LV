import { createAsyncThunk } from "@reduxjs/toolkit";

import { IConversationHistoryRequest } from "@/lib/types/backend";
import { ConversationHistoryRequestParams } from "@/lib/types/redux";
import conversationHistoryApi from "./conversationHistoryApi";

export const getConversationHistoriesThunk = createAsyncThunk(
  "getConversationHistories",
  async (params: ConversationHistoryRequestParams, { rejectWithValue }) => {
    try {
      return await conversationHistoryApi.getConversationHistories(params);
    } catch (error: any) {
      if (error.response && error.response.data && error.response.data.message)
        return rejectWithValue(error.response.data.message);
      return rejectWithValue(error.message);
    }
  }
);

export const getSelfConversationHistoriesThunk = createAsyncThunk(
    "getSelfConversationHistories",
    async (params: ConversationHistoryRequestParams, { rejectWithValue }) => {
      try {
        return await conversationHistoryApi.getSelfConversationHistories(params);
      } catch (error: any) {
        if (error.response && error.response.data && error.response.data.message)
          return rejectWithValue(error.response.data.message);
        return rejectWithValue(error.message);
      }
    }
  );

export const addNewConversationHistoryThunk = createAsyncThunk(
  "addNewConversationHistory",
  async (conversationHistory: IConversationHistoryRequest, { rejectWithValue }) => {
    try {
      return await conversationHistoryApi.addNewConversationHistory(conversationHistory);
    } catch (error: any) {
      if (error.response && error.response.data && error.response.data.message)
        return rejectWithValue(error.response.data.message);
      return rejectWithValue(error.message);
    }
  }
);

export const deleteConversationHistoryThunk = createAsyncThunk(
  "deleteConversationHistory",
  async (conversationHistoryId: string, { rejectWithValue }) => {
    try {
      return await conversationHistoryApi.deleteConversationHistory(conversationHistoryId);
    } catch (error: any) {
      if (error.response && error.response.data && error.response.data.message)
        return rejectWithValue(error.response.data.message);
      return rejectWithValue(error.message);
    }
  }
);
