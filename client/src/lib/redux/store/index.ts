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
import topicReducer from "../features/chat-bot/topic/topicSlice";
import schoolYearReducer from "../features/chat-bot/school-year/schoolYearSlice";
import conversationHistoryReducer from "../features/chat-bot/conversation-history/conversationHistorySlice";
import enrollReducer from "../features/schedule/enrollment/enrollSlice";
import masterReducer from "../features/schedule/master/masterSlide";
import postReducer from "../features/schedule/post/postSlice";
import subjectReducer from "../features/schedule/subject/subjectSlice";
import subjectClassReducer from "../features/schedule/subject-class/subjectClassSlice";
import examReducer from "../features/schedule/exam/examSlice";

export const makeStore = () => {
  return configureStore({
    reducer: {
      auth: authReducer,
      content: contentReducer,
      category: categoryReducer,
      topic: topicReducer,
      schoolYear: schoolYearReducer,
      conversationHistory: conversationHistoryReducer,
      enroll: enrollReducer,
      master: masterReducer,
      post: postReducer,
      subject: subjectReducer, 
      subjectClass: subjectClassReducer,
      exam: examReducer,
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
