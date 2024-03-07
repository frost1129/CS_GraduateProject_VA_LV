import { AuthState } from "@/lib/types/redux";
import { createSlice } from "@reduxjs/toolkit";
import { signinThunk } from "./authActions";

const initialState: AuthState = {
  signInLoading: false,
  signInSuccess: false,
  signInError: null,
};

const authSlice = createSlice({
  name: "auth",
  initialState,
  reducers: {},
  extraReducers: (builder) => {
    // Action: Sign in
    builder.addCase(signinThunk.pending, (state) => {
      state.signInLoading = true;
      state.signInSuccess = false;
      state.signInError = null;
    });
    builder.addCase(signinThunk.fulfilled, (state) => {
      state.signInLoading = false;
      state.signInSuccess = true;
      state.signInError = null;
    });
    builder.addCase(signinThunk.rejected, (state, action) => {
      state.signInLoading = false;
      state.signInSuccess = false;
      state.signInError = action.payload !== undefined ? action.payload : null;
    });
  },
});

export default authSlice.reducer;
