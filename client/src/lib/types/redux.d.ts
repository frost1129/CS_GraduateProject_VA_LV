import { User, ICategoryResponse } from "./backend";

export interface AuthState {
  signInLoading: boolean;
  signInSuccess: boolean;
  signInError: any;

  getProfileLoading: boolean;
  userProfile: User | null;
  getProfileError: any;
}

export interface CategoryState {
  listCategoryLoading: boolean;
  categories: ICategoryResponse[];
  listCategoryError: any;
}
