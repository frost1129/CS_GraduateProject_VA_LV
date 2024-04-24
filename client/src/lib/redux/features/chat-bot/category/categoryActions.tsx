import { createAsyncThunk } from "@reduxjs/toolkit";

import { ICategoryRequest } from "@/lib/types/backend";
import categoryApi from "./categoryApi";

export const getCategoriesThunk = createAsyncThunk(
  "getCategories",
  async (params: any, { rejectWithValue }) => {
    try {
      return await categoryApi.getCategories(params);
    } catch (error: any) {
      if (error.response && error.response.data && error.response.data.message)
        return rejectWithValue(error.response.data.message);
      return rejectWithValue(error.message);
    }
  }
);

export const addNewCategoryThunk = createAsyncThunk(
  "addNewCategory",
  async (category: ICategoryRequest, { rejectWithValue }) => {
    try {
      return await categoryApi.addNewCategory(category);
    } catch (error: any) {
      if (error.response && error.response.data && error.response.data.message)
        return rejectWithValue(error.response.data.message);
      return rejectWithValue(error.message);
    }
  }
);

export const updateCategoryThunk = createAsyncThunk(
  "updateCategory",
  async (
    {
      categoryId,
      category,
    }: { categoryId: string; category: ICategoryRequest },
    { rejectWithValue }
  ) => {
    try {
      return await categoryApi.updateCategory(categoryId, category);
    } catch (error: any) {
      if (error.response && error.response.data && error.response.data.message)
        return rejectWithValue(error.response.data.message);
      return rejectWithValue(error.message);
    }
  }
);

export const deleteCategoryThunk = createAsyncThunk(
  "deleteCategory",
  async (categoryId: string, { rejectWithValue }) => {
    try {
      return await categoryApi.deleteCategory(categoryId);
    } catch (error: any) {
      if (error.response && error.response.data && error.response.data.message)
        return rejectWithValue(error.response.data.message);
      return rejectWithValue(error.message);
    }
  }
);
