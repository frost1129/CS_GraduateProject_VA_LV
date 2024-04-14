import { AuthState } from "@/lib/types/redux";
import { createSlice } from "@reduxjs/toolkit";
import { getProfileThunk, handleAddOrUpdateUserToLocalStorage, signinThunk } from "./authActions";

const initialState: AuthState = {
  signInLoading: false,
  signInSuccess: false,
  signInError: null,
  
  getProfileLoading: false,
  userProfile: null,
  getProfileError: null
};

const authSlice = createSlice({
  name: "auth",
  initialState,
  reducers: {
    resetSigninStatus: (state) => {
      return {
        ...state,
        signInLoading: false,
        signInSuccess: false,
        signInError: null,
      };
    },
    getUserProfileFromLocalStorage: (state) => {
      const userProfileString = localStorage.getItem("userProfile");
      if (userProfileString) state.userProfile = JSON.parse(userProfileString);
    },
  },
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

    // Action: Get Profile
    builder.addCase(getProfileThunk.pending, (state) => {
      state.getProfileLoading = true;
      state.userProfile = null;
      state.signInError = null;
    });
    builder.addCase(getProfileThunk.fulfilled, (state, action) => {
      state.getProfileLoading = false;
      state.userProfile = action.payload;
      state.signInError = null;

      handleAddOrUpdateUserToLocalStorage(action.payload);
    });
    builder.addCase(getProfileThunk.rejected, (state, action) => {
      state.getProfileLoading = false;
      state.userProfile = null;
      state.signInError = action.payload !== undefined ? action.payload : null;
    });
  },
});

export const { resetSigninStatus, getUserProfileFromLocalStorage } = authSlice.actions;
export default authSlice.reducer;
