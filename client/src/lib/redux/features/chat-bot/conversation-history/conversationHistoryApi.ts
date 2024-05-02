import axiosChatbotService from "@/lib/redux/apis/axiosChatbotService";
import { IConversationHistoryRequest } from "@/lib/types/backend";
import { ConversationHistoryRequestParams } from "@/lib/types/redux";

const conversationHistoryApi = {
  getConversationHistories: (params?: ConversationHistoryRequestParams) => {
    let queryString = "";

    const queryParts = [];
    if (params && params.username)
      queryParts.push(`username=${encodeURIComponent(params.username)}`);
    if (params && params.page)
      queryParts.push(`page=${encodeURIComponent(params.page)}`);
    else queryParts.push(`page=${encodeURIComponent(1)}`);
    
    queryString = queryParts.length > 0 ? `?${queryParts.join("&")}` : "";

    return axiosChatbotService.get(`/conversation-histories${queryString}`);
  },

  getSelfConversationHistories: (params?: ConversationHistoryRequestParams) => {
    let queryString = "";

    const queryParts = [];
    if (params && params.page)
      queryParts.push(`page=${encodeURIComponent(params.page)}`);

    queryString = queryParts.length > 0 ? `?${queryParts.join("&")}` : "";

    return axiosChatbotService.get(`/conversation-histories${queryString}`);
  },

  addNewConversationHistory: (conversation: IConversationHistoryRequest) =>
    axiosChatbotService.post("/conversation-histories", {
      ...conversation,
    }),

  deleteConversationHistory: (conversationId: string) =>
    axiosChatbotService.delete(`/conversation-histories/${conversationId}`),
};

export default conversationHistoryApi;
