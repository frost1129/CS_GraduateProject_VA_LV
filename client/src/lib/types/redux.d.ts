import {
  ICategoryResponse,
  IContentResponse,
  ITopicResponse,
  UserKeycloakResponse,
} from "./backend";

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

export interface ContentState {
  listContentLoading: boolean;
  contents: IContentResponse[];
  listContentError: any;

  saveContentLoading: boolean;
  savedContent: IContentResponse | null;
  saveContentError: any;

  updateContentLoading: boolean;
  updatedContent: IContentResponse | null;
  updateContentError: any;

  deleteContentLoading: boolean;
  deleteContentSuccess: any;
  deleteContentError: any;
}

export interface ResetCategoryStatusPayload {
  keys: Array<keyof CategoryState>;
}

export interface ResetTopicStatusPayload {
  keys: Array<keyof TopicState>;
}

export interface ResetContentStatusPayload {
  keys: Array<keyof ContentState>;
}

export interface TopicRequestParams {
  keyword?: string;
  categoryId?: string;
}

export interface ContentRequestParams {
  keyword?: string;
  topicId?: string;
  sYear?: string;
}
