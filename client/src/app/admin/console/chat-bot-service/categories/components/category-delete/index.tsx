"use client";

import { useState } from "react";

import { Stack, SxProps, Theme, Typography } from "@mui/material";
import { Trash } from "@phosphor-icons/react";

import ConfirmDeleteDialog from "@/lib/components/confirm-delete-dialog";

const CategoryDeleteConfirm = () => {
  const [openDeleteDialog, setOpenDeleteDialog] = useState(false);

  const handleClickOpen = () => {
    setOpenDeleteDialog(true);
  };
  const handleClose = () => {
    setOpenDeleteDialog(false);
  };

  const handleDeleteCategory = () => {
    console.log(1);
    handleClose();
  };

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
        <Typography variant="body2">Delete</Typography>
      </Stack>
      <ConfirmDeleteDialog
        open={openDeleteDialog}
        setOpen={setOpenDeleteDialog}
        title="Delete Category"
        content="Do you want to delete this category? All relative content will be deleted also."
        deleteFunc={handleDeleteCategory}
        loading={false}
      />
    </>
  );
};

export default CategoryDeleteConfirm;

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
