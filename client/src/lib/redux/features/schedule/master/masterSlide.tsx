import { MasterState, ResetMasterStatusPayload } from "@/lib/types/redux-scheudule";
import { PayloadAction, createSlice } from "@reduxjs/toolkit";
import { getSchoolYearsThunk, getTimeSlotsThunk, getYearCodeByYearsThunk } from "./masterAction";

const initialState: MasterState = {
    getSchoolYearLoading: false,
    schoolYears: [],
    getSchoolYearError: null,

    getTimeSlotLoading: false,
    timeSlots: [],
    getTimeSlotError: null,

    getYearCodeLoading: false,
    yearCodes: [],
    getYearCodeError: null,
};

const masterSlice = createSlice({
    name: "master",
    initialState,
    reducers: {
        clearSchoolYearData: (state) => {
            state.schoolYears = [];
        }, 

        clearTimeSlotData: (state) => {
            state.timeSlots = [];
        }, 

        clearYearCodeData: (state) => {
            state.yearCodes = []
        }, 

        resetMasterStatus: (
            state, 
            action: PayloadAction<ResetMasterStatusPayload>
        ) => {
            const { keys } = action.payload;

            keys.forEach((key) => {
                if (key in state)
                    state[key as keyof MasterState] = initialState[key];
            });
        },
    },
    extraReducers: (builder) => {
        builder.addCase(getSchoolYearsThunk.pending, (state) => {
            state.getSchoolYearLoading = true;
            state.schoolYears = [];
            state.getSchoolYearError = null;
        });
        builder.addCase(getSchoolYearsThunk.fulfilled, (state, action) => {
            state.getSchoolYearLoading = false;
            state.schoolYears = action.payload.data;
            state.getSchoolYearError = null;
        });
        builder.addCase(getSchoolYearsThunk.rejected, (state, action) => {
            state.getSchoolYearLoading = false;
            state.schoolYears = [];
            state.getSchoolYearError = action.payload ? action.payload : null;
        });

        builder.addCase(getTimeSlotsThunk.pending, (state) => {
            state.getTimeSlotLoading = true;
            state.timeSlots = [];
            state.getTimeSlotError = null;
        });
        builder.addCase(getTimeSlotsThunk.fulfilled, (state, action) => {
            state.getTimeSlotLoading = false;
            state.timeSlots = action.payload.data;
            state.getTimeSlotError = null;
        });
        builder.addCase(getTimeSlotsThunk.rejected, (state, action) => {
            state.getTimeSlotLoading = false;
            state.timeSlots = [];
            state.getTimeSlotError = action.payload ? action.payload : null;
        });

        builder.addCase(getYearCodeByYearsThunk.pending, (state) => {
            state.getYearCodeLoading = true;
            state.yearCodes = [];
            state.getYearCodeError = null;
        });
        builder.addCase(getYearCodeByYearsThunk.fulfilled, (state, action) => {
            state.getYearCodeLoading = false;
            state.yearCodes = action.payload.data;
            state.getYearCodeError = null;
        });
        builder.addCase(getYearCodeByYearsThunk.rejected, (state, action) => {
            state.getYearCodeLoading = false;
            state.yearCodes = [];
            state.getYearCodeError = action.payload ? action.payload : null;
        });
    },
});

export const {
    clearSchoolYearData,
    clearTimeSlotData, 
    clearYearCodeData,
    resetMasterStatus
} = masterSlice.actions;

export default masterSlice.reducer;