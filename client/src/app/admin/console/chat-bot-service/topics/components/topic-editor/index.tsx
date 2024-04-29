"use client";

import { useEffect, useState } from "react";
import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from "react-hook-form";
import { z } from "zod";

import {
  Box,
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
import { PencilSimple, X } from "@phosphor-icons/react";

import { ToastInformation, TopicEditorProps } from "@/lib/types/component";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { ITopicRequest } from "@/lib/types/backend";
import { convertMillisecondsToDate } from "@/lib/utils";
import CustomLoadingButton from "@/lib/components/loading-button";
import CustomToast from "@/lib/components/toast";
import { updateTopicThunk } from "@/lib/redux/features/chat-bot/topic/topicActions";
import {
  resetTopicStatus,
  updateTopicById,
} from "@/lib/redux/features/chat-bot/topic/topicSlice";

const topicEditSchema = z.object({
  description: z.string().min(1, "Không được bỏ trống"),
  note: z.string().nullable(),
});

type TopicEditForm = z.infer<typeof topicEditSchema>;

const TopicEditor = (props: TopicEditorProps) => {
  const { value } = props;

  // Redux
  const dispatch = useAppDispatch();
  const { updateTopicLoading, updatedTopic, updateTopicError } = useAppSelector(
    (state) => state.topic
  );

  // React Hook Form
  const { register, handleSubmit, formState, reset } = useForm<TopicEditForm>({
    resolver: zodResolver(topicEditSchema),
    mode: "onChange",
  });

  const [openEditDialog, setOpenEditDialog] = useState(false);
  const [toastInfo, setToastInfo] = useState<ToastInformation>();
  const [openToast, setOpenToast] = useState<boolean>(false);

  const handleClickOpen = () => {
    setOpenEditDialog(true);
  };

  const handleClose = () => {
    setOpenEditDialog(false);
    reset({ ...value });
  };

  const handleUpdateTopic = (data: TopicEditForm) => {
    const topicData: ITopicRequest = {
      id: null,
      intentCode: null,
      categoryId: value.category.id,
      description: data.description,
      note: data.note,
    };
    dispatch(
      updateTopicThunk({
        topicId: value.id.toString(),
        topic: topicData,
      })
    );
  };

  useEffect(() => {
    if (updatedTopic !== null) {
      setOpenToast(true);
      setToastInfo({
        severity: "success",
        title: "Thành công",
        message: "Chỉnh sửa chủ đề thành công!",
      });

      dispatch(updateTopicById({ topic: updatedTopic }));
      dispatch(resetTopicStatus({ keys: ["updatedTopic"] }));
      handleClose();
    } else if (updateTopicError !== null) {
      setOpenToast(true);
      setToastInfo({
        severity: "error",
        title: "Thất bại",
        message: updateTopicError,
      });

      dispatch(resetTopicStatus({ keys: ["updateTopicError"] }));
    }
  }, [updatedTopic, updateTopicError]);

  // Reset input fields
  useEffect(() => {
    reset({ ...value });
    setOpenToast(false);
  }, []);

  return (
    <>
      <Stack
        direction="row"
        component="button"
        className="reset-btn"
        onClick={handleClickOpen}
        sx={btnStyles}
      >
        <PencilSimple size={24} />
        <Typography variant="body2">Chỉnh sửa</Typography>
      </Stack>
      {openEditDialog && (
        <Dialog
          id="category-edit-dialog"
          component="form"
          onSubmit={handleSubmit(handleUpdateTopic)}
          open={true}
          aria-labelledby="category-edit-dialog-title"
          aria-describedby="category-edit-dialog-description"
          maxWidth={"tablet"}
          fullWidth
        >
          <DialogTitle component="div" id="category-edit-dialog-title">
            <Typography variant="h5">Chỉnh sửa danh mục</Typography>
          </DialogTitle>
          <IconButton
            aria-label="close"
            onClick={handleClose}
            disabled={updateTopicLoading}
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
                      disabled
                      value={convertMillisecondsToDate(value.createdDate!)}
                    />
                  </Stack>
                </Grid>
                <Grid item oversize={6} desktop={6} tablet={6} mobile={12}>
                  <Stack direction="column" gap={1}>
                    <Typography variant="label3">Ngày chỉnh sửa</Typography>
                    <TextField
                      disabled
                      value={
                        value.lastModifiedDate
                          ? convertMillisecondsToDate(value.lastModifiedDate)
                          : "---"
                      }
                    />
                  </Stack>
                </Grid>
              </Grid>

              {/* Intent code field */}
              <Stack direction="column" gap={1}>
                <Typography variant="label3">Chuỗi xác định</Typography>
                <TextField disabled value={value.intentCode} />
              </Stack>

              {/* Description field */}
              <Stack direction="column" gap={1}>
                <Stack direction="row" gap={0.5}>
                  <Typography variant="label3">Mô tả</Typography>
                  <Box sx={{ color: "var(--alert)" }}>*</Box>
                </Stack>
                <TextField
                  multiline
                  rows={3}
                  placeholder="Nhập mô tả..."
                  error={!!formState.errors.description}
                  helperText={formState.errors.description?.message}
                  disabled={updateTopicLoading}
                  {...register("description")}
                />
              </Stack>

              {/* Note field */}
              <Stack direction="column" gap={1}>
                <Typography variant="label3">Ghi chú</Typography>
                <TextField
                  multiline
                  rows={3}
                  placeholder="Nhập ghi chú..."
                  disabled={updateTopicLoading}
                  {...register("note")}
                />
              </Stack>
            </Stack>
          </DialogContent>
          <DialogActions sx={{ paddingX: 3, paddingBottom: 2 }}>
            <Button
              variant="outlined"
              color="secondary"
              onClick={handleClose}
              disabled={updateTopicLoading}
            >
              Hủy
            </Button>
            {updateTopicLoading ? (
              <CustomLoadingButton sx={{ height: "42px" }} />
            ) : (
              <Button
                variant="contained"
                color="primary"
                type="submit"
                disabled={!formState.isValid}
              >
                Lưu
              </Button>
            )}
          </DialogActions>
        </Dialog>
      )}
      {openToast && (
        <CustomToast
          id="topic-edit-toast"
          open={openToast}
          handleClose={() => setOpenToast(false)}
          title={toastInfo?.title!}
          message={toastInfo?.message!}
          severity={toastInfo?.severity}
        />
      )}
    </>
  );
};

export default TopicEditor;

const btnStyles: SxProps<Theme> = {
  flex: 1,
  padding: "6px 16px",
  alignItems: "center",
  gap: 1,
};
