"use client";

import { useEffect, useState } from "react";

import { Trash } from "@phosphor-icons/react";
import { Stack, SxProps, Theme, Typography } from "@mui/material";

import { deleteTopicThunk } from "@/lib/redux/features/chat-bot/topic/topicActions";
import {
  removeTopicById,
  resetTopicStatus,
} from "@/lib/redux/features/chat-bot/topic/topicSlice";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { TopicDeleterProps } from "@/lib/types/component";
import ConfirmDeleteDialog from "@/lib/components/confirm-delete-dialog";

const TopicDeleter = (props: TopicDeleterProps) => {
  const { value } = props;

  // Redux
  const dispatch = useAppDispatch();
  const { deleteTopicLoading, deleteTopicSuccess, deleteTopicError } =
    useAppSelector((state) => state.topic);

  const [openDeleteDialog, setOpenDeleteDialog] = useState(false);

  const handleClickOpen = () => setOpenDeleteDialog(true);
  const handleClose = () => setOpenDeleteDialog(false);

  const handleDeleteTopic = () =>
    dispatch(deleteTopicThunk(value.id.toString()));

  useEffect(() => {
    if (deleteTopicSuccess !== null) {
      dispatch(removeTopicById({ topicId: value.id }));
      dispatch(resetTopicStatus({ keys: ["deleteTopicSuccess"] }));
      handleClose();
    } else if (deleteTopicError !== null) {
      dispatch(resetTopicStatus({ keys: ["deleteTopicError"] }));
    }
  }, [deleteTopicSuccess, deleteTopicError]);

  return (
    <>
      <Stack
        component="button"
        direction="row"
        className="reset-btn"
        onClick={handleClickOpen}
        sx={deleteBtnStyles}
      >
        <Trash size={24} />
        <Typography variant="body2">Xóa</Typography>
      </Stack>

      {openDeleteDialog && (
        <ConfirmDeleteDialog
          open={openDeleteDialog}
          setOpen={setOpenDeleteDialog}
          title="Xóa chủ đề"
          content="Bạn có chắc chắn muốn xóa chủ đề này? Tất cả những dữ liệu liên quan cũng bị xóa theo. Tiếp tục?"
          deleteFunc={handleDeleteTopic}
          loading={deleteTopicLoading}
        />
      )}
    </>
  );
};

export default TopicDeleter;

const deleteBtnStyles: SxProps<Theme> = {
  color: "var(--alert)",
  flex: 1,
  padding: "12px 16px",
  borderRadius: 1.25,
  alignItems: "center",
  gap: 1,
  ":hover": {
    backgroundColor: "var(--alert)",
    color: "var(--white)",
  },
};
