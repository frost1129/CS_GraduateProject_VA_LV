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
        const formData = new FormData();
        formData.append('file', requestObj.file);
        formData.append('year', requestObj.year!.toString()); // If year is present

        return axiosScheduleService.post("/subject-class/upload", formData, {
            headers: {
                'Content-Type': 'multipart/form-data' // Important for file uploads
            }
        });
    }, 

    getAssignedYearCode: () => {
        return axiosScheduleService.get("/subject-class/assigned");
    },
};

export default subjectClassApi;