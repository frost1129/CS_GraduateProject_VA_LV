import { Stack, SxProps, Theme } from "@mui/material"
import ClassHeader from "./components/class-header";
import ClassRenderTable from "./components/class-render-table";

const PostPage = () => {
    return (
        <Stack direction="column" sx={pageContainerStyles}>
            <ClassHeader />
            <ClassRenderTable />
        </Stack>
    )
};

export default PostPage;

const pageContainerStyles: SxProps<Theme> = {
    paddingTop: 2,
    paddingBottom: 3,
    height: "calc(100vh - var(--height-header))",
  };