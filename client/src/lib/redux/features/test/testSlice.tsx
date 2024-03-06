import { createSlice } from "@reduxjs/toolkit";

const initialState = {
    count: 0,
}

const testSlice = createSlice({
    name: "testSlice",
    initialState,
    reducers: {
        increase: (state) => {
            state.count = state.count + 1;
        }
    }
})

export const { increase } = testSlice.actions;
export default testSlice.reducer;