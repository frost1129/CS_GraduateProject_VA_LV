"use client";

import { useState } from "react";

import {
  Avatar,
  Backdrop,
  Box,
  IconButton,
  Stack,
  SxProps,
  Theme,
  Typography,
} from "@mui/material";
import { X } from "@phosphor-icons/react";

import { images } from "@/lib/assets/img";
import { MessageItemProps } from "@/lib/types/component";

const MessageItem = (props: MessageItemProps) => {
  const { type, message } = props;

  const [openPicture, setOpenPicture] = useState<boolean>(false);

  return (
    <>
      <Stack
        sx={{
          ...layoutStyles,
          justifyContent: `${type === "answer" ? "flex-start" : "flex-end"}`,
        }}
      >
        {type === "answer" && (
          <Avatar
            src={images.robotAvatarV2.src}
            alt="avatar"
            sx={{ width: "40px", height: "40px" }}
          />
        )}
        <Stack
          sx={{
            ...contentStyles,
            backgroundColor: `${
              type === "answer" ? "var(--grey-neutral-40)" : "var(--primary)"
            }`,
            color: `${type === "answer" ? "var(--black)" : "var(--white)"}`,
          }}
        >
          <Typography variant="body2" sx={{ whiteSpace: "pre-wrap" }}>
            {type === "answer" ? message.answer : message.question}
          </Typography>
          {message.imageLink && type === "answer" ? (
            <Box
              component="button"
              className="reset-btn"
              onClick={() => setOpenPicture(true)}
              sx={{ cursor: "pointer" }}
            >
              <img src={message.imageLink} alt="picture" width="100%" />
            </Box>
          ) : null}
        </Stack>

        {type === "question" && (
          <Avatar
            src={images.defaultAvt.src}
            alt="avatar"
            sx={{ width: "40px", height: "40px" }}
          />
        )}
      </Stack>
      <Backdrop
        sx={{
          color: "#fff",
          zIndex: (theme) => theme.zIndex.drawer + 1,
        }}
        open={openPicture}
        onClick={() => setOpenPicture(false)}
      >
        <IconButton
          onClick={() => setOpenPicture(false)}
          sx={{
            position: "absolute",
            top: 20,
            right: 20,
            color: "var(--white)",
            padding: 1,
          }}
        >
          <X size={32} />
        </IconButton>
        <img
          src={message.imageLink || ""}
          alt="picture"
          style={{
            maxWidth: "100%",
            maxHeight: "100vh",
            objectFit: "contain",
          }}
        />
      </Backdrop>
    </>
  );
};

export default MessageItem;

const layoutStyles: SxProps<Theme> = {
  flexDirection: "row",
  gap: 1,
  marginRight: 1,
};

const contentStyles: SxProps<Theme> = {
  position: "relative",
  width: "fit-content",
  maxWidth: 400,
  padding: 2,
  borderRadius: 1.5,
  backgroundColor: "var(--primary)",
  color: "var(--white)",
  overflow: "hidden",
  flexDirection: "column",
  gap: 1,
};
