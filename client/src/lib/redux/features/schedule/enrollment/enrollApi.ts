import axiosScheduleService from "@/lib/redux/apis/axiosScheduleService";
import { IUploadFormData } from "@/lib/types/backend-schedule";
import { TimetableRequestParams } from "@/lib/types/redux-scheudule";

const enrollApi = {
    getTimeTable: (params?: TimetableRequestParams) => {
        let queryString = "";

        if (params) {
            const queryParts = [];
            if (params.studentId)
                queryParts.push(`studentId=${encodeURIComponent(params.studentId)}`);

            if (params.yearCode)
                queryParts.push(`yearCode=${encodeURIComponent(params.yearCode)}`);

            queryString = queryParts.length > 0 ? `?${queryParts.join("&")}` : "";
        }

        return axiosScheduleService.get(`/enroll/timetable${queryString}`);
    }, 

    uploadEnrollments: (requestObj: IUploadFormData) => {
        return axiosScheduleService.post("/enroll/upload", {
            ...requestObj,
        });
    }, 
};

export default enrollApi;