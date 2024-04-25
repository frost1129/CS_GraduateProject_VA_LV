"use client";

import { useEffect, useState } from "react";

import { Stack, SxProps, Theme, Typography } from "@mui/material";
import { Trash } from "@phosphor-icons/react";

import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { deleteCategoryThunk } from "@/lib/redux/features/chat-bot/category/categoryActions";
import { CategoryDeleterProps } from "@/lib/types/component";
import {
  removeCategoryById,
  resetCategoryStatus,
} from "@/lib/redux/features/chat-bot/category/categorySlice";
import ConfirmDeleteDialog from "@/lib/components/confirm-delete-dialog";

const CategoryDeleter = (props: CategoryDeleterProps) => {
  const { value } = props;

  // Redux
  const dispatch = useAppDispatch();
  const { deleteCategoryLoading, deleteCategorySuccess, deleteCategoryError } =
    useAppSelector((state) => state.category);

  const [openDeleteDialog, setOpenDeleteDialog] = useState(false);

  const handleClickOpen = () => setOpenDeleteDialog(true);
  const handleClose = () => setOpenDeleteDialog(false);

  const handleDeleteCategory = () =>
    dispatch(deleteCategoryThunk(value.id.toString()));

  useEffect(() => {
    if (deleteCategorySuccess !== null) {
      dispatch(removeCategoryById({ categoryId: value.id }));
      dispatch(resetCategoryStatus({ keys: ["deleteCategorySuccess"] }));
      handleClose();
    } else if (deleteCategoryError !== null) {
      dispatch(resetCategoryStatus({ keys: ["deleteCategoryError"] }));
    }
  }, [deleteCategorySuccess, deleteCategoryError]);

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

      {openDeleteDialog && (
        <ConfirmDeleteDialog
          open={openDeleteDialog}
          setOpen={setOpenDeleteDialog}
          title="Delete Category"
          content="Do you want to delete this category? All related content will be deleted also."
          deleteFunc={handleDeleteCategory}
          loading={deleteCategoryLoading}
        />
      )}
    </>
  );
};

export default CategoryDeleter;

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
