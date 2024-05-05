import axios from "axios";
// @ts-ignore
import Cookies from "js-cookie";
import authApi from "../features/auth/authApi";

const axiosScheduleService = axios.create({
  baseURL: process.env.NEXT_PUBLIC_API_HOST_SCHEDULE_SERVICE,
  headers: {
    "Content-Type": "application/json",
  },
});

axiosScheduleService.interceptors.request.use(
  (config) => {
    config.headers.Authorization = `Bearer ${Cookies.get("token") || ""}`;
    return config;
  },
  (error) => Promise.reject(error)
);

axiosScheduleService.interceptors.response.use(
  (response) => response,
  async (error) => {
    const originalRequest = error.config;
    // Case: token is expired | Use refresh token to get new token & refresh token
    if (error.response?.status === 401 && !originalRequest._retry) {
      originalRequest._retry = true;
      try {
        const oldRefreshToken = Cookies.get("refreshToken");
        const res = await authApi.refreshToken(oldRefreshToken);
        const accessToken = res.data.access_token;
        const newRefreshToken = res.data.refresh_token;

        Cookies.set("token", accessToken);
        Cookies.set("refreshToken", newRefreshToken);
        originalRequest.headers["Authorization"] = `Bearer ${accessToken}`;
        return axiosScheduleService(originalRequest);
      } catch (error) {
        Cookies.remove("token");
        Cookies.remove("refreshToken");
        localStorage.removeItem("userProfile");
        window.location.reload();
        return Promise.reject(error);
      }
    } else return Promise.reject(error);
  }
);

export default axiosScheduleService;
