import { EnrollmentState, ResetEnrollStatusPayload } from "@/lib/types/redux-scheudule";
import { PayloadAction, createSlice } from "@reduxjs/toolkit";
import { getTimeTableThunk, uploadEnrollmentsThunk } from "./enrollActions";

const initialState: EnrollmentState = {
    getTimeTableLoading: false,
    timeTables: [],
    getTimeTableError: null,

    uploadTimeTableLoading: false,
    uploadedTimeTable: [],
    uploadTimeTableError: null,
};

const enrollSlice = createSlice({
    name: "enrollment",
    initialState, 
    reducers: {
        clearTimeTableData: (state) => {
            state.timeTables = [];
        },
        resetEnrollStatus: (
            state,
            action: PayloadAction<ResetEnrollStatusPayload>
        ) => {
            const { keys } = action.payload;

            keys.forEach((key) => {
                if (key in state)
                    state[key as keyof EnrollmentState] = initialState[key];
            })
        }
    }, 
    extraReducers: (builder) => {
        builder.addCase(getTimeTableThunk.pending, (state) => {
            state.getTimeTableLoading = true;
            state.timeTables = [];
            state.getTimeTableError = null;
        });
        builder.addCase(getTimeTableThunk.fulfilled, (state, action) => {
            state.getTimeTableLoading = false;
            state.timeTables = action.payload.data;
            state.getTimeTableError = null;
        });
        builder.addCase(getTimeTableThunk.rejected, (state, action) => {
            state.getTimeTableLoading = false;
            state.timeTables = [];
            state.getTimeTableError = action.payload ? action.payload : null;
        });

        builder.addCase(uploadEnrollmentsThunk.pending, (state) => {
            state.uploadTimeTableLoading = true;
            state.uploadedTimeTable = [];
            state.uploadTimeTableError = null;
        });
        builder.addCase(uploadEnrollmentsThunk.fulfilled, (state, action) => {
            state.uploadTimeTableLoading = false;
            state.uploadedTimeTable = action.payload.data;
            state.uploadTimeTableError = null;
        });
        builder.addCase(uploadEnrollmentsThunk.rejected, (state, action) => {
            state.uploadTimeTableLoading = false;
            state.uploadedTimeTable = [];
            state.uploadTimeTableError = action.payload ? action.payload : null;
        });
    },
});

export const {
    clearTimeTableData,
    resetEnrollStatus
} = enrollSlice.actions;

export default enrollSlice.reducer;