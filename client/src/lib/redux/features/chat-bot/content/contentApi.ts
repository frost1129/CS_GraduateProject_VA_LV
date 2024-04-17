import axiosChatbotService from "@/lib/redux/apis/axiosChatbotService";

const contentApi = {
  getAllContents: () => axiosChatbotService.get("/contents"),
};

export default contentApi;
