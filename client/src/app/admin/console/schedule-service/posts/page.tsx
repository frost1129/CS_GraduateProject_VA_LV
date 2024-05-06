import { Stack, SxProps, Theme } from "@mui/material"
import PostHeader from "./components/post-header";
import PostRenderTable from "./components/post-render-table";

const PostPage = () => {
    return (
        <Stack direction="column" sx={pageContainerStyles}>
            <PostHeader />
            <PostRenderTable />
        </Stack>
    );
};

export default PostPage;

const pageContainerStyles: SxProps<Theme> = {
    paddingTop: 2,
    paddingBottom: 3,
    height: "calc(100vh - var(--height-header))",
  };