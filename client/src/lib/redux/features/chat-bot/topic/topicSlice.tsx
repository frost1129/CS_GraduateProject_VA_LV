import { createSlice, PayloadAction } from "@reduxjs/toolkit";

import { ResetTopicStatusPayload, TopicState } from "@/lib/types/redux";
import {
  addNewTopicThunk,
  deleteTopicThunk,
  getTopicsThunk,
  updateTopicThunk,
} from "./topicActions";

const initialState: TopicState = {
  listTopicLoading: false,
  topics: [],
  listTopicError: null,

  saveTopicLoading: false,
  savedTopic: null,
  saveTopicError: null,

  updateTopicLoading: false,
  updatedTopic: null,
  updateTopicError: null,

  deleteTopicLoading: false,
  deleteTopicSuccess: null,
  deleteTopicError: null,
};

const topicSlice = createSlice({
  name: "topic",
  initialState,
  reducers: {
    appendTopicFirst: (state, action) => {
      state.topics = [action.payload.topic, ...state.topics];
    },
    appendTopicLast: (state, action) => {
      state.topics = [...state.topics, action.payload.topic];
    },
    removeTopicById: (state, action) => {
      const updatedTopics = state.topics.filter(
        (t) => t.id !== action.payload.topicId
      );
      state.topics = updatedTopics;
    },
    clearTopicData: (state) => {
      state.topics = [];
    },
    updateTopicById: (state, action) => {
      const updatedTopics = state.topics.map((t) => {
        if (t.id === action.payload.topic.id)
          return { ...t, ...action.payload.topic };
        return t;
      });
      state.topics = updatedTopics;
    },

    resetTopicStatus: (
      state,
      action: PayloadAction<ResetTopicStatusPayload>
    ) => {
      const { keys } = action.payload;

      keys.forEach((key) => {
        if (key in state) state[key as keyof TopicState] = initialState[key];
      });
    },
  },
  extraReducers: (builder) => {
    // Get topics
    builder.addCase(getTopicsThunk.pending, (state) => {
      state.listTopicLoading = true;
      state.topics = [];
      state.listTopicError = null;
    });
    builder.addCase(getTopicsThunk.fulfilled, (state, action) => {
      state.listTopicLoading = false;
      state.topics = action.payload.data;
      state.listTopicError = null;
    });
    builder.addCase(getTopicsThunk.rejected, (state, action) => {
      state.listTopicLoading = false;
      state.topics = [];
      state.listTopicError = action.payload ? action.payload : null;
    });

    // Add new topic
    builder.addCase(addNewTopicThunk.pending, (state) => {
      state.saveTopicLoading = true;
      state.savedTopic = null;
      state.saveTopicError = null;
    });
    builder.addCase(addNewTopicThunk.fulfilled, (state, action) => {
      state.saveTopicLoading = false;
      state.savedTopic = action.payload.data;
      state.saveTopicError = null;
    });
    builder.addCase(addNewTopicThunk.rejected, (state, action) => {
      state.saveTopicLoading = false;
      state.savedTopic = null;
      state.saveTopicError = action.payload ? action.payload : null;
    });

    // Update category
    builder.addCase(updateTopicThunk.pending, (state) => {
      state.updateTopicLoading = true;
      state.updatedTopic = null;
      state.updateTopicError = null;
    });
    builder.addCase(updateTopicThunk.fulfilled, (state, action) => {
      state.updateTopicLoading = false;
      state.updatedTopic = action.payload.data;
      state.updateTopicError = null;
    });
    builder.addCase(updateTopicThunk.rejected, (state, action) => {
      state.updateTopicLoading = false;
      state.updatedTopic = null;
      state.updateTopicError = action.payload ? action.payload : null;
    });

    // Delete category
    builder.addCase(deleteTopicThunk.pending, (state) => {
      state.deleteTopicLoading = true;
      state.deleteTopicSuccess = null;
      state.deleteTopicError = null;
    });
    builder.addCase(deleteTopicThunk.fulfilled, (state, action) => {
      state.deleteTopicLoading = false;
      state.deleteTopicSuccess = action.payload.data;
      state.deleteTopicError = null;
    });
    builder.addCase(deleteTopicThunk.rejected, (state, action) => {
      state.deleteTopicLoading = false;
      state.deleteTopicSuccess = null;
      state.deleteTopicError = action.payload ? action.payload : null;
    });
  },
});
export const {
  appendTopicFirst,
  appendTopicLast,
  removeTopicById,
  clearTopicData,
  updateTopicById,
  resetTopicStatus,
} = topicSlice.actions;
export default topicSlice.reducer;
