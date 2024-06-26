import axios from "axios";
import { cookies } from "next/headers";

import authApi from "../features/auth/authApi";

const axiosServer = axios.create({
  headers: {
    "Content-Type": "application/json",
  },
});

axiosServer.interceptors.request.use(
  (config) => {
    config.headers.Authorization = `Bearer ${
      cookies().get("token")?.value || ""
    }`;
    return config;
  },
  (error) => Promise.reject(error)
);

axiosServer.interceptors.response.use(
  (response) => response,
  async (error) => {
    const originalRequest = error.config;
    // Case: token is expired | Use refresh token to get new token & refresh token
    if (error.response?.status === 401 && !originalRequest._retry) {
      originalRequest._retry = true;
      const refreshToken = cookies().get("refreshToken")?.value;
      if (refreshToken) {
        const res = await authApi.refreshToken(refreshToken);
        if (res.status === 200) {
          const accessToken = res.data.access_token;
          const refreshToken = res.data.refresh_token;

          cookies().set("token", accessToken);
          cookies().set("refreshToken", refreshToken);

          axios.defaults.headers.common[
            "Authorization"
          ] = `Bearer ${accessToken}`;
          originalRequest.headers["Authorization"] = `Bearer ${accessToken}`;
          return axiosServer(originalRequest);
        } else if (res.status === 400) {
          cookies().delete("token");
          cookies().delete("refreshToken");
          window.location.reload();
          return Promise.reject(error);
        }
      } else return Promise.reject(error);
    }
  }
);

export default axiosServer;
