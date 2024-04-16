import axios from "axios";
import { cookies } from "next/headers";

const serverAxiosChatbotService = axios.create({
  baseURL: process.env.NEXT_PUBLIC_API_HOST_CHAT_BOT_SERVICE,
  headers: {
    "Content-Type": "application/json",
  },
});

serverAxiosChatbotService.interceptors.request.use(
  (config) => {
    config.headers.Authorization = `Bearer ${cookies().get("token")?.value || ""}`;
    return config;
  },
  (error) => Promise.reject(error)
);

serverAxiosChatbotService.interceptors.response.use(
  (response) => response,
  async (error) => {
    // const originalRequest = error.config;

    // // Case: token is expired | Use refresh token to get new token & refresh token
    // if (error.response?.status === 401 && !originalRequest._retry) {
    //   originalRequest._retry = true;
    //   const refreshToken = Cookies.get("refreshToken");
    //   if (refreshToken) {
    //     const res = await authApi.refreshToken(refreshToken);
    //     Cookies.set("token", res.data.access_token);
    //     Cookies.set("refreshToken", res.data.refresh_token);

    //     originalRequest.headers["Authorization"] = `Bearer ${res.data.access_token}`;
    //     return axiosChatbotService(originalRequest);
    //   }
    // } else if (error.response?.status === 400) {
    //   // Case: both token and refresh token are expired
    //   Cookies.remove("refreshToken");
    //   Cookies.remove("token");
    //   window.location.reload();
    //   return Promise.reject(error);
    // }
    return Promise.reject(error);
  }
);

export default serverAxiosChatbotService;
