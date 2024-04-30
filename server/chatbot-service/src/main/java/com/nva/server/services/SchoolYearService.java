package com.nva.server.services;

import com.nva.server.dtos.SchoolYearRequest;
import com.nva.server.dtos.SchoolYearResponse;
import com.nva.server.dtos.SchoolYearResponseV3;

import java.util.Map;

public interface SchoolYearService {
    SchoolYearResponseV3 getSchoolYears(Map<String, String> params);
    SchoolYearResponse addOrUpdateSchoolYear(SchoolYearRequest schoolYearRequest);
    void deleteSchoolYear(Long schoolYearId);
}
