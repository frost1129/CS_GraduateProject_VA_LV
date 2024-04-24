"use client";

import { useEffect, useState } from "react";

import {
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  IconButton,
  Stack,
  SxProps,
  Theme,
  Typography,
} from "@mui/material";
import { Trash, X } from "@phosphor-icons/react";

import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { deleteCategoryThunk } from "@/lib/redux/features/chat-bot/category/categoryActions";
import { CategoryDeleterProps, ToastInformation } from "@/lib/types/component";
import CustomToast from "@/lib/components/toast";
import CustomLoadingButton from "@/lib/components/loading-button";
import { removeCategoryById } from "@/lib/redux/features/chat-bot/category/categorySlice";

const CategoryDeleter = (props: CategoryDeleterProps) => {
  const { value } = props;

  // Redux
  const dispatch = useAppDispatch();
  const { deleteCategoryLoading, deleteCategorySuccess } = useAppSelector(
    (state) => state.category
  );

  const [openDeleteDialog, setOpenDeleteDialog] = useState(false);
  const [toastInfo, setToastInfo] = useState<ToastInformation>();
  const [openToast, setOpenToast] = useState<boolean>(false);

  const handleClickOpen = () => {
    setOpenDeleteDialog(true);
  };
  const handleClose = () => {
    setOpenDeleteDialog(false);
  };

  const handleDeleteCategory = () => {
    dispatch(deleteCategoryThunk(value.id.toString()));
  };

  useEffect(() => {
    if (deleteCategorySuccess) {
      setOpenToast(true);
      setToastInfo({
        severity: "success",
        title: "Thành công",
        message: deleteCategorySuccess.message,
      });

      dispatch(removeCategoryById({ categoryId: value.id }));
      handleClose();
    } else {
      setOpenToast(true);
      setToastInfo({
        severity: "error",
        title: "Thất bại",
        message: "Xóa danh mục thất bại!",
      });
    }
  }, [deleteCategorySuccess]);

  useEffect(() => {
    setOpenToast(false);
  }, []);
  
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
        <Dialog
          component="form"
          open={true}
          aria-labelledby="category-edit-dialog-title"
          aria-describedby="category-edit-dialog-description"
          maxWidth={"tablet"}
        >
          <DialogTitle component="div" id="category-edit-dialog-title">
            <Typography variant="h5">Delete Category</Typography>
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
            disabled={deleteCategoryLoading}
          >
            <X size={24} />
          </IconButton>
          <DialogContent>
            <Typography variant="body2">
              Do you want to delete this category? All related content will be
              deleted also.
            </Typography>
          </DialogContent>
          <DialogActions sx={{ paddingX: 3, paddingBottom: 2 }}>
            <Button
              variant="outlined"
              color="secondary"
              onClick={handleClose}
              disabled={deleteCategoryLoading}
            >
              Cancel
            </Button>
            {deleteCategoryLoading ? (
              <CustomLoadingButton sx={{ height: "40px" }} />
            ) : (
              <Button
                variant="contained"
                color="error"
                onClick={handleDeleteCategory}
              >
                Delete
              </Button>
            )}
          </DialogActions>
        </Dialog>
      )}

      {/* <ConfirmDeleteDialog
        open={openDeleteDialog}
        setOpen={setOpenDeleteDialog}
        title="Delete Category"
        content="Do you want to delete this category? All related content will be deleted also."
        deleteFunc={handleDeleteCategory}
        loading={deleteCategoryLoading}
      /> */}
      {openToast && (
        <CustomToast
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
