import { Stack, SxProps, Theme } from "@mui/material";
import SubjectHeader from "./components/subject-header";
import SubjectRenderTable from "./components/subject-render-table";

const PostPage = () => {
    return (
        <Stack direction="column" sx={pageContainerStyles}>
            <SubjectHeader />
            <SubjectRenderTable />
        </Stack>
    );
};

export default PostPage;

const pageContainerStyles: SxProps<Theme> = {
    paddingTop: 2,
    paddingBottom: 3,
    height: "calc(100vh - var(--height-header))",
};
