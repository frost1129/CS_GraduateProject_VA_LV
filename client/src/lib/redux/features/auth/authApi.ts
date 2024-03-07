import {
  IUserChangePassword,
  IUserLogin,
  IUserRegister,
  IUserUpdateProfile,
} from "@/lib/types/backend";
import AxiosClient from "../../AxiosClient";

const authApi = {
  signin: (payload: IUserLogin) =>
    AxiosClient.post("/auth/signin", { ...payload }),
    
  signup: (payload: IUserRegister) =>
    AxiosClient.post("/auth/signup", { ...payload }),

  refreshToken: (refreshToken: string) =>
    AxiosClient.post("/auth/refreshToken", { refreshToken }),

  updateProfile: (payload: IUserUpdateProfile) =>
    AxiosClient.patch("/auth/update", { ...payload }),

  updatePassword: (payload: IUserChangePassword) =>
    AxiosClient.post("/auth/password", { ...payload }),
};

export default authApi;
