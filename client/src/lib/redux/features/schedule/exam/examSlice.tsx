import { ExamScheduleState, ResetExamScheduleStatusPayload } from "@/lib/types/redux-scheudule";
import { PayloadAction, createSlice } from "@reduxjs/toolkit";
import { generateExamScheduleThunk, saveExamScheduleThunk } from "./examActions";

const initialState: ExamScheduleState = {
    generateExamScheduleLoading: false,
    examSchedules: null,
    generateExamScheduleError: null,

    saveExamScheduleLoading: false,
    savedExamSchedule: [],
    saveExamScheduleError: null,
};

const examSlice = createSlice({
    name: "examSchedule",
    initialState, 
    reducers: {
        resetExamScheduleStatus: (
            state, 
            action: PayloadAction<ResetExamScheduleStatusPayload>
        ) => {
            const { keys } = action.payload;

            keys.forEach((key) => {
                if (key in state)
                    state[key as keyof ExamScheduleState] = initialState[key];
            })
        }
    }, 
    extraReducers: (builder) => {
        builder.addCase(generateExamScheduleThunk.pending, (state) => {
            state.generateExamScheduleLoading = true;
            state.examSchedules = null;
            state.generateExamScheduleError = null;
        });
        builder.addCase(generateExamScheduleThunk.fulfilled, (state, action) => {
            state.generateExamScheduleLoading = false;
            state.examSchedules = action.payload.data;
            state.generateExamScheduleError = null;
        });
        builder.addCase(generateExamScheduleThunk.rejected, (state, action) => {
            state.generateExamScheduleLoading = false;
            state.examSchedules = null;
            state.generateExamScheduleError = action.payload ? action.payload : null;
        });

        builder.addCase(saveExamScheduleThunk.pending, (state) => {
            state.saveExamScheduleLoading = true;
            state.savedExamSchedule = [];
            state.saveExamScheduleError = null;
        });
        builder.addCase(saveExamScheduleThunk.fulfilled, (state, action) => {
            state.saveExamScheduleLoading = false;
            state.savedExamSchedule = action.payload.data;
            state.saveExamScheduleError = null;
        });
        builder.addCase(saveExamScheduleThunk.rejected, (state, action) => {
            state.saveExamScheduleLoading = false;
            state.savedExamSchedule = [];
            state.saveExamScheduleError = action.payload ? action.payload : null;
        });
    },
});

export const {
    resetExamScheduleStatus
} = examSlice.actions;

export default examSlice.reducer;