"use client";

import { useEffect, useState } from "react";
import { Controller, useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";

import { Plus, X } from "@phosphor-icons/react";
import {
  Autocomplete,
  Box,
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  IconButton,
  MenuItem,
  Stack,
  TextField,
  Typography,
} from "@mui/material";

import CustomLoadingButton from "@/lib/components/loading-button";
import CustomToast from "@/lib/components/toast";
import { addNewTopicThunk } from "@/lib/redux/features/chat-bot/topic/topicActions";
import {
  appendTopicFirst,
  resetTopicStatus,
} from "@/lib/redux/features/chat-bot/topic/topicSlice";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { ITopicRequest } from "@/lib/types/backend";
import { ToastInformation } from "@/lib/types/component";
import { getCategoriesThunk } from "@/lib/redux/features/chat-bot/category/categoryActions";

const topicCreateSchema = z.object({
  intentCode: z
    .string()
    .min(1, "Không được bỏ trống")
    .max(255, "Không vượt quá 255 ký tự"),
  description: z.string().min(1, "Không được bỏ trống"),
  categoryId: z.number(),
  note: z.string().nullable(),
});

type TopicCreateForm = z.infer<typeof topicCreateSchema>;

const TopicCreator = () => {
  const dispatch = useAppDispatch();
  const { saveTopicLoading, savedTopic, saveTopicError } = useAppSelector(
    (state) => state.topic
  );
  const { categories, listCategoryLoading, listCategoryError } = useAppSelector(
    (state) => state.category
  );

  const { register, handleSubmit, formState, reset, control } =
    useForm<TopicCreateForm>({
      resolver: zodResolver(topicCreateSchema),
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

  const handleCreateTopic = (data: TopicCreateForm) => {
    const topicData: ITopicRequest = {
      id: null,
      intentCode: data.intentCode,
      description: data.description,
      categoryId: data.categoryId,
      note: data.note,
    };
    dispatch(addNewTopicThunk(topicData));
  };

  useEffect(() => {
    if (savedTopic !== null) {
      setOpenToast(true);
      setToastInfo({
        severity: "success",
        title: "Thành công",
        message: "Tạo mới chủ đề thành công!",
      });

      dispatch(appendTopicFirst({ topic: savedTopic }));
      dispatch(resetTopicStatus({ keys: ["savedTopic"] }));
      handleClose();
    } else if (saveTopicError !== null) {
      setOpenToast(true);
      setToastInfo({
        severity: "error",
        title: "Thất bại",
        message: saveTopicError,
      });

      dispatch(resetTopicStatus({ keys: ["saveTopicError"] }));
    }
  }, [savedTopic, saveTopicError]);

  useEffect(() => {
    if (categories.length === 0) dispatch(getCategoriesThunk({}));
  }, []);

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
      {openCreateDialog && (
        <Dialog
          id="category-create-dialog"
          component="form"
          open={true}
          aria-labelledby="category-create-dialog-title"
          aria-describedby="category-create-dialog-description"
          fullWidth
          maxWidth={"tablet"}
          onSubmit={handleSubmit(handleCreateTopic)}
        >
          <DialogTitle component="div" id="category-create-dialog-title">
            <Typography variant="h5">Tạo mới chủ đề</Typography>
          </DialogTitle>
          <IconButton
            aria-label="close"
            onClick={handleClose}
            disabled={saveTopicLoading}
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
              {/* Category field */}
              <Stack direction="column" gap={1}>
                <Stack direction="row" gap={0.5}>
                  <Typography variant="label3">Danh mục</Typography>
                  <Box sx={{ color: "var(--alert)" }}>*</Box>
                </Stack>
                <Controller
                  name="categoryId"
                  control={control}
                  render={({
                    field: { onChange, onBlur, value, ref },
                    fieldState: { error },
                  }) => (
                    <Autocomplete
                      id="category-select"
                      options={categories}
                      autoHighlight
                      getOptionLabel={(option) => option.description}
                      value={categories.find((c) => c.id === value) || null} // Set the initial value
                      onChange={(_, data) => onChange(data?.id)} // Pass the selected value's code
                      onBlur={onBlur} // Notify when the input is touched
                      disabled={saveTopicLoading || listCategoryLoading}
                      renderInput={(params) => (
                        <TextField
                          {...params}
                          inputRef={ref}
                          placeholder="Chọn 1 danh mục"
                          error={!!error}
                          helperText={error ? "Phải chọn 1 danh mục" : null}
                        />
                      )}
                      renderOption={(props, option) => (
                        <MenuItem
                          {...props}
                          sx={{ marginX: 1, marginTop: 0.5 }}
                          key={option.id}
                        >
                          <Stack direction="column" gap={0.25}>
                            <Typography variant="caption">
                              {option.intentCode}
                            </Typography>
                            <Typography variant="body2">
                              {option.description}
                            </Typography>
                          </Stack>
                        </MenuItem>
                      )}
                    />
                  )}
                />
              </Stack>

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
                  disabled={saveTopicLoading}
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
                  disabled={saveTopicLoading}
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
                  disabled={saveTopicLoading}
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
              disabled={saveTopicLoading}
            >
              Hủy
            </Button>
            {saveTopicLoading ? (
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
      )}
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

export default TopicCreator;

interface CountryType {
  code: string;
  label: string;
  phone: string;
  suggested?: boolean;
}

const countries: readonly CountryType[] = [
  { code: "AD", label: "Andorra", phone: "376" },
  {
    code: "AE",
    label: "United Arab Emirates",
    phone: "971",
  },
];
