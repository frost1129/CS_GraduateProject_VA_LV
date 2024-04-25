import axiosChatbotService from "@/lib/redux/apis/axiosChatbotService";
import { ITopicRequest } from "@/lib/types/backend";

const topicApi = {
  getTopics: (params?: any) => {
    let requestParams = "";
    requestParams += `${params.keyword ? `?kw=${params.keyword}` : ""}`
    requestParams += `${params.categoryId ? `?categoryId=${params.categoryId}` : ""}`

    return axiosChatbotService.get(`/topics${requestParams}`);
  },

  addNewTopic: (category: ITopicRequest) =>
    axiosChatbotService.post("/topics", {
      ...category,
    }),

  updateTopic: (topicId: string, topic: ITopicRequest) =>
    axiosChatbotService.patch(`/topics/${topicId}`, {
      ...topic,
    }),

  deleteTopic: (topicId: string) =>
    axiosChatbotService.delete(`/topics/${topicId}`),
};

export default topicApi;
