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
  IconButton,
  Stack,
  TextField,
  Typography,
} from "@mui/material";
import { Plus, X } from "@phosphor-icons/react";
import { ICategoryRequest } from "@/lib/types/backend";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { addNewCategoryThunk } from "@/lib/redux/features/chat-bot/category/categoryActions";
import {
  appendCategoryFirst,
  resetCategoryStatus,
} from "@/lib/redux/features/chat-bot/category/categorySlice";
import CustomLoadingButton from "@/lib/components/loading-button";
import { ToastInformation } from "@/lib/types/component";
import CustomToast from "@/lib/components/toast";

const categoryCreateSchema = z.object({
  intentCode: z.string().min(1, "Không được bỏ trống").max(30, "Không vượt quá 30 ký tự"),
  description: z.string().min(1, "Không được bỏ trống"),
  note: z.string().nullable(),
});

type CategoryCreateForm = z.infer<typeof categoryCreateSchema>;

const CategoryCreator = () => {
  const dispatch = useAppDispatch();
  const { saveCategoryLoading, savedCategory, saveCategoryError } =
    useAppSelector((state) => state.category);

  const { register, handleSubmit, formState, reset } =
    useForm<CategoryCreateForm>({
      resolver: zodResolver(categoryCreateSchema),
      mode: "onChange",
    });

  const [openCreateDialog, setOpenCreateDialog] = useState(false);
  const [toastInfo, setToastInfo] = useState<ToastInformation>();
  const [openToast, setOpenToast] = useState<boolean>(false);

  const handleClickOpen = () => {
    setOpenCreateDialog(true);
  };
  const handleClose = () => {
    reset();
    setOpenCreateDialog(false);
  };

  const handleCreateCategory = (data: CategoryCreateForm) => {
    const categoryData: ICategoryRequest = {
      id: null,
      intentCode: data.intentCode.trim(),
      description: data.description,
      note: data.note,
    };
    dispatch(addNewCategoryThunk(categoryData));
  };

  useEffect(() => {
    if (savedCategory !== null) {
      setOpenToast(true);
      setToastInfo({
        severity: "success",
        title: "Thành công",
        message: "Tạo mới danh mục thành công!",
      });

      dispatch(appendCategoryFirst({ category: savedCategory }));
      dispatch(resetCategoryStatus({ keys: ["savedCategory"] }));
      handleClose();
    } else if (saveCategoryError !== null) {
      setOpenToast(true);
      setToastInfo({
        severity: "error",
        title: "Thất bại",
        message: saveCategoryError,
      });

      dispatch(resetCategoryStatus({ keys: ["saveCategoryError"] }));
    }
  }, [savedCategory, saveCategoryError]);

  return (
    <>
      <Button
        variant="contained"
        color="primary"
        onClick={handleClickOpen}
        fullWidth
      >
        <Stack direction="row" gap={1} alignItems="center">
          <Plus size={20} />
          <Typography variant="button1">Tạo mới</Typography>
        </Stack>
      </Button>
      <Dialog
        id="category-create-dialog"
        component="form"
        open={openCreateDialog}
        aria-labelledby="category-create-dialog-title"
        aria-describedby="category-create-dialog-description"
        fullWidth
        maxWidth={"tablet"}
        onSubmit={handleSubmit(handleCreateCategory)}
      >
        <DialogTitle component="div" id="category-create-dialog-title">
          <Typography variant="h5">Tạo mới danh mục</Typography>
        </DialogTitle>
        <IconButton
          aria-label="close"
          onClick={handleClose}
          disabled={saveCategoryLoading}
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
            {/* Intent code field */}
            <Stack direction="column" gap={1}>
              <Stack direction="row" gap={0.5}>
                <Typography variant="label3">Chuỗi xác định</Typography>
                <Box sx={{ color: "var(--alert)" }}>*</Box>
              </Stack>
              <TextField
                placeholder="Nhập chuỗi xác định..."
                error={!!formState.errors.intentCode}
                helperText={formState.errors.intentCode?.message}
                disabled={saveCategoryLoading}
                {...register("intentCode")}
              />
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
                placeholder="Nhập mô tả"
                error={!!formState.errors.description}
                helperText={formState.errors.description?.message}
                disabled={saveCategoryLoading}
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
                disabled={saveCategoryLoading}
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
            disabled={saveCategoryLoading}
          >
            Hủy
          </Button>
          {saveCategoryLoading ? (
            <CustomLoadingButton sx={{ height: "42px" }} />
          ) : (
            <Button
              variant="contained"
              color="primary"
              type="submit"
              disabled={!formState.isValid}
            >
              Tạo
            </Button>
          )}
        </DialogActions>
      </Dialog>
      {openToast && (
        <CustomToast
          id="category-create-toast"
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

export default CategoryCreator;
