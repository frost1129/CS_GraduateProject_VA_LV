import {
  ICategoryResponse,
  IContentResponse,
  IContentResponseV2,
  IConversationResponse,
  IConversationResponseV2,
  ISchoolYearResponse,
  ISchoolYearResponseV2,
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

export interface SchoolYearState {
  listSchoolYearLoading: boolean;
  schoolYearDataResponse: ISchoolYearResponseV2 | null;
  listSchoolYearError: any;

  saveSchoolYearLoading: boolean;
  savedSchoolYear: ISchoolYearResponse | null;
  saveSchoolYearError: any;

  updateSchoolYearLoading: boolean;
  updatedSchoolYear: ISchoolYearResponse | null;
  updateSchoolYearError: any;

  deleteSchoolYearLoading: boolean;
  deleteSchoolYearSuccess: any;
  deleteSchoolYearError: any;
}

export interface ContentState {
  // Content V1
  listContentLoading: boolean;
  contents: IContentResponse[];
  listContentError: any;

  // Content V2
  listContentLoadingV2: boolean;
  contentDataResponse: IContentResponseV2 | null;
  listContentErrorV2: any;

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

export interface ConversationHistoryState {
  // Conversation History by ADMIN
  listConversationLoading: boolean;
  conversationDataResponse: IConversationResponseV2 | null;
  listConversationError: any;

  // Conversation History by logged user
  listSelfConversationLoading: boolean;
  selfConversationDataResponse: IConversationResponseV2 | null;
  listSelfConversationError: any;

  saveConversationLoading: boolean;
  savedConversation: IConversationResponse | null;
  saveConversationError: any;

  deleteConversationHistoryLoading: boolean;
  deleteConversationHistorySuccess: any;
  deleteConversationHistoryError: any;
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

export interface ResetConversationHistoryStatusPayload {
  keys: Array<keyof ConversationHistoryState>;
}

export interface ResetSchoolYearStatusPayload {
  keys: Array<keyof SchoolYearState>;
}

export interface TopicRequestParams {
  keyword?: string;
  categoryId?: string;
}

export interface ContentRequestParams {
  keyword?: string;
  topicId?: string;
  sYear?: string;
  page?: number;
}

export interface SchoolYearRequestParams {
  keyword?: string;
}

export interface ConversationHistoryRequestParams {
  username?: string;
  page?: number;
}
