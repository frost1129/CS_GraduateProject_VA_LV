import axiosScheduleService from "@/lib/redux/apis/axiosScheduleService";

const masterApi = {
  getSchoolYears: () => 
    axiosScheduleService.get("/master/school-year"),

  getTimeSlots: () => 
    axiosScheduleService.get("/master/time-slot"),

  getYearCodesByYear: (year: number) =>
    axiosScheduleService.get(`/master/by-year/${year}`),
};

export default masterApi;