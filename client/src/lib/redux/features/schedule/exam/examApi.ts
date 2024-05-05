import axiosScheduleService from "@/lib/redux/apis/axiosScheduleService";
import { DNA, IExamScheduleRequest } from "@/lib/types/backend-schedule";

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
};

export default examApi;