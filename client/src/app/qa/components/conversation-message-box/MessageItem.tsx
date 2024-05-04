import { Avatar, Box, Stack, SxProps, Theme, Typography } from "@mui/material";

import { images } from "@/lib/assets/img";
import { MessageItemProps } from "@/lib/types/component";

const MessageItem = (props: MessageItemProps) => {
  const { type, content } = props;
  return (
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
      <Box
        sx={{
          ...contentStyles,
          backgroundColor: `${
            type === "answer" ? "var(--grey-neutral-40)" : "var(--primary)"
          }`,
          color: `${type === "answer" ? "var(--black)" : "var(--white)"}`,
        }}
      >
        <Typography variant="body2" sx={{ whiteSpace: "pre-wrap" }}>
          {content}
        </Typography>
      </Box>

      {type === "question" && (
        <Avatar
          src={images.defaultAvt.src}
          alt="avatar"
          sx={{ width: "40px", height: "40px" }}
        />
      )}
    </Stack>
  );
};

export default MessageItem;

const layoutStyles: SxProps<Theme> = {
  flexDirection: "row",
  gap: 1,
  marginRight: 1,
};

const contentStyles: SxProps<Theme> = {
  width: "fit-content",
  maxWidth: 400,
  padding: 2,
  borderRadius: 1.5,
  backgroundColor: "var(--primary)",
  color: "var(--white)",
  overflow: "hidden",
};
