import { createAsyncThunk } from "@reduxjs/toolkit";

import { ITopicRequest } from "@/lib/types/backend";
import topicApi from "./topicApi";

export const getTopicsThunk = createAsyncThunk(
  "getTopics",
  async (params: any, { rejectWithValue }) => {
    try {
      return await topicApi.getTopics(params);
    } catch (error: any) {
      if (error.response && error.response.data && error.response.data.message)
        return rejectWithValue(error.response.data.message);
      return rejectWithValue(error.message);
    }
  }
);

export const addNewTopicThunk = createAsyncThunk(
  "addNewTopic",
  async (topic: ITopicRequest, { rejectWithValue }) => {
    try {
      return await topicApi.addNewTopic(topic);
    } catch (error: any) {
      if (error.response && error.response.data && error.response.data.message)
        return rejectWithValue(error.response.data.message);
      return rejectWithValue(error.message);
    }
  }
);

export const updateTopicThunk = createAsyncThunk(
  "updateTopic",
  async (
    {
      topicId,
      topic,
    }: { topicId: string; topic: ITopicRequest },
    { rejectWithValue }
  ) => {
    try {
      return await topicApi.updateTopic(topicId, topic);
    } catch (error: any) {
      if (error.response && error.response.data && error.response.data.message)
        return rejectWithValue(error.response.data.message);
      return rejectWithValue(error.message);
    }
  }
);

export const deleteTopicThunk = createAsyncThunk(
  "deleteTopic",
  async (topicId: string, { rejectWithValue }) => {
    try {
      return await topicApi.deleteTopic(topicId);
    } catch (error: any) {
      if (error.response && error.response.data && error.response.data.message)
        return rejectWithValue(error.response.data.message);
      return rejectWithValue(error.message);
    }
  }
);
