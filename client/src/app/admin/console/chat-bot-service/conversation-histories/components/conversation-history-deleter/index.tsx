"use client";

import { useEffect, useState } from "react";

import { Stack, SxProps, Theme, Typography } from "@mui/material";
import { Trash } from "@phosphor-icons/react";

import ConfirmDeleteDialog from "@/lib/components/confirm-delete-dialog";
import CustomToast from "@/lib/components/toast";
import { deleteConversationHistoryThunk } from "@/lib/redux/features/chat-bot/conversation-history/conversationHistoryActions";
import {
  removeConversationHistoryById,
  resetConversationHistoryStatus,
} from "@/lib/redux/features/chat-bot/conversation-history/conversationHistorySlice";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import {
  ConversationHistoryDeleterProps,
  ToastInformation,
} from "@/lib/types/component";

const ConversationHistoryDeleter = (props: ConversationHistoryDeleterProps) => {
  const { value } = props;

  // Redux
  const dispatch = useAppDispatch();
  const {
    deleteConversationHistoryLoading,
    deleteConversationHistorySuccess,
    deleteConversationHistoryError,
  } = useAppSelector((state) => state.conversationHistory);

  const [openDeleteDialog, setOpenDeleteDialog] = useState(false);
  const [toastInfo, setToastInfo] = useState<ToastInformation>();
  const [openToast, setOpenToast] = useState<boolean>(false);

  const handleClickOpen = () => setOpenDeleteDialog(true);
  const handleClose = () => setOpenDeleteDialog(false);

  const handleDeleteConversationHistory = () =>
    dispatch(deleteConversationHistoryThunk(value.id.toString()));

  useEffect(() => {
    if (deleteConversationHistorySuccess !== null) {
      dispatch(
        removeConversationHistoryById({ conversationHistoryId: value.id })
      );
      dispatch(
        resetConversationHistoryStatus({
          keys: ["deleteConversationHistorySuccess"],
        })
      );
      handleClose();
    } else if (deleteConversationHistoryError !== null) {
      setOpenToast(true);
      setToastInfo({
        severity: "error",
        title: "Thất bại",
        message: "Không thể xóa lịch sử hỏi đáp này!",
      });
      handleClose();
      dispatch(
        resetConversationHistoryStatus({
          keys: ["deleteConversationHistoryError"],
        })
      );
    }
  }, [deleteConversationHistorySuccess, deleteConversationHistoryError]);

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
          title="Xóa lịch sử hỏi đáp"
          content="Bạn có chắc chắn muốn xóa lịch sử hỏi đáp này?"
          deleteFunc={handleDeleteConversationHistory}
          loading={deleteConversationHistoryLoading}
        />
      )}
      {openToast && (
        <CustomToast
          id="conversation-history-delete-toast"
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

export default ConversationHistoryDeleter;

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
