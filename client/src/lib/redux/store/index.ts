import {
  TypedUseSelectorHook,
  useDispatch,
  useSelector,
  useStore,
} from "react-redux";
import { configureStore } from "@reduxjs/toolkit";

import authReducer from "../features/auth/authSlice";
import contentReducer from "../features/chat-bot/content/contentSlice";
import categoryReducer from "../features/chat-bot/category/categorySlice";

export const makeStore = () => {
  return configureStore({
    reducer: {
      auth: authReducer,
      content: contentReducer,
      category: categoryReducer,
    },
    middleware: (getDefaultMiddleware) =>
      getDefaultMiddleware({
        serializableCheck: false,
      }),
  });
};

export type AppStore = ReturnType<typeof makeStore>;
export type RootState = ReturnType<AppStore["getState"]>;
export type AppDispatch = AppStore["dispatch"];

export const useAppDispatch: () => AppDispatch = useDispatch;
export const useAppSelector: TypedUseSelectorHook<RootState> = useSelector;
export const useAppStore: () => AppStore = useStore;
