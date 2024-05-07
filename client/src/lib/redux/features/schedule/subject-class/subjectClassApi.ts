import axiosScheduleService from "@/lib/redux/apis/axiosScheduleService";
import { IUploadFormData } from "@/lib/types/backend-schedule";
import { SubjectClassRequestParams } from "@/lib/types/redux-scheudule";

const subjectClassApi = {
    getSubjectClasses: (params: SubjectClassRequestParams) => {
        let queryString = "";

        if (params) {
        const queryParts = [];
        if (params.kw)
            queryParts.push(`kw=${encodeURIComponent(params.kw)}`);

        if (params.page)
            queryParts.push(`page=${encodeURIComponent(params.page)}`);

        if (params.yearCode)
            queryParts.push(`yearCode=${encodeURIComponent(params.yearCode)}`);

        queryString = queryParts.length > 0 ? `?${queryParts.join("&")}` : "";
        }

        return axiosScheduleService.get(`/subject-class${queryString}`);
    }, 

    uploadSubjectClasses: (requestObj: IUploadFormData) => {
        return axiosScheduleService.post("/subject-class/upload", {
            ...requestObj,
        });
    }, 

    getAssignedYearCode: () => {
        return axiosScheduleService.get("/subject-class/assigned");
    },
};

export default subjectClassApi;