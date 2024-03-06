import {
  TypedUseSelectorHook,
  useDispatch,
  useSelector,
  useStore,
} from "react-redux";
import { configureStore } from "@reduxjs/toolkit";

import testReducer from "./features/test/testSlice";

export const makeStore = () => {
  return configureStore({
    reducer: {
      test: testReducer,
    },
  });
};

export type AppStore = ReturnType<typeof makeStore>;
export type RootState = ReturnType<AppStore["getState"]>;
export type AppDispatch = AppStore["dispatch"];

export const useAppDispatch: () => AppDispatch = useDispatch;
export const useAppSelector: TypedUseSelectorHook<RootState> = useSelector;
export const useAppStore: () => AppStore = useStore;
