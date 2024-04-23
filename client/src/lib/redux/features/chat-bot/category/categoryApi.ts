import axiosChatbotService from "@/lib/redux/apis/axiosChatbotService";
import { ICategoryRequest } from "@/lib/types/backend";

const categoryApi = {
  getCategories: (params?: any) => {
    let requestParams = `${params.keyword ? `?kw=${params.keyword}` : ""}`;
    return axiosChatbotService.get(`/categories${requestParams}`);
  },
  addNewCategory: (category: ICategoryRequest) =>
    axiosChatbotService.post("/categories", {
      intentCode: category.intentCode,
      description: category.description,
      note: category.note
    }),
};

export default categoryApi;
