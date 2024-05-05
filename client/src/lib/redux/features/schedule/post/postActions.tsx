import { SearchRequestParams } from "@/lib/types/redux-scheudule";
import { createAsyncThunk } from "@reduxjs/toolkit";
import postApi from "./postApi";

export const getPostsThunk = createAsyncThunk(
    "getPosts", 
    async (params: SearchRequestParams, { rejectWithValue }) => {
        try {
            return await postApi.getPosts(params);
        } catch (error: any) {
            if (error.response && error.response.data && error.response.data.message)
                return rejectWithValue(error.response.data.message);
            return rejectWithValue(error.message);
        }
    }
);

export const getPostByIdThunk = createAsyncThunk (
    "getPostById", 
    async (postId: string, { rejectWithValue }) => {
        try {
            return await postApi.getPostById(postId);
        } catch (error: any) {
            if (error.response && error.response.data && error.response.data.message)
                return rejectWithValue(error.response.data.message);
            return rejectWithValue(error.message);
        }
    }
)