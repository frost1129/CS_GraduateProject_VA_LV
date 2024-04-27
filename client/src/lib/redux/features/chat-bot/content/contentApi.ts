import axiosChatbotService from "@/lib/redux/apis/axiosChatbotService";
import {
  ISaveContentRequest,
  IUpdateContentRequest,
} from "@/lib/types/backend";
import { ContentRequestParams } from "@/lib/types/redux";

const contentApi = {
  getContents: (params?: ContentRequestParams) => {
    let queryString = "";

    if (params) {
      const queryParts = [];
      if (params.keyword)
        queryParts.push(`kw=${encodeURIComponent(params.keyword)}`);

      if (params.topicId)
        queryParts.push(`topicId=${encodeURIComponent(params.topicId)}`);

      if (params.sYear)
        queryParts.push(`sYear=${encodeURIComponent(params.sYear)}`);

      queryString = queryParts.length > 0 ? `?${queryParts.join("&")}` : "";
    }

    return axiosChatbotService.get(`/contents${queryString}`);
  },

  addNewContent: (content: ISaveContentRequest) =>
    axiosChatbotService.post("/contents", {
      ...content,
    }),

  updateContent: (contentId: string, content: IUpdateContentRequest) =>
    axiosChatbotService.patch(`/contents/${contentId}`, {
      ...content,
    }),

  deleteContent: (contentId: string) =>
    axiosChatbotService.delete(`/contents/${contentId}`),
};

export default contentApi;
