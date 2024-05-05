import axiosScheduleService from "@/lib/redux/apis/axiosScheduleService";
import { ISubjectSaveDTO, IUploadFormData } from "@/lib/types/backend-schedule";
import { SearchRequestParams } from "@/lib/types/redux-scheudule";

const subjectApi = {
    getSubjects: (params?: SearchRequestParams) => {
        let queryString = "";

        if (params) {
            const queryParts = [];
            if (params.kw)
                queryParts.push(`kw=${encodeURIComponent(params.kw)}`);

            if (params.page)
                queryParts.push(`page=${encodeURIComponent(params.page)}`);

            queryString = queryParts.length > 0 ? `?${queryParts.join("&")}` : "";
        }

        return axiosScheduleService.get(`/subject${queryString}`);
    },

    addSubject: (subject: ISubjectSaveDTO) => {
        return axiosScheduleService.post("/subject", {
            ...subject,
        })
    }, 

    uploadSubjects: (requestObj: IUploadFormData) => {
        return axiosScheduleService.post("/subject/upload", {
            ...requestObj,
        })
    }, 
};

export default subjectApi;