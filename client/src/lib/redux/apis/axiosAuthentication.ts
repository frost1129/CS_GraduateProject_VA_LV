// @ts-ignore
import Cookies from "js-cookie";
import axios from "axios";

const axiosAuthentication = axios.create({
  baseURL: process.env.NEXT_PUBLIC_API_HOST_AUTHENTICATION,
  headers: {
    "Content-Type": "application/x-www-form-urlencoded",
  },
});

axiosAuthentication.interceptors.request.use(
  (config) => {
    config.headers.Authorization = `Bearer ${Cookies.get("token") || ""}`;
    return config;
  },
  (error) => Promise.reject(error)
);

axiosAuthentication.interceptors.response.use(
  (response) => response,
  async (error) => {
    // const originalRequest = error.config;

    // // Case: token is expired | Use refresh token to get new token & refresh token
    // if (error.response?.status === 401 && !originalRequest._retry) {
    //   originalRequest._retry = true;
    //   const refreshToken = Cookies.get("refreshToken");
    //   if (refreshToken) {
    //     const res = await AuthApi.refreshToken(refreshToken);
    //     Cookies.set("token", res.data.token);
    //     Cookies.set("refreshToken", res.data.refreshToken);

    //     originalRequest.headers["Authorization"] = `Bearer ${res.data.token}`;
    //     return axiosAuthentication(originalRequest);
    //   }
    // } else if (error.response?.status === 418) {
    //   // Case: both token and refresh token are expired
    //   Cookies.remove("refreshToken");
    //   Cookies.remove("token");
    //   window.location.reload();
    //   return Promise.reject(error);
    // }
    return Promise.reject(error);
  }
);

export default axiosAuthentication;
