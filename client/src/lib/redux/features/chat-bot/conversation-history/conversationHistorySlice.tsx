import { createSlice, PayloadAction } from "@reduxjs/toolkit";

import {
  ConversationHistoryState,
  ResetConversationHistoryStatusPayload,
} from "@/lib/types/redux";
import {
  addNewConversationHistoryThunk,
  deleteConversationHistoryThunk,
  getConversationHistoriesThunk,
  getSelfConversationHistoriesThunk,
} from "./conversationHistoryActions";

const initialState: ConversationHistoryState = {
  listConversationLoading: false,
  conversationDataResponse: null,
  listConversationError: null,

  listSelfConversationLoading: false,
  selfConversationDataResponse: null,
  listSelfConversationError: null,

  saveConversationLoading: false,
  savedConversation: null,
  saveConversationError: null,

  deleteConversationHistoryLoading: false,
  deleteConversationHistorySuccess: null,
  deleteConversationHistoryError: null,
};

const conversationHistorySlice = createSlice({
  name: "conversationHistory",
  initialState,
  reducers: {
    appendConversationHistoryFirst: (state, action) => {
      if (state.conversationDataResponse) {
        const updatedState = {
          ...state.conversationDataResponse,
          data: [
            action.payload.conversationHistory,
            ...state.conversationDataResponse.data,
          ],
        };
        state.conversationDataResponse = updatedState;
      }
    },
    appendConversationHistoryLast: (state, action) => {
      if (state.conversationDataResponse) {
        const updatedState = {
          ...state.conversationDataResponse,
          data: [
            ...state.conversationDataResponse.data,
            action.payload.conversationHistory,
          ],
        };
        state.conversationDataResponse = updatedState;
      }
    },
    removeConversationHistoryById: (state, action) => {
      if (state.conversationDataResponse) {
        const updatedState = {
          ...state.conversationDataResponse,
          data: state.conversationDataResponse.data.filter(
            (ch) => ch.id !== action.payload.conversationHistoryId
          ),
        };
        state.conversationDataResponse = updatedState;
      }
    },
    clearConversationHistoryData: (state) => {
      state.conversationDataResponse = null;
    },
    updateConversationHistory: (state, action) => {
      if (state.conversationDataResponse) {
        const updatedState = {
          ...state.conversationDataResponse,
          data: state.conversationDataResponse.data.map((ch) => {
            if (ch.id === action.payload.conversationHistory.id)
              return { ...ch, ...action.payload.conversationHistory };
            return ch;
          }),
        };
        state.conversationDataResponse = updatedState;
      }
    },

    resetConversationHistoryStatus: (
      state,
      action: PayloadAction<ResetConversationHistoryStatusPayload>
    ) => {
      const { keys } = action.payload;

      keys.forEach((key) => {
        if (key in state)
          state[key as keyof ConversationHistoryState] = initialState[key];
      });
    },
  },
  extraReducers: (builder) => {
    // Get conversation history : ADMIN role only
    builder.addCase(getConversationHistoriesThunk.pending, (state) => {
      state.listConversationLoading = true;
      state.conversationDataResponse = null;
      state.listConversationError = null;
    });
    builder.addCase(
      getConversationHistoriesThunk.fulfilled,
      (state, action) => {
        state.listConversationLoading = false;
        state.conversationDataResponse = action.payload.data;
        state.listConversationError = null;
      }
    );
    builder.addCase(getConversationHistoriesThunk.rejected, (state, action) => {
      state.listConversationLoading = false;
      state.conversationDataResponse = null;
      state.listConversationError = action.payload ? action.payload : null;
    });

    // Get conversation history : logged user
    builder.addCase(getSelfConversationHistoriesThunk.pending, (state) => {
      state.listSelfConversationLoading = true;
      state.selfConversationDataResponse = null;
      state.listSelfConversationError = null;
    });
    builder.addCase(
      getSelfConversationHistoriesThunk.fulfilled,
      (state, action) => {
        state.listSelfConversationLoading = false;
        state.selfConversationDataResponse = action.payload.data;
        state.listSelfConversationError = null;
      }
    );
    builder.addCase(
      getSelfConversationHistoriesThunk.rejected,
      (state, action) => {
        state.listSelfConversationLoading = false;
        state.selfConversationDataResponse = null;
        state.listSelfConversationError = action.payload
          ? action.payload
          : null;
      }
    );

    // Add new category
    builder.addCase(addNewConversationHistoryThunk.pending, (state) => {
      state.saveConversationLoading = true;
      state.savedConversation = null;
      state.saveConversationError = null;
    });
    builder.addCase(
      addNewConversationHistoryThunk.fulfilled,
      (state, action) => {
        state.saveConversationLoading = false;
        state.savedConversation = action.payload.data;
        state.saveConversationError = null;
      }
    );
    builder.addCase(
      addNewConversationHistoryThunk.rejected,
      (state, action) => {
        state.saveConversationLoading = false;
        state.savedConversation = null;
        state.saveConversationError = action.payload ? action.payload : null;
      }
    );

    // Delete category
    builder.addCase(deleteConversationHistoryThunk.pending, (state) => {
      state.deleteConversationHistoryLoading = true;
      state.deleteConversationHistorySuccess = null;
      state.deleteConversationHistoryError = null;
    });
    builder.addCase(
      deleteConversationHistoryThunk.fulfilled,
      (state, action) => {
        state.deleteConversationHistoryLoading = false;
        state.deleteConversationHistorySuccess = action.payload.data;
        state.deleteConversationHistoryError = null;
      }
    );
    builder.addCase(
      deleteConversationHistoryThunk.rejected,
      (state, action) => {
        state.deleteConversationHistoryLoading = false;
        state.deleteConversationHistorySuccess = null;
        state.deleteConversationHistoryError = action.payload
          ? action.payload
          : null;
      }
    );
  },
});
export const {
  appendConversationHistoryFirst,
  appendConversationHistoryLast,
  removeConversationHistoryById,
  clearConversationHistoryData,
  updateConversationHistory,
  resetConversationHistoryStatus,
} = conversationHistorySlice.actions;
export default conversationHistorySlice.reducer;
