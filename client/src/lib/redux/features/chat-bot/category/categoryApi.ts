import axiosChatbotService from "@/lib/redux/apis/axiosChatbotService";
import { ICategoryRequest } from "@/lib/types/backend";

const categoryApi = {
  getCategories: (params?: any) => {
    let requestParams = `${params.keyword ? `?kw=${params.keyword}` : ""}`;
    return axiosChatbotService.get(`/categories${requestParams}`);
  },

  addNewCategory: (category: ICategoryRequest) =>
    axiosChatbotService.post("/categories", {
      ...category,
    }),

  updateCategory: (categoryId: string, category: ICategoryRequest) =>
    axiosChatbotService.patch(`/categories/${categoryId}`, {
      ...category,
    }),

  deleteCategory: (categoryId: string) =>
    axiosChatbotService.delete(`/categories/${categoryId}`),
};

export default categoryApi;
