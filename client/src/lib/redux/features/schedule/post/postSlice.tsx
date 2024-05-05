import { PostState, ResetPostStatusPayload } from "@/lib/types/redux-scheudule";
import { PayloadAction, createSlice } from "@reduxjs/toolkit";
import { getPostByIdThunk, getPostsThunk } from "./postActions";

const initialState: PostState = {
    getListPostLoading: false,
    listPost: null,
    getListPostError: null,

    getPostLoading: false,
    post: null,
    getPostError: null,
};

const postSlice = createSlice({
    name: "post",
    initialState,
    reducers: {
        appendPostFirst: (state, action) => {
            if (state.listPost) {
                const updatedState = {
                    ...state.listPost,
                    data: [action.payload.content, ...state.listPost.data],
                };
                state.listPost = updatedState;
            }
        },
        clearPostData: (state) => {
            state.listPost = null;
        }, 
        resetPostStatus: (
            state,
            action: PayloadAction<ResetPostStatusPayload>
        ) => {
            const { keys } = action.payload;

            keys.forEach((key) => {
                if (key in state) 
                    state[key as keyof PostState] = initialState[key];
            });
        },
    },
    extraReducers: (builder) => {
        builder.addCase(getPostsThunk.pending, (state) => {
            state.getListPostLoading = true;
            state.listPost = null;
            state.getListPostError = null;
        });
        builder.addCase(getPostsThunk.fulfilled, (state, action) => {
            state.getListPostLoading = false;
            state.listPost = action.payload.data;
            state.getListPostError = null;
        });
        builder.addCase(getPostsThunk.rejected, (state, action) => {
            state.getListPostLoading = false;
            state.listPost = null;
            state.getListPostError = action.payload ? action.payload : null;
        });

        builder.addCase(getPostByIdThunk.pending, (state) => {
            state.getListPostLoading = true;
            state.post = null;
            state.getListPostError = null;
        });
        builder.addCase(getPostByIdThunk.fulfilled, (state, action) => {
            state.getListPostLoading = false;
            state.post = action.payload.data;
            state.getListPostError = null;
        });
        builder.addCase(getPostByIdThunk.rejected, (state, action) => {
            state.getListPostLoading = false;
            state.post = null;
            state.getListPostError = action.payload ? action.payload : null;
        });
    },
});

export const {
    appendPostFirst, 
    clearPostData,
    resetPostStatus
} = postSlice.actions;

export default postSlice.reducer;