import { createAsyncThunk } from "@reduxjs/toolkit";
// @ts-ignore
import Cookies from "js-cookie";

import { ISigninResponse, IUserLogin } from "@/lib/types/backend";
import AuthApi from "./authApi";

export const signinThunk = createAsyncThunk(
  "signin",
  async (payload: IUserLogin, { rejectWithValue }) => {
    try {
      const response = await AuthApi.signin(payload);
      const data: ISigninResponse = response.data;

      Cookies.set("token", data.token);
      Cookies.set("refreshToken", data.refreshToken);

      return response;
    } catch (error: any) {
      if (error.response && error.response.data.message)
        return rejectWithValue(error.response.data.message);
      return rejectWithValue(error.message);
    }
  }
);
