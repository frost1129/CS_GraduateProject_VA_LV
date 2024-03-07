import {
  IUserChangePassword,
  IUserLogin,
  IUserRegister,
  IUserUpdateProfile,
} from "@/lib/types/backend";
import axiosAuthentication from "../../apis/axiosAuthentication";

const authApi = {
  signin: (payload: IUserLogin) =>
    axiosAuthentication.post("/auth/signin", { ...payload }),
    
  signup: (payload: IUserRegister) =>
    axiosAuthentication.post("/auth/signup", { ...payload }),

  refreshToken: (refreshToken: string) =>
    axiosAuthentication.post("/auth/refreshToken", { refreshToken }),

  updateProfile: (payload: IUserUpdateProfile) =>
    axiosAuthentication.patch("/auth/update", { ...payload }),

  updatePassword: (payload: IUserChangePassword) =>
    axiosAuthentication.post("/auth/password", { ...payload }),
};

export default authApi;
