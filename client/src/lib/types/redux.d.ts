import { ICategoryResponse, ITopicResponse, UserKeycloakResponse } from "./backend";

export interface AuthState {
  signInLoading: boolean;
  signInSuccess: boolean;
  signInError: any;

  getProfileLoading: boolean;
  userProfile: UserKeycloakResponse | null;
  getProfileError: any;
}

export interface CategoryState {
  listCategoryLoading: boolean;
  categories: ICategoryResponse[];
  listCategoryError: any;

  saveCategoryLoading: boolean;
  savedCategory: ICategoryResponse | null;
  saveCategoryError: any;

  updateCategoryLoading: boolean;
  updatedCategory: ICategoryResponse | null;
  updateCategoryError: any;

  deleteCategoryLoading: boolean;
  deleteCategorySuccess: any;
  deleteCategoryError: any;
}

export interface TopicState {
  listTopicLoading: boolean;
  topics: ITopicResponse[];
  listTopicError: any;

  saveTopicLoading: boolean;
  savedTopic: ITopicResponse | null;
  saveTopicError: any;

  updateTopicLoading: boolean;
  updatedTopic: ITopicResponse | null;
  updateTopicError: any;

  deleteTopicLoading: boolean;
  deleteTopicSuccess: any;
  deleteTopicError: any;
}

export interface ResetCategoryStatusPayload {
  keys: Array<keyof CategoryState>;
}

export interface ResetTopicStatusPayload {
  keys: Array<keyof TopicState>;
}
