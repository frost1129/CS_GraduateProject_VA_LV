import { Stack, SxProps, Theme } from "@mui/material"
import ExamHeader from "./components/exam-header";
import ExamRenderTable from "./components/exam-render-table";

const PostPage = () => {
    return (
        <Stack direction="column" sx={pageContainerStyles}>
            <ExamHeader />
            <ExamRenderTable />
        </Stack>
    )
};

export default PostPage;

const pageContainerStyles: SxProps<Theme> = {
    paddingTop: 2,
    paddingBottom: 3,
    height: "calc(100vh - var(--height-header))",
  };