import { ResetSubjectClassStatusPayload, SubjectClassState } from "@/lib/types/redux-scheudule";
import { PayloadAction, createSlice } from "@reduxjs/toolkit";
import { getAssignedYearCodeThunk, getSubjectClassesThunk, uploadSubjectClassThunk } from "./subjectClassActions";

const initialState: SubjectClassState = {
    getSubjectClassLoading: false,
    subjectClasses: null,
    getSubjectClassError: null,

    uploadSubjectClassLoading: false,
    uploadedSubjectClass: [],
    uploadSubjectClassError: null,

    getAssignedYearCodeLoading: false,
    assignedYearCode: [],
    getAssignedYearCodeError: null,
};

const subjectClassSlice = createSlice({
    name: "subjectClass",
    initialState, 
    reducers: {
        appendSubjectClassFirst: (state, action) => {
            if (state.subjectClasses) {
                const updatedState = {
                    ...state.subjectClasses, 
                    data: [action.payload.content, ...state.subjectClasses.data],
                };
                state.subjectClasses = updatedState;
            }
        }, 
        clearSubjectClassData: (state) => {
            state.subjectClasses = null;
        },
        resetSubjectClassStatus: (
            state, 
            action: PayloadAction<ResetSubjectClassStatusPayload>
        ) => {
            const { keys } = action.payload;

            keys.forEach((key) => {
                if (key in state) 
                    state[key as keyof SubjectClassState] = initialState[key];
            });
        }
    }, 
    extraReducers: (builder) => {
        builder.addCase(getSubjectClassesThunk.pending, (state) => {
            state.getSubjectClassLoading = true;
            state.subjectClasses = null;
            state.getSubjectClassError = null;
        });
        builder.addCase(getSubjectClassesThunk.fulfilled, (state, action) => {
            state.getSubjectClassLoading = false;
            state.subjectClasses = action.payload.data;
            state.getSubjectClassError = null;
        });
        builder.addCase(getSubjectClassesThunk.rejected, (state, action) => {
            state.getSubjectClassLoading = false;
            state.subjectClasses = null;
            state.getSubjectClassError = action.payload ? action.payload : null;
        });

        builder.addCase(uploadSubjectClassThunk.pending, (state) => {
            state.uploadSubjectClassLoading = true;
            state.uploadedSubjectClass = [];
            state.uploadSubjectClassError = null;
        });
        builder.addCase(uploadSubjectClassThunk.fulfilled, (state, action) => {
            state.uploadSubjectClassLoading = false;
            state.uploadedSubjectClass = action.payload.data;
            state.uploadSubjectClassError = null;
        });
        builder.addCase(uploadSubjectClassThunk.rejected, (state, action) => {
            state.uploadSubjectClassLoading = false;
            state.uploadedSubjectClass = [];
            state.uploadSubjectClassError = action.payload ? action.payload : null;
        });

        builder.addCase(getAssignedYearCodeThunk.pending, (state) => {
            state.getAssignedYearCodeLoading = true;
            state.assignedYearCode = [];
            state.getAssignedYearCodeError = null;
        });
        builder.addCase(getAssignedYearCodeThunk.fulfilled, (state, action) => {
            state.getAssignedYearCodeLoading = false;
            state.assignedYearCode = action.payload.data;
            state.getAssignedYearCodeError = null;
        });
        builder.addCase(getAssignedYearCodeThunk.rejected, (state, action) => {
            state.getAssignedYearCodeLoading = false;
            state.assignedYearCode = [];
            state.getAssignedYearCodeError = action.payload ? action.payload : null;
        });
    },
});

export const {
    appendSubjectClassFirst,
    clearSubjectClassData, 
    resetSubjectClassStatus
} = subjectClassSlice.actions;

export default subjectClassSlice.reducer;