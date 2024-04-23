import axiosChatbotService from "@/lib/redux/apis/axiosChatbotService";

const categoryApi = {
    getCategories: () => axiosChatbotService.get("/categories")
};

export default categoryApi;
