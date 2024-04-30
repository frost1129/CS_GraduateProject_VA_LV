import axiosChatbotService from "@/lib/redux/apis/axiosChatbotService";
import { ISchoolYearRequest } from "@/lib/types/backend";
import { SchoolYearRequestParams } from "@/lib/types/redux";

const schoolYearApi = {
  getSchoolYears: (params?: SchoolYearRequestParams) => {
    let queryString = "";

    if (params) {
      const queryParts = [];
      if (params.keyword)
        queryParts.push(`kw=${encodeURIComponent(params.keyword)}`);

      queryString = queryParts.length > 0 ? `?${queryParts.join("&")}` : "";
    }

    return axiosChatbotService.get(`/schoolYears${queryString}`);
  },

  addNewSchoolYear: (schoolYear: ISchoolYearRequest) =>
    axiosChatbotService.post("/schoolYears", {
      ...schoolYear,
    }),

  updateSchoolYear: (schoolYearId: string, schoolYear: ISchoolYearRequest) =>
    axiosChatbotService.patch(`/schoolYears/${schoolYearId}`, {
      ...schoolYear,
    }),

  deleteSchoolYear: (schoolYearId: string) =>
    axiosChatbotService.delete(`/schoolYears/${schoolYearId}`),
};

export default schoolYearApi;
