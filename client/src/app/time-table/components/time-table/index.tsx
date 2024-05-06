"use client";

import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import theme from "@/lib/theme";
import { ITimeTableDTO } from "@/lib/types/backend-schedule";
import { IReactSchedulerData } from "@/lib/types/component";
import { convertTime24to12 } from "@/lib/utils";
import { Box, Stack, SxProps, Theme, useMediaQuery } from "@mui/material";
import { useEffect, useState } from "react";

import { Scheduler } from "@aldabil/react-scheduler";

const currentDate = "2018-11-01";
const schedulerData = [
  {
    startDate: "2018-11-01T09:45",
    endDate: "2018-11-01T11:00",
    title: "Meeting",
  },
  {
    startDate: "2018-11-01T12:00",
    endDate: "2018-11-01T13:30",
    title: "Go to a gym",
  },
];

const TimeTableMain = () => {
  // Redux
  const dispatch = useAppDispatch();
  const { timeTables, getTimeTableLoading, getTimeTableError } = useAppSelector(
    (state) => state.enroll
  );
  const { userProfile } = useAppSelector((state) => state.auth);

  const isTablet = useMediaQuery(theme.breakpoints.up("tablet"));

  const [events, setEvents] = useState<IReactSchedulerData[]>([]);

  useEffect(() => {
    if (timeTables.length > 0) {
      const updatedEvents = timeTables.map(
        (time: ITimeTableDTO, index: number) => ({
          event_id: index,
          title: `[${time.subjectCode}] ${time.subjectName}`,
          start: new Date(`${time.startDate.toString().replace("-", "/")} ${time.startTime}`),
          end: new Date(`${time.startDate} ${time.endTime}`),
        })
      );
      setEvents(updatedEvents);
    }
  }, [timeTables, getTimeTableError]);

  console.log(events);

  return (
    <Stack
      sx={{
        ...containerStyles,
        justifyContent: `${isTablet ? "center" : "flex-start"}`,
      }}
    >
      <Scheduler
        view="week"
        dialogMaxWidth="oversize"
        events={
          events
          //   [
          //   {
          //     event_id: 1,
          //     title: "Event 1",
          //     start: new Date("2024/5/2 09:30"),
          //     end: new Date("2024/5/2 10:30"),
          //   },
          //   {
          //     event_id: 2,
          //     title: "Event 2",
          //     start: new Date("2024/5/4 10:00"),
          //     end: new Date("2024/5/4 11:00"),
          //   },
          // ]
        }
      />
    </Stack>
  );
};

export default TimeTableMain;

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
