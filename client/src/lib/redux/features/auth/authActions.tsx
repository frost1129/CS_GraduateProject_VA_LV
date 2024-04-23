import { createAsyncThunk } from "@reduxjs/toolkit";
// @ts-ignore
import Cookies from "js-cookie";

import { IUserLogin, UserKeycloakResponse } from "@/lib/types/backend";
import authApi from "./authApi";

export const signinThunk = createAsyncThunk(
  "signin",
  async (payload: IUserLogin, { rejectWithValue }) => {
    try {
      const response = await authApi.signin(payload);
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

export const logoutThunk = createAsyncThunk(
  "logout",
  async (payload: string, { rejectWithValue }) => {
    try {
      const response = await authApi.logout(payload);

      if (response.status === 204) {
        Cookies.remove("token");
        Cookies.remove("refreshToken");
        localStorage.removeItem("userProfile");

        window.location.reload();
      }
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
      return (await authApi.getProfile()).data;
    } catch (error: any) {
      if (error.response && error.response.data.message)
        return rejectWithValue(error.response.data.message);
      return rejectWithValue(error.message);
    }
  }
);

export const handleAddOrUpdateUserToLocalStorage = (
  userAttributes: Partial<UserKeycloakResponse>
) => {
  const userProfileStr = localStorage.getItem("userProfile");

  if (userProfileStr) {
    const userProfileJson = JSON.parse(userProfileStr);

    const updatedUser = {
      ...userProfileJson,
      ...userAttributes,
    };

    localStorage.setItem("userProfile", JSON.stringify(updatedUser));
  } else {
    localStorage.setItem("userProfile", JSON.stringify(userAttributes));
  }
};
