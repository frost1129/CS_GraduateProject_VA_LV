import axiosChatbotService from "@/lib/redux/apis/axiosChatbotService";
import { ITopicRequest } from "@/lib/types/backend";

const topicApi = {
  getTopics: (params?: any) => {
    const queryParts = [];

    if (params.keyword)
      queryParts.push(`kw=${encodeURIComponent(params.keyword)}`);

    if (params.categoryId)
      queryParts.push(`categoryId=${encodeURIComponent(params.categoryId)}`);

    const queryString = queryParts.length > 0 ? `?${queryParts.join("&")}` : "";

    return axiosChatbotService.get(`/topics${queryString}`);
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
