import { createSlice } from "@reduxjs/toolkit";

import { CategoryState } from "@/lib/types/redux";
import { addNewCategoryThunk, getCategoriesThunk } from "./categoryActions";

const initialState: CategoryState = {
  listCategoryLoading: false,
  categories: [],
  listCategoryError: null,

  saveCategoryLoading: false,
  savedCategory: null,
  saveCategoryError: null,
};

const categorySlice = createSlice({
  name: "category",
  initialState,
  reducers: {
    appendFirst: (state, action) => {
      state.categories = [action.payload.category, ...state.categories];
    },
    appendLast: (state, action) => {
      state.categories = [...state.categories, action.payload.category];
    },
    removeById: (state, action) => {
      const updatedCategories = state.categories.filter(
        (c) => c.id !== action.payload.categoryId
      );
      state.categories = updatedCategories;
    },
    clearData: (state) => {
      state.categories = [];
    },
  },
  extraReducers: (builder) => {
    // Get categories
    builder.addCase(getCategoriesThunk.pending, (state) => {
      state.listCategoryLoading = true;
      state.categories = [];
      state.listCategoryError = null;
    });
    builder.addCase(getCategoriesThunk.fulfilled, (state, action) => {
      state.listCategoryLoading = false;
      state.categories = action.payload;
      state.listCategoryError = null;
    });
    builder.addCase(getCategoriesThunk.rejected, (state, action) => {
      state.listCategoryLoading = false;
      state.categories = [];
      state.listCategoryError =
        action.payload !== undefined ? action.payload : null;
    });

    // Add new category
    builder.addCase(addNewCategoryThunk.pending, (state) => {
      state.saveCategoryLoading = true;
      state.savedCategory = null;
      state.saveCategoryError = null;
    });
    builder.addCase(addNewCategoryThunk.fulfilled, (state, action) => {
      state.saveCategoryLoading = false;
      state.savedCategory = action.payload;
      state.saveCategoryError = null;
    });
    builder.addCase(addNewCategoryThunk.rejected, (state, action) => {
      state.saveCategoryLoading = false;
      state.savedCategory = null;
      state.saveCategoryError =
        action.payload !== undefined ? action.payload : null;
    });
  },
});
export const { appendFirst, appendLast, removeById, clearData } =
  categorySlice.actions;
export default categorySlice.reducer;
