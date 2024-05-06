import { Stack } from "@mui/material";
import TimeTableHeader from "./components/header";
import TimeTableMain from "./components/time-table";

const TimeTablePage = () => {
  return (
    <Stack direction='column' gap={2} marginTop={5}>
      <TimeTableHeader />
      <TimeTableMain />
    </Stack>
  );
};

export default TimeTablePage;
