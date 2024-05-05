"use client";

import theme from "@/lib/theme";
import { Typography, useMediaQuery } from "@mui/material";
import { Stack } from "@mui/system";
import PostFilter from "../post-filter";
import PostCreator from "../post-creator";

const PostHeader = () => {
    const isTablet = useMediaQuery(theme.breakpoints.up("tablet"));

    return (
        <Stack
            direction={isTablet ? "row" : "column"}
            justifyContent="space-between"
            sx={{ marginBottom: 2 }}
            gap={1}
        >
            <Typography variant="h4" marginBottom={isTablet ? 0 : 1}>
                Quản lý bài đăng
            </Typography>
            <Stack
                direction={isTablet ? "row" : "column-reverse"}
                alignItems="center"
                gap={2}
            >
                <PostFilter />
                <PostCreator />
            </Stack>
        </Stack>
    );
};

export default PostHeader;
