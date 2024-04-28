import { createSlice, PayloadAction } from "@reduxjs/toolkit";

import { ContentState, ResetContentStatusPayload } from "@/lib/types/redux";
import {
  addNewContentThunk,
  deleteContentThunk,
  getContentsThunk,
  updateContentThunk,
} from "./contentActions";

const initialState: ContentState = {
  listContentLoading: false,
  contents: [],
  listContentError: null,

  saveContentLoading: false,
  savedContent: null,
  saveContentError: null,

  updateContentLoading: false,
  updatedContent: null,
  updateContentError: null,

  deleteContentLoading: false,
  deleteContentSuccess: null,
  deleteContentError: null,
};

const contentSlice = createSlice({
  name: "content",
  initialState,
  reducers: {
    appendContentFirst: (state, action) => {
      state.contents = [action.payload.topic, ...state.contents];
    },

    appendContentLast: (state, action) => {
      state.contents = [...state.contents, action.payload.topic];
    },

    removeContentById: (state, action) => {
      const updatedContents = state.contents.filter(
        (c) => c.id !== action.payload.contentId
      );
      state.contents = updatedContents;
    },

    clearContentData: (state) => {
      state.contents = [];
    },

    updateContent: (state, action) => {
      const updatedContents = state.contents.map((c) => {
        if (c.id === action.payload.content.id)
          return { ...c, ...action.payload.content };
        return c;
      });
      state.contents = updatedContents;
    },

    resetContentStatus: (
      state,
      action: PayloadAction<ResetContentStatusPayload>
    ) => {
      const { keys } = action.payload;

      keys.forEach((key) => {
        if (key in state) state[key as keyof ContentState] = initialState[key];
      });
    },
  },

  extraReducers: (builder) => {
    // Get contents
    builder.addCase(getContentsThunk.pending, (state) => {
      state.listContentLoading = true;
      state.contents = [];
      state.listContentError = null;
    });
    builder.addCase(getContentsThunk.fulfilled, (state, action) => {
      state.listContentLoading = false;
      state.contents = action.payload.data;
      state.listContentError = null;
    });
    builder.addCase(getContentsThunk.rejected, (state, action) => {
      state.listContentLoading = false;
      state.contents = [];
      state.listContentError = action.payload ? action.payload : null;
    });

    // Add new topic
    builder.addCase(addNewContentThunk.pending, (state) => {
      state.saveContentLoading = true;
      state.savedContent = null;
      state.saveContentError = null;
    });
    builder.addCase(addNewContentThunk.fulfilled, (state, action) => {
      state.saveContentLoading = false;
      state.savedContent = action.payload.data;
      state.saveContentError = null;
    });
    builder.addCase(addNewContentThunk.rejected, (state, action) => {
      state.saveContentLoading = false;
      state.savedContent = null;
      state.saveContentError = action.payload ? action.payload : null;
    });

    // Update content
    builder.addCase(updateContentThunk.pending, (state) => {
      state.updateContentLoading = true;
      state.updatedContent = null;
      state.updateContentError = null;
    });
    builder.addCase(updateContentThunk.fulfilled, (state, action) => {
      state.updateContentLoading = false;
      state.updatedContent = action.payload.data;
      state.updateContentError = null;
    });
    builder.addCase(updateContentThunk.rejected, (state, action) => {
      state.updateContentLoading = false;
      state.updatedContent = null;
      state.updateContentError = action.payload ? action.payload : null;
    });

    // Delete topic
    builder.addCase(deleteContentThunk.pending, (state) => {
      state.deleteContentLoading = true;
      state.deleteContentSuccess = null;
      state.deleteContentError = null;
    });
    builder.addCase(deleteContentThunk.fulfilled, (state, action) => {
      state.deleteContentLoading = false;
      state.deleteContentSuccess = action.payload.data;
      state.deleteContentError = null;
    });
    builder.addCase(deleteContentThunk.rejected, (state, action) => {
      state.deleteContentLoading = false;
      state.deleteContentSuccess = null;
      state.deleteContentError = action.payload ? action.payload : null;
    });
  },
});

export const {
  appendContentFirst,
  appendContentLast,
  removeContentById,
  clearContentData,
  updateContent,
  resetContentStatus,
} = contentSlice.actions;
export default contentSlice.reducer;
