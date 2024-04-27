import axiosChatbotService from "@/lib/redux/apis/axiosChatbotService";
import { ITopicRequest } from "@/lib/types/backend";
import { TopicRequestParams } from "@/lib/types/redux";

const topicApi = {
  getTopics: (params?: TopicRequestParams) => {
    let queryString = "";

    if (params) {
      const queryParts = [];
      if (params.keyword)
        queryParts.push(`kw=${encodeURIComponent(params.keyword)}`);

      if (params.categoryId)
        queryParts.push(`categoryId=${encodeURIComponent(params.categoryId)}`);

      queryString = queryParts.length > 0 ? `?${queryParts.join("&")}` : "";
    }

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
