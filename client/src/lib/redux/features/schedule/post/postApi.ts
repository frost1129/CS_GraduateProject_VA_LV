import axiosScheduleService from "@/lib/redux/apis/axiosScheduleService";
import { SearchRequestParams } from "@/lib/types/redux-scheudule";

const postApi = {
    getPosts: (params?: SearchRequestParams) => {
        let queryString = "";

        if (params) {
            const queryParts = [];
            if (params.kw)
                queryParts.push(`kw=${encodeURIComponent(params.kw)}`);

            if (params.page)
                queryParts.push(`page=${encodeURIComponent(params.page)}`);

            queryString = queryParts.length > 0 ? `?${queryParts.join("&")}` : "";
        }

        return axiosScheduleService.get(`/post${queryString}`);
    },

    getPostById: (postId: string) => {
        return axiosScheduleService.get(`/post/${postId}`);
    },
};

export default postApi;