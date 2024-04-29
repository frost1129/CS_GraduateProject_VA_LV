package com.nva.server.services;

import com.nva.server.dtos.*;

import java.util.List;
import java.util.Map;

public interface SchoolYearService {
    SchoolYearResponseV3 getSchoolYears(Map<String, String> params);
    SchoolYearResponse addOrUpdateSchoolYear(SchoolYearRequest schoolYearRequest);
    void deleteSchoolYear(Long schoolYearId);
}
