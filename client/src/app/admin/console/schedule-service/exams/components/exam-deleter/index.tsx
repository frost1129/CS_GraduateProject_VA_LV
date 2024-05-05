"use client";

import ConfirmDeleteDialog from "@/lib/components/confirm-delete-dialog";
import { Stack, SxProps, Theme, Typography } from "@mui/material";
import { Trash } from "@phosphor-icons/react";
import { useState } from "react";

const ExamDeleter = () => {
    const [openDeleteDialog, setOpenDeleteDialog] = useState(false);

    const handleClickOpen = () => setOpenDeleteDialog(true);
    const handleClose = () => setOpenDeleteDialog(false);

    const handleDeleteContent = () =>
        console.log("deleted");

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
                    title="Xóa bài đăng"
                    content="Bạn có chắc chắn muốn xóa bài đăng này?"
                    deleteFunc={handleDeleteContent}
                    loading={true}
                    />
            )}
        </>
    );
};

export default ExamDeleter;

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
