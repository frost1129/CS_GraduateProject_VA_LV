package com.nva.server.utils;

import com.nva.server.enums.DatePatterns;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CommonUtils {
    public static String convertMillisecondsToDateTime(long milliseconds, DatePatterns pattern) {
        SimpleDateFormat sdf = new SimpleDateFormat(pattern.getPattern());

        Date resultDate = new Date(milliseconds);
        return sdf.format(resultDate);
    }
}
