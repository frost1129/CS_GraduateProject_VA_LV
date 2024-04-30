import { createSlice, PayloadAction } from "@reduxjs/toolkit";

import {
  ResetSchoolYearStatusPayload,
  SchoolYearState,
} from "@/lib/types/redux";
import {
  addNewSchoolYearThunk,
  deleteSchoolYearThunk,
  getSchoolYearsThunk,
  updateSchoolYearThunk,
} from "./schoolYearActions";

const initialState: SchoolYearState = {
  listSchoolYearLoading: false,
  schoolYearDataResponse: null,
  listSchoolYearError: null,

  saveSchoolYearLoading: false,
  savedSchoolYear: null,
  saveSchoolYearError: null,

  updateSchoolYearLoading: false,
  updatedSchoolYear: null,
  updateSchoolYearError: null,

  deleteSchoolYearLoading: false,
  deleteSchoolYearSuccess: null,
  deleteSchoolYearError: null,
};

const schoolYearSlice = createSlice({
  name: "schoolYear",
  initialState,
  reducers: {
    appendSchoolYearFirst: (state, action) => {
      if (state.schoolYearDataResponse) {
        const updatedState = {
          ...state.schoolYearDataResponse,
          data: [
            action.payload.schoolYear,
            ...state.schoolYearDataResponse.data,
          ],
        };
        state.schoolYearDataResponse = updatedState;
      }
    },
    appendSchoolYearLast: (state, action) => {
      if (state.schoolYearDataResponse) {
        const updatedState = {
          ...state.schoolYearDataResponse,
          data: [
            ...state.schoolYearDataResponse.data,
            action.payload.schoolYear,
          ],
        };
        state.schoolYearDataResponse = updatedState;
      }
    },
    removeSchoolYearById: (state, action) => {
      if (state.schoolYearDataResponse) {
        const updatedState = {
          ...state.schoolYearDataResponse,
          data: state.schoolYearDataResponse.data.filter(
            (s) => s.id !== action.payload.schoolYearId
          ),
        };
        state.schoolYearDataResponse = updatedState;
      }
    },
    clearSchoolYearData: (state) => {
      state.schoolYearDataResponse = null;
    },
    updateSchoolYear: (state, action) => {
      if (state.schoolYearDataResponse) {
        const updatedState = {
          ...state.schoolYearDataResponse,
          data: state.schoolYearDataResponse.data.map((s) => {
            if (s.id === action.payload.schoolYear.id)
              return { ...s, ...action.payload.schoolYear };
            return s;
          }),
        };
        state.schoolYearDataResponse = updatedState;
      }
    },

    resetSchoolYearStatus: (
      state,
      action: PayloadAction<ResetSchoolYearStatusPayload>
    ) => {
      const { keys } = action.payload;

      keys.forEach((key) => {
        if (key in state)
          state[key as keyof SchoolYearState] = initialState[key];
      });
    },
  },
  extraReducers: (builder) => {
    // Get school years
    builder.addCase(getSchoolYearsThunk.pending, (state) => {
      state.listSchoolYearLoading = true;
      state.schoolYearDataResponse = null;
      state.listSchoolYearError = null;
    });
    builder.addCase(getSchoolYearsThunk.fulfilled, (state, action) => {
      state.listSchoolYearLoading = false;
      state.schoolYearDataResponse = action.payload.data;
      state.listSchoolYearError = null;
    });
    builder.addCase(getSchoolYearsThunk.rejected, (state, action) => {
      state.listSchoolYearLoading = false;
      state.schoolYearDataResponse = null;
      state.listSchoolYearError = action.payload ? action.payload : null;
    });

    // Add new school year
    builder.addCase(addNewSchoolYearThunk.pending, (state) => {
      state.saveSchoolYearLoading = true;
      state.savedSchoolYear = null;
      state.saveSchoolYearError = null;
    });
    builder.addCase(addNewSchoolYearThunk.fulfilled, (state, action) => {
      state.saveSchoolYearLoading = false;
      state.savedSchoolYear = action.payload.data;
      state.saveSchoolYearError = null;
    });
    builder.addCase(addNewSchoolYearThunk.rejected, (state, action) => {
      state.saveSchoolYearLoading = false;
      state.savedSchoolYear = null;
      state.saveSchoolYearError = action.payload ? action.payload : null;
    });

    // Update school year
    builder.addCase(updateSchoolYearThunk.pending, (state) => {
      state.updateSchoolYearLoading = true;
      state.updatedSchoolYear = null;
      state.updateSchoolYearError = null;
    });
    builder.addCase(updateSchoolYearThunk.fulfilled, (state, action) => {
      state.updateSchoolYearLoading = false;
      state.updatedSchoolYear = action.payload.data;
      state.updateSchoolYearError = null;
    });
    builder.addCase(updateSchoolYearThunk.rejected, (state, action) => {
      state.updateSchoolYearLoading = false;
      state.updatedSchoolYear = null;
      state.updateSchoolYearError = action.payload ? action.payload : null;
    });

    // Delete school year
    builder.addCase(deleteSchoolYearThunk.pending, (state) => {
      state.deleteSchoolYearLoading = true;
      state.deleteSchoolYearSuccess = null;
      state.deleteSchoolYearError = null;
    });
    builder.addCase(deleteSchoolYearThunk.fulfilled, (state, action) => {
      state.deleteSchoolYearLoading = false;
      state.deleteSchoolYearSuccess = action.payload.data;
      state.deleteSchoolYearError = null;
    });
    builder.addCase(deleteSchoolYearThunk.rejected, (state, action) => {
      state.deleteSchoolYearLoading = false;
      state.deleteSchoolYearSuccess = null;
      state.deleteSchoolYearError = action.payload ? action.payload : null;
    });
  },
});
export const {
  appendSchoolYearFirst,
  appendSchoolYearLast,
  removeSchoolYearById,
  clearSchoolYearData,
  updateSchoolYear,
  resetSchoolYearStatus,
} = schoolYearSlice.actions;
export default schoolYearSlice.reducer;
