import { createAsyncThunk } from "@reduxjs/toolkit";
// @ts-ignore
import Cookies from "js-cookie";

import { ISigninResponse, IUserLogin, User } from "@/lib/types/backend";
import AuthApi from "./authApi";

export const signinThunk = createAsyncThunk(
  "signin",
  async (payload: IUserLogin, { rejectWithValue }) => {
    try {
      const response = await AuthApi.signin(payload);
      const data = response.data;

      Cookies.set("token", data.access_token);
      Cookies.set("refreshToken", data.refresh_token);

      return response;
    } catch (error: any) {
      if (error.response && error.response.data.message)
        return rejectWithValue(error.response.data.message);
      return rejectWithValue(error.message);
    }
  }
);

export const getProfileThunk = createAsyncThunk(
  "getProfile",
  async (_, { rejectWithValue }) => {
    try {
      return (await AuthApi.getProfile()).data;
    } catch (error: any) {
      if (error.response && error.response.data.message)
        return rejectWithValue(error.response.data.message);
      return rejectWithValue(error.message);
    }
  }
);

export const handleAddOrUpdateUserToLocalStorage = (
  userAttributes: Partial<User>
) => {
  const userProfileStr = localStorage.getItem('userProfile');

  if (userProfileStr) {
    const userProfileJson = JSON.parse(userProfileStr);

    const updatedUser = {
      ...userProfileJson,
      ...userAttributes,
    };

    localStorage.setItem('userProfile', JSON.stringify(updatedUser));
  } else {
    localStorage.setItem('userProfile', JSON.stringify(userAttributes));
  }
};
