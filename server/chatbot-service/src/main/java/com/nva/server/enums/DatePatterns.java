package com.nva.server.enums;

import lombok.Getter;

@Getter
public enum DatePatterns {
    HH_mm_SS_dd_MM_yyyy("HH:mm:ss dd/MM/yyyy");

    private final String pattern;

    DatePatterns(String pattern) {
        this.pattern = pattern;
    }
}
