import { ExamScheduleState, ResetExamScheduleStatusPayload } from "@/lib/types/redux-scheudule";
import { PayloadAction, createSlice } from "@reduxjs/toolkit";
import { generateExamScheduleThunk, getStudentExamTimeTableThunk, getYearCodeExamTimeTableThunk, saveExamScheduleThunk } from "./examActions";

const initialState: ExamScheduleState = {
    generateExamScheduleLoading: false,
    examSchedules: null,
    generateExamScheduleError: null,

    saveExamScheduleLoading: false,
    savedExamSchedule: [],
    saveExamScheduleError: null,

    getStudentExamsLoading: false,
    studentExams: [],
    getStudentExamsError: null,

    getYearCodeExamsLoading: false, 
    yearCodeExams: [],
    getYearCodeExamsError: null,
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

        builder.addCase(getStudentExamTimeTableThunk.pending, (state) => {
            state.getStudentExamsLoading = true;
            state.studentExams = [];
            state.getStudentExamsError = null;
        });
        builder.addCase(getStudentExamTimeTableThunk.fulfilled, (state, action) => {
            state.getStudentExamsLoading = false;
            state.studentExams = action.payload.data;
            state.getStudentExamsError = null;
        });
        builder.addCase(getStudentExamTimeTableThunk.rejected, (state, action) => {
            state.getStudentExamsLoading = false;
            state.studentExams = [];
            state.getStudentExamsError = action.payload ? action.payload : null;
        });

        builder.addCase(getYearCodeExamTimeTableThunk.pending, (state) => {
            state.getYearCodeExamsLoading = true;
            state.yearCodeExams = [];
            state.getYearCodeExamsError = null;
        });
        builder.addCase(getYearCodeExamTimeTableThunk.fulfilled, (state, action) => {
            state.getYearCodeExamsLoading = false;
            state.yearCodeExams = action.payload.data;
            state.getYearCodeExamsError = null;
        });
        builder.addCase(getYearCodeExamTimeTableThunk.rejected, (state, action) => {
            state.getYearCodeExamsLoading = false;
            state.yearCodeExams = [];
            state.getYearCodeExamsError = action.payload ? action.payload : null;
        });
    },
});

export const {
    resetExamScheduleStatus
} = examSlice.actions;

export default examSlice.reducer;