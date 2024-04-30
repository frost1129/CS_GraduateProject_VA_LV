package com.graduation.scheduleservice.models;

public enum FitnessPenalty {
    FIRST_CLASS(10),
    SECOND_CLASS(5),
    THIRD_CLASS(1);

    private final int penaltyValue;

    FitnessPenalty(int penaltyValue) {
        this.penaltyValue = penaltyValue;
    }

    public int getPenaltyValue() {
        return penaltyValue;
    }
}
