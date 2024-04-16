import { IUserLogin } from "@/lib/types/backend";
import axiosAuthentication from "../../apis/axiosAuthentication";
// @ts-ignore
import Cookies from "js-cookie";

const authApi = {
  signin: (payload: IUserLogin) =>
    axiosAuthentication.post("/token", {
      ...payload,
      grant_type: "password",
      client_id: process.env.NEXT_PUBLIC_CLIENT_ID,
      client_secret: process.env.NEXT_PUBLIC_CLIENT_SECRET,
    }),

  refreshToken: (refreshToken: string) =>
    axiosAuthentication.post("/token", {
      grant_type: "refresh_token",
      refresh_token: refreshToken,
      client_id: process.env.NEXT_PUBLIC_CLIENT_ID,
      client_secret: process.env.NEXT_PUBLIC_CLIENT_SECRET,
    }),

  getProfile: () => axiosAuthentication.get("/userinfo"),

  // signup: (payload: IUserRegister) =>
  //   axiosAuthentication.post("/auth/signup", { ...payload }),

  // refreshToken: (refreshToken: string) =>
  //   axiosAuthentication.post("/auth/refreshToken", { refreshToken }),

  // updateProfile: (payload: IUserUpdateProfile) =>
  //   axiosAuthentication.patch("/auth/update", { ...payload }),

  // updatePassword: (payload: IUserChangePassword) =>
  //   axiosAuthentication.post("/auth/password", { ...payload }),
};

export default authApi;
