package com.graduation.scheduleservice.constants;

import java.time.LocalTime;

public class TimeSlotConstant {
    private static final LocalTime[] TIME_SLOTS = {
            LocalTime.of(7, 30),
            LocalTime.of(9, 0),
            LocalTime.of(13, 30),
            LocalTime.of(15, 0),
            LocalTime.of(18, 0),
    };

    public static LocalTime getLocalTimeFromSlot(int slotIndex) {
        if (slotIndex >= 0 && slotIndex < TIME_SLOTS.length) {
            return TIME_SLOTS[slotIndex];
        } else {
            return null;
        }
    }
}
