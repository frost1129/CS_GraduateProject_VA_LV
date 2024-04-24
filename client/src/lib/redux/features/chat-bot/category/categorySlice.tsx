import { createSlice } from "@reduxjs/toolkit";

import { CategoryState } from "@/lib/types/redux";
import {
  addNewCategoryThunk,
  getCategoriesThunk,
  updateCategoryThunk,
} from "./categoryActions";

const initialState: CategoryState = {
  listCategoryLoading: false,
  categories: [],
  listCategoryError: null,

  saveCategoryLoading: false,
  savedCategory: null,
  saveCategoryError: null,

  updateCategoryLoading: false,
  updatedCategory: null,
  updateCategoryError: null,
};

const categorySlice = createSlice({
  name: "category",
  initialState,
  reducers: {
    appendCategoryFirst: (state, action) => {
      state.categories = [action.payload.category, ...state.categories];
    },
    appendCategoryLast: (state, action) => {
      state.categories = [...state.categories, action.payload.category];
    },
    removeCategoryById: (state, action) => {
      const updatedCategories = state.categories.filter(
        (c) => c.id !== action.payload.categoryId
      );
      state.categories = updatedCategories;
    },
    clearCategoryData: (state) => {
      state.categories = [];
    },
    updateCategoryById: (state, action) => {
      const updatedCategories = state.categories.map((c) => {
        if (c.id === action.payload.category.id)
          return { ...c, ...action.payload.category };
        return c;
      });
      state.categories = updatedCategories;
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
      state.categories = action.payload.data;
      state.listCategoryError = null;
    });
    builder.addCase(getCategoriesThunk.rejected, (state, action) => {
      state.listCategoryLoading = false;
      state.categories = [];
      state.listCategoryError = action.payload ? action.payload : null;
    });

    // Add new category
    builder.addCase(addNewCategoryThunk.pending, (state) => {
      state.saveCategoryLoading = true;
      state.savedCategory = null;
      state.saveCategoryError = null;
    });
    builder.addCase(addNewCategoryThunk.fulfilled, (state, action) => {
      state.saveCategoryLoading = false;
      state.savedCategory = action.payload.data;
      state.saveCategoryError = null;
    });
    builder.addCase(addNewCategoryThunk.rejected, (state, action) => {
      state.saveCategoryLoading = false;
      state.savedCategory = null;
      state.saveCategoryError = action.payload ? action.payload : null;
    });

    // Update category
    builder.addCase(updateCategoryThunk.pending, (state) => {
      state.updateCategoryLoading = true;
      state.updatedCategory = null;
      state.updateCategoryError = null;
    });
    builder.addCase(updateCategoryThunk.fulfilled, (state, action) => {
      state.updateCategoryLoading = false;
      state.updatedCategory = action.payload.data;
      state.updateCategoryError = null;
    });
    builder.addCase(updateCategoryThunk.rejected, (state, action) => {
      state.updateCategoryLoading = false;
      state.updatedCategory = null;
      state.updateCategoryError = action.payload ? action.payload : null;
    });
  },
});
export const {
  appendCategoryFirst,
  appendCategoryLast,
  removeCategoryById,
  clearCategoryData,
  updateCategoryById,
} = categorySlice.actions;
export default categorySlice.reducer;
