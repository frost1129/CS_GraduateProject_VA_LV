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
import { appendFirst } from "@/lib/redux/features/chat-bot/category/categorySlice";
import CustomLoadingButton from "@/lib/components/loading-button";

const categoryCreateSchema = z.object({
  intentCode: z.string().min(1, "Not be empty"),
  description: z.string().min(1, "Not be empty"),
  note: z.string().nullable(),
});

type CategoryCreateForm = z.infer<typeof categoryCreateSchema>;

const CategoryCreator = () => {
  const dispatch = useAppDispatch();
  const { saveCategoryLoading, savedCategory, saveCategoryError } =
    useAppSelector((state) => state.category);

  const { register, handleSubmit, formState, getValues, reset } =
    useForm<CategoryCreateForm>({
      resolver: zodResolver(categoryCreateSchema),
      mode: "onChange",
    });

  const [openCreateDialog, setOpenCreateDialog] = useState(false);

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
      intentCode: data.intentCode,
      description: data.description,
      note: data.note,
    };
    dispatch(addNewCategoryThunk(categoryData));
    handleClose();
  };

  useEffect(() => {
    if (savedCategory !== null) {
      dispatch(appendFirst({ category: savedCategory }));
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
          <Typography variant="button1">Add new</Typography>
        </Stack>
      </Button>
      <Dialog
        component="form"
        open={openCreateDialog}
        aria-labelledby="category-edit-dialog-title"
        aria-describedby="category-edit-dialog-description"
        fullWidth
        maxWidth={"tablet"}
        onSubmit={handleSubmit(handleCreateCategory)}
      >
        <DialogTitle component="div" id="category-edit-dialog-title">
          <Typography variant="h5">Create New Category</Typography>
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
                <Typography variant="label3">Intent code</Typography>
                <Box sx={{ color: "var(--alert)" }}>*</Box>
              </Stack>
              <TextField
                placeholder="Enter intent code..."
                error={!!formState.errors.intentCode}
                helperText={formState.errors.intentCode?.message}
                disabled={saveCategoryLoading}
                {...register("intentCode")}
              />
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
                disabled={saveCategoryLoading}
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
            Cancel
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
              Create
            </Button>
          )}
        </DialogActions>
      </Dialog>
    </>
  );
};

export default CategoryCreator;
