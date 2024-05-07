import axiosScheduleService from "@/lib/redux/apis/axiosScheduleService";
import { DNA, IExamScheduleRequest } from "@/lib/types/backend-schedule";
import { TimetableRequestParams } from "@/lib/types/redux-scheudule";

const examApi = {
    generateExamSchedule: (requeseObj: IExamScheduleRequest) => {
        return axiosScheduleService.post("/exam-schedule/ga", {
            ...requeseObj, 
        })
    }, 

    saveExamSchedules: (dna: DNA) => {
        return axiosScheduleService.post("/exam-schedule/schedule", {
            ...dna,
        })
    }, 

    getStudentExamTimeTable: (params?: TimetableRequestParams) => {
        let queryString = "";

        if (params) {
            const queryParts = [];
            if (params.studentId)
                queryParts.push(`studentId=${encodeURIComponent(params.studentId)}`);

            if (params.yearCode)
                queryParts.push(`yearCode=${encodeURIComponent(params.yearCode)}`);

            queryString = queryParts.length > 0 ? `?${queryParts.join("&")}` : "";
        }

        return axiosScheduleService.get(`/exam-schedule/timetable${queryString}`);
    }, 

    getYearCodeExamTimeTable: (yearCode: number) => {
        return axiosScheduleService.get(`/exam-schedule/timetable/${yearCode}`);
    },
};

export default examApi;