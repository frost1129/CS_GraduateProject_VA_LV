import axiosChatbotService from "@/lib/redux/apis/axiosChatbotService";

const categoryApi = {
  getCategories: (params?: any) => {
    let requestParams = `${params.keyword ? `?kw=${params.keyword}` : ""}`;

    return axiosChatbotService.get(`/categories${requestParams}`);
  },
};

export default categoryApi;
