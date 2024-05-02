"use client";

import { ConversationHistoryDetailProps } from "@/lib/types/component";
import { convertMillisecondsToDate } from "@/lib/utils";
import {
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  Grid,
  IconButton,
  Stack,
  SxProps,
  TextField,
  Theme,
  Typography,
} from "@mui/material";
import { CornersOut, X } from "@phosphor-icons/react";
import { useState } from "react";

const ConversationHistoryDetail = (props: ConversationHistoryDetailProps) => {
  const { value } = props;

  const [
    openConversationHistoryDetailDialog,
    setOpenConversationHistoryDetailDialog,
  ] = useState(false);

  const handleClickOpen = () => {
    setOpenConversationHistoryDetailDialog(true);
  };

  const handleClose = () => {
    setOpenConversationHistoryDetailDialog(false);
  };

  return (
    <>
      <Stack
        direction="row"
        component="button"
        className="reset-btn"
        onClick={handleClickOpen}
        sx={btnStyles}
      >
        <CornersOut size={24} />
        <Typography variant="body2">Xem chi tiết</Typography>
      </Stack>
      {openConversationHistoryDetailDialog && (
        <Dialog
          id="conversation-history-detail-dialog"
          open={true}
          aria-labelledby="conversation-history-detail-dialog-title"
          aria-describedby="conversation-history-detail-dialog-description"
          maxWidth={"tablet"}
          fullWidth
        >
          <DialogTitle
            component="div"
            id="conversation-history-detail-dialog-title"
          >
            <Typography variant="h5">Chi tiết hội thoại</Typography>
          </DialogTitle>
          <IconButton
            aria-label="close"
            onClick={handleClose}
            sx={{
              position: "absolute",
              right: 24,
              top: 12,
              padding: 1,
              color: (theme) => theme.palette.grey[500],
            }}
          >
            <X size={24} />
          </IconButton>
          <DialogContent>
            <Stack direction="column" gap={2}>
              {/* Created date & Last modified date field */}
              <Grid container spacing={2}>
                <Grid item oversize={6} desktop={6} tablet={6} mobile={12}>
                  <Stack direction="column" gap={1}>
                    <Typography variant="label3">Ngày tạo</Typography>
                    <TextField
                      value={convertMillisecondsToDate(value.createdDate)}
                    />
                  </Stack>
                </Grid>
                <Grid item oversize={6} desktop={6} tablet={6} mobile={12}>
                  <Stack direction="column" gap={1}>
                    <Typography variant="label3">Ngày chỉnh sửa</Typography>
                    <TextField
                      value={
                        value.lastModifiedDate
                          ? convertMillisecondsToDate(value.lastModifiedDate)
                          : "---"
                      }
                    />
                  </Stack>
                </Grid>
              </Grid>

              {/* Username field */}
              <Stack direction="column" gap={1}>
                <Typography variant="label3">Tên người dùng</Typography>
                <TextField value={value.username} />
              </Stack>

              {/* Question field */}
              <Stack direction="column" gap={1}>
                <Typography variant="label3">Câu hỏi</Typography>
                <TextField value={value.question} multiline rows={6} />
              </Stack>

              {/* Answer field */}
              <Stack direction="column" gap={1}>
                <Typography variant="label3">Câu trả lời</Typography>
                <TextField value={value.answer} multiline rows={6} />
              </Stack>
            </Stack>
          </DialogContent>
          <DialogActions sx={{ paddingX: 3, paddingBottom: 2 }}>
            <Button
              variant="outlined"
              color="secondary"
              onClick={handleClose}
              fullWidth
            >
              Trở lại
            </Button>
          </DialogActions>
        </Dialog>
      )}
    </>
  );
};

export default ConversationHistoryDetail;

const btnStyles: SxProps<Theme> = {
  flex: 1,
  padding: "6px 16px",
  alignItems: "center",
  gap: 1,
};
