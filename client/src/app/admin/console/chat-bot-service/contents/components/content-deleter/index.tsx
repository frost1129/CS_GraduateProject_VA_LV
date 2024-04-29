"use client";

import { useEffect, useState } from "react";

import { Stack, SxProps, Theme, Typography } from "@mui/material";
import { Trash } from "@phosphor-icons/react";

import ConfirmDeleteDialog from "@/lib/components/confirm-delete-dialog";
import { deleteContentThunk } from "@/lib/redux/features/chat-bot/content/contentActions";
import { removeContentByIdV2, resetContentStatus } from "@/lib/redux/features/chat-bot/content/contentSlice";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { ContentDeleterProps } from "@/lib/types/component";

const ContentDeleter = (props: ContentDeleterProps) => {
  const { value } = props;

  // Redux
  const dispatch = useAppDispatch();
  const { deleteContentLoading, deleteContentSuccess, deleteContentError } =
    useAppSelector((state) => state.content);

  const [openDeleteDialog, setOpenDeleteDialog] = useState(false);

  const handleClickOpen = () => setOpenDeleteDialog(true);
  const handleClose = () => setOpenDeleteDialog(false);

  const handleDeleteContent = () =>
    dispatch(deleteContentThunk(value.id.toString()));

  useEffect(() => {
    if (deleteContentSuccess !== null) {
      dispatch(removeContentByIdV2({ contentId: value.id }));
      dispatch(resetContentStatus({ keys: ["deleteContentSuccess"] }));
      handleClose();
    } else if (deleteContentError !== null) {
      dispatch(resetContentStatus({ keys: ["deleteContentError"] }));
    }
  }, [deleteContentSuccess, deleteContentError]);

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
          title="Xóa nội dung"
          content="Bạn có chắc chắn muốn xóa nội dung này? Tất cả những nội dung liên quan cũng bị xóa theo. Tiếp tục?"
          deleteFunc={handleDeleteContent}
          loading={deleteContentLoading}
        />
      )}
    </>
  );
};

export default ContentDeleter;

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
