import { ICategoryResponse, UserKeycloakResponse } from "./backend";

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
}
