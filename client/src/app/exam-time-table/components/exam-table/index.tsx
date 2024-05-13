"use client";

import { useEffect, useRef, useState } from "react";

import { Scheduler } from "@aldabil/react-scheduler";

import { Stack, SxProps, Theme, useMediaQuery } from "@mui/material";
import { useAppSelector } from "@/lib/redux/store";
import theme from "@/lib/theme";
import { ITimeTableDTO } from "@/lib/types/backend-schedule";
import { IReactSchedulerData } from "@/lib/types/component";
import { SchedulerRef } from "@aldabil/react-scheduler/types";

const ExamTimeTableMain = () => {

  const { studentExams, getStudentExamsLoading, getStudentExamsError } = useAppSelector(
    (state) => state.exam
  );

  const calendarRef = useRef<SchedulerRef>(null);

  const isTablet = useMediaQuery(theme.breakpoints.up("tablet"));
  const [events, setEvents] = useState<IReactSchedulerData[]>([]);

  useEffect(() => {
    if (studentExams.length > 0) {
      const updatedEvents = studentExams.map((time, index) => ({
        event_id: index,
        title: `[${time.subjectCode}] ${time.subjectName}`,
        start: new Date(formatDateTime(`${time.startDate} ${time.startTime}`)),
        end: new Date(formatDateTime(`${time.startDate} ${time.endTime}`)),
      }));

      console.log(updatedEvents);
      
      setEvents(updatedEvents);
      calendarRef.current?.scheduler.handleGotoDay(updatedEvents[0].start);
    } else {
      setEvents([]);
      calendarRef.current?.scheduler.handleGotoDay(new Date());
    }

    if (getStudentExamsError !== null) {
      calendarRef.current?.scheduler.handleGotoDay(new Date());
    }

  }, [studentExams, getStudentExamsError]);

  return (
    <Stack
      sx={{
        ...containerStyles,
        justifyContent: `${isTablet ? "center" : "flex-start"}`,
      }}
    >
      <Scheduler
        ref={calendarRef}
        view="week"
        loading={getStudentExamsLoading}
        week={{
          weekDays: [0, 1, 2, 3, 4, 5, 6],
          weekStartOn: 1,
          startHour: 6,
          endHour: 24,
          step: 60,
          navigation: true,
          disableGoToDay: false,
        }}
        day={{
          startHour: 6,
          endHour: 24,
          step: 60,
          navigation: true,
          
        }}
        dialogMaxWidth="oversize"
        events={events}
        agenda={false}
        stickyNavigation={true}
        editable={false}
      />
    </Stack>
  );
};

export default ExamTimeTableMain;

const containerStyles: SxProps<Theme> = {
  paddingTop: 2,
  flexDirection: "row",
  height: "calc(100vh - (var(--height-header) * 2.7))",
  overflow: "scroll",
  border: "1px solid var(--border-color)",
  borderRadius: 1,
  "[data-testid='rs-wrapper']": {
    width: "100%",
  },
};

function formatDateTime(input: string): string {
  const date = new Date(input);
  const year = date.getFullYear();
  const month = (date.getMonth() + 1).toString().padStart(2, "0");
  const day = date.getDate().toString().padStart(2, "0");
  const hour = date.getHours().toString().padStart(2, "0");
  const minute = date.getMinutes().toString().padStart(2, "0");
  return `${year}/${month}/${day} ${hour}:${minute}`;
}

function addDays(inputDate: string, days: number): string {
  const date = new Date(inputDate);
  date.setDate(date.getDate() + days);
  const year = date.getFullYear();
  const month = (date.getMonth() + 1).toString().padStart(2, "0");
  const day = date.getDate().toString().padStart(2, "0");
  return `${year}-${month}-${day}`;
}
