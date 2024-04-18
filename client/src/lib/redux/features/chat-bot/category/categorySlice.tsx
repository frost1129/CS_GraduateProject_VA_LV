import { createSlice } from "@reduxjs/toolkit";

import { CategoryState } from "@/lib/types/redux";

const initialState: CategoryState = {
  categories: [],
};

const categorySlice = createSlice({
  name: "category",
  initialState,
  reducers: {
    initData: (state, action) => {
      state.categories = action.payload.categories;
    },
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
    // builder.addCase(getAllContentThunk.pending, (state) => {
    //   state.contents = [];
    // });
    // builder.addCase(getAllContentThunk.fulfilled, (state, action) => {
    //   state.contents = action.payload;
    // });
    // builder.addCase(getAllContentThunk.rejected, (state, action) => {
    //   state.contents = [];
    // });
  },
});
export const { initData, appendFirst, appendLast, removeById, clearData } =
  categorySlice.actions;
export default categorySlice.reducer;
