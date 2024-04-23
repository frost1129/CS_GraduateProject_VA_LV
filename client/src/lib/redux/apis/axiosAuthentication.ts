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
  (error) => Promise.reject(error)
);

export default axiosAuthentication;
