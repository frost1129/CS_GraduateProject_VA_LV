import { Stack } from "@mui/material";

import ExamTimeTableHeader from "./components/header";
import ExamTimeTableMain from "./components/exam-table";

const ExamTimeTablePage = () => {
  return (
    <Stack direction='column' gap={2} marginTop={5}>
      <ExamTimeTableHeader />
      <ExamTimeTableMain />
    </Stack>
  );
};

export default ExamTimeTablePage;
