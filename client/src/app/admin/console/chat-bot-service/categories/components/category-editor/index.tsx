"use client";

import { useEffect, useState } from "react";
import { z } from "zod";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";

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

import { CategoryEditorProps, ToastInformation } from "@/lib/types/component";
import { convertMillisecondsToDate } from "@/lib/utils";
import { ICategoryRequest } from "@/lib/types/backend";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { updateCategoryThunk } from "@/lib/redux/features/chat-bot/category/categoryActions";
import {
  updateCategoryById,
} from "@/lib/redux/features/chat-bot/category/categorySlice";
import CustomToast from "@/lib/components/toast";
import CustomLoadingButton from "@/lib/components/loading-button";

const categoryEditSchema = z.object({
  description: z.string().min(1, "Not be empty"),
  note: z.string().nullable(),
});

type CategoryEditForm = z.infer<typeof categoryEditSchema>;

const CategoryEditor = (props: CategoryEditorProps) => {
  const { value } = props;

  // Redux
  const dispatch = useAppDispatch();
  const { updateCategoryLoading, updatedCategory, updateCategoryError } =
    useAppSelector((state) => state.category);

  // React Hook Form
  const { register, handleSubmit, formState, reset } =
    useForm<CategoryEditForm>({
      resolver: zodResolver(categoryEditSchema),
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

  const handleUpdateCategory = (data: CategoryEditForm) => {
    const categoryData: ICategoryRequest = {
      id: null,
      intentCode: null,
      description: data.description,
      note: data.note,
    };
    dispatch(
      updateCategoryThunk({
        categoryId: value.id.toString(),
        category: categoryData,
      })
    );
  };

  useEffect(() => {
    if (updatedCategory !== null) {
      setOpenToast(true);
      setToastInfo({
        severity: "success",
        title: "Thành công",
        message: "Chỉnh sửa danh mục thành công!",
      });

      dispatch(updateCategoryById({ category: updatedCategory }));
      handleClose();
    } else if (updateCategoryError !== null) {
      setOpenToast(true);
      setToastInfo({
        severity: "error",
        title: "Thất bại",
        message: updateCategoryError,
      });
    }
  }, [updatedCategory, updateCategoryError]);

  // Reset states
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
        <Typography variant="body2">Edit</Typography>
      </Stack>
      {openEditDialog && (
        <Dialog
          component="form"
          onSubmit={handleSubmit(handleUpdateCategory)}
          open={true}
          aria-labelledby="category-edit-dialog-title"
          aria-describedby="category-edit-dialog-description"
          maxWidth={"tablet"}
        >
          <DialogTitle component="div" id="category-edit-dialog-title">
            <Typography variant="h5">Edit Category</Typography>
          </DialogTitle>
          <IconButton
            aria-label="close"
            onClick={handleClose}
            disabled={updateCategoryLoading}
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
                    <Typography variant="label3">Created date</Typography>
                    <TextField
                      disabled
                      value={convertMillisecondsToDate(value.createdDate!)}
                    />
                  </Stack>
                </Grid>
                <Grid item oversize={6} desktop={6} tablet={6} mobile={12}>
                  <Stack direction="column" gap={1}>
                    <Typography variant="label3">Last modified date</Typography>
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
                <Typography variant="label3">Intent code</Typography>
                <TextField disabled value={value.intentCode} />
              </Stack>

              {/* Description field */}
              <Stack direction="column" gap={1}>
                <Stack direction="row" gap={0.5}>
                  <Typography variant="label3">Description</Typography>
                  <Box sx={{ color: "var(--alert)" }}>*</Box>
                </Stack>
                <TextField
                  multiline
                  rows={3}
                  placeholder="Enter description..."
                  error={!!formState.errors.description}
                  helperText={formState.errors.description?.message}
                  disabled={updateCategoryLoading}
                  {...register("description")}
                />
              </Stack>

              {/* Note field */}
              <Stack direction="column" gap={1}>
                <Typography variant="label3">Note</Typography>
                <TextField
                  multiline
                  rows={3}
                  placeholder="Enter note..."
                  disabled={updateCategoryLoading}
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
              disabled={updateCategoryLoading}
            >
              Cancel
            </Button>
            {updateCategoryLoading ? (
              <CustomLoadingButton sx={{ height: "42px" }} />
            ) : (
              <Button
                variant="contained"
                color="primary"
                type="submit"
                disabled={!formState.isValid}
              >
                Save
              </Button>
            )}
          </DialogActions>
        </Dialog>
      )}
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

export default CategoryEditor;

const btnStyles: SxProps<Theme> = {
  flex: 1,
  padding: "6px 16px",
  alignItems: "center",
  gap: 1,
};
