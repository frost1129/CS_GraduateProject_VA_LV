import { ResetSubjectStatusPayload, SubjectState } from "@/lib/types/redux-scheudule";
import { PayloadAction, createSlice } from "@reduxjs/toolkit";
import { addSubjectThunk, getSubjectsThunk, uploadSubjectsThunk } from "./subjectActions";

const initialState: SubjectState = {
    getSubjectLoading: false,
    subjects: null,
    getSubjectError: null,

    saveSubjectLoading: false,
    savedSubject: null,
    saveSubjectError: null,

    uploadSubjectLoading: false,
    uploadedSubject: [],
    uploadSubjectError: null,
};

const subjectSlice = createSlice({
    name: "subject", 
    initialState,
    reducers: {
        // appendSubjectFirst: (state, action) => {
        //     if (state.subjects) {
        //         const updatedState = {
        //             ...state.subjects,
        //             data: [action.payload.content, ...state.subjects.data],
        //         };
        //         state.subjects = updatedState;
        //     }
        // },
        clearSubjectData: (state) => {
            state.subjects = null;
        }, 
        resetSubjectStatus: (
            state, 
            action: PayloadAction<ResetSubjectStatusPayload>
        ) => {
            const { keys } = action.payload;

            keys.forEach((key) => {
                if (key in state) 
                    state[key as keyof SubjectState] = initialState[key];
            });
        },
    }, 
    extraReducers: (builder) => {
        builder.addCase(getSubjectsThunk.pending, (state) => {
            state.getSubjectLoading = true;
            state.subjects = null;
            state.getSubjectError = null;
        });
        builder.addCase(getSubjectsThunk.fulfilled, (state, action) => {
            state.getSubjectLoading = false;
            state.subjects = action.payload.data;
            state.getSubjectError = null;
        });
        builder.addCase(getSubjectsThunk.rejected, (state, action) => {
            state.getSubjectLoading = false;
            state.subjects = null;
            state.getSubjectError = action.payload ? action.payload : null;
        });

        builder.addCase(addSubjectThunk.pending, (state) => {
            state.saveSubjectLoading = true;
            state.savedSubject = null;
            state.saveSubjectError = null;
        });
        builder.addCase(addSubjectThunk.fulfilled, (state, action) => {
            state.saveSubjectLoading = false;
            state.savedSubject = action.payload.data;
            state.saveSubjectError = null;
        });
        builder.addCase(addSubjectThunk.rejected, (state, action) => {
            state.saveSubjectLoading = false;
            state.savedSubject = null;
            state.saveSubjectError = action.payload ? action.payload : null;
        });

        builder.addCase(uploadSubjectsThunk.pending, (state) => {
            state.uploadSubjectLoading = true;
            state.uploadedSubject = [];
            state.uploadSubjectError = null;
        });
        builder.addCase(uploadSubjectsThunk.fulfilled, (state, action) => {
            state.uploadSubjectLoading = false;
            state.uploadedSubject = action.payload.data;
            state.uploadSubjectError = null;
        });
        builder.addCase(uploadSubjectsThunk.rejected, (state, action) => {
            state.uploadSubjectLoading = false;
            state.uploadedSubject = [];
            state.uploadSubjectError = action.payload ? action.payload : null;
        });
    }
});

export const {
    clearSubjectData,
    resetSubjectStatus
} = subjectSlice.actions;

export default subjectSlice.reducer;