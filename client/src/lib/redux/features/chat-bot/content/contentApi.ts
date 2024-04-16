import clientAxiosChatbotService from "@/lib/redux/apis/clientAxiosChatbotService";
// import serverAxiosChatbotService from "@/lib/redux/apis/serverAxiosChatbotService";

const contentApi = {
  // getAllContents: () => serverAxiosChatbotService.get("/contents"),
  getAllContentsV2: () => clientAxiosChatbotService.post("/contents"),
};

export default contentApi;
