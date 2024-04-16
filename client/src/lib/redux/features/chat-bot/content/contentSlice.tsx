import { createSlice } from "@reduxjs/toolkit";
import { getAllContentThunk } from "./contentActions";
// import { getAllContentThunk } from "./contentActions";

const initialState: any = {
  contents: [],
};

const authSlice = createSlice({
  name: "content",
  initialState,
  reducers: {},
  extraReducers: (builder) => {
    builder.addCase(getAllContentThunk.pending, (state, action) => {
      state.contents = [];
    });
    builder.addCase(getAllContentThunk.fulfilled, (state, action) => {
      state.contents = action.payload;
    });
    builder.addCase(getAllContentThunk.rejected, (state, action) => {
      state.contents = [];
    });
  },
});

export default authSlice.reducer;
