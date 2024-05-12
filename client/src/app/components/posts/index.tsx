"use client";

import { useEffect } from "react";
import Link from "next/link";

import {
  Box,
  Button,
  CircularProgress,
  Grid,
  Paper,
  Stack,
  SxProps,
  Theme,
  Typography,
  useMediaQuery,
} from "@mui/material";
import { ArrowCircleRight, NotePencil } from "@phosphor-icons/react";

import ErrorRetrieveData from "@/lib/components/error-retrieve-data";
import NoData from "@/lib/components/no-data";
import { getPostsThunk } from "@/lib/redux/features/schedule/post/postActions";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import theme from "@/lib/theme";
import { convertMillisecondsToDate } from "@/lib/utils";

const Posts = () => {
  // Redux
  const dispatch = useAppDispatch();
  const { getPostLoading, listPost, getListPostError } = useAppSelector(
    (state) => state.post
  );

  // Responsive
  const isTablet = useMediaQuery(theme.breakpoints.up("tablet"));

  useEffect(() => {
    dispatch(getPostsThunk({}));
  }, []);

  if (getPostLoading)
    return (
      <Box sx={containerStyles}>
        <CircularProgress sx={{ color: "var(--primary)" }} />
      </Box>
    );
  else if (getListPostError)
    return (
      <Box sx={containerStyles}>
        <ErrorRetrieveData />
      </Box>
    );
  return (
    <>
      {listPost ? (
        <Grid container columnSpacing={3} rowSpacing={3} mt={1}>
          {/* Main content */}
          <Grid item oversize={6} desktop={6} tablet={6} mobile={12}>
            <Paper sx={postItemStyles__main}>
              {/* Image */}
              <img src={listPost.data[0].image} style={{ width: "100%" }} />

              {/* Created date */}
              <Stack direction="row" gap={1} alignItems="center">
                <NotePencil size={24} />
                <Typography variant="body2">
                  {
                    convertMillisecondsToDate(
                      listPost.data[0].createdDate
                    ).split(" ")[1]
                  }
                </Typography>
              </Stack>

              {/* Title & Content */}
              <Stack direction="column" gap={1}>
                <Typography
                  variant="body1"
                  sx={{ fontWeight: "800", ...truncateStyles }}
                >
                  {listPost.data[0].title}
                </Typography>
                <Typography variant="body1" sx={truncateStyles}>
                  {listPost.data[0].content}
                </Typography>
              </Stack>

              {/* See detail button */}
              <Link href="#" style={{ width: "100%" }}>
                <Button
                  variant="contained"
                  color="primary"
                  fullWidth
                  endIcon={<ArrowCircleRight size={24} />}
                >
                  Xem chi tiết
                </Button>
              </Link>
            </Paper>
          </Grid>

          {/* Sub contents */}
          <Grid item oversize={6} desktop={6} tablet={6} mobile={12}>
            {!isTablet && (
              <Typography variant="body2" my={1} fontWeight={800}>
                Các thông báo khác
              </Typography>
            )}
            <Box
              sx={{
                ...subContentContainerStyles,
                height: `${
                  isTablet ? "calc(100vh - var(--height-header) * 1.8)" : "100%"
                }`,
              }}
            >
              {listPost.data.map((item, index) => {
                if (index !== 0) {
                  return (
                    <Link href="#" key={index}>
                      <Grid container sx={postItemStyles} columnSpacing={2}>
                        <Grid
                          item
                          oversize={3}
                          desktop={3}
                          tablet={3}
                          mobile={3}
                          sx={{
                            overflow: "hidden",
                            borderRadius: 1,
                            height: "100%",
                          }}
                        >
                          <img src={item.image} alt="picture" height="100%" />
                        </Grid>
                        {/* Title & Content */}
                        <Grid
                          item
                          oversize={9}
                          desktop={9}
                          tablet={9}
                          mobile={9}
                        >
                          <Stack display="flex" direction="column" gap={1}>
                            <Typography
                              variant="body1"
                              sx={{ ...truncateStyles, fontWeight: 800 }}
                            >
                              {item.title}
                            </Typography>
                            <Typography variant="body1" sx={truncateStyles}>
                              {item.content}
                            </Typography>
                          </Stack>
                        </Grid>
                      </Grid>
                    </Link>
                  );
                }
              })}
            </Box>
          </Grid>
        </Grid>
      ) : (
        <Box sx={containerStyles}>
          <NoData />
        </Box>
      )}
    </>
  );
};

export default Posts;

const containerStyles: SxProps<Theme> = {
  display: "flex",
  justifyContent: "center",
  alignItems: "center",
  marginTop: 5,
  height: "calc(100vh - var(--height-header) * 1.8)",
  overflow: "hidden",
  border: "1px dashed var(--border-color)",
  borderRadius: 1,
};

const postItemStyles: SxProps<Theme> = {
  display: "flex",
  alignItems: "center",
  padding: 1,
  height: "100px",
  border: "1px solid var(--border-color)",
  borderRadius: 2,
};

const postItemStyles__main: SxProps<Theme> = {
  display: "flex",
  flexDirection: "column",
  gap: 2,
  borderRadius: 1,
  padding: 2,
};

const subContentContainerStyles: SxProps<Theme> = {
  display: "flex",
  flexDirection: "column",
  gap: 3,
  overflow: "scroll",
};

const truncateStyles: SxProps<Theme> = {
  overflow: "hidden",
  textOverflow: "ellipsis",
  whiteSpace: "nowrap",
};
