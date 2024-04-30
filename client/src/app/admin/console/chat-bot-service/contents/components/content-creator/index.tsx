"use client";

import { ChangeEvent, useEffect, useRef, useState } from "react";
import { Controller, useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";

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
  SxProps,
  TextField,
  Theme,
  Typography,
} from "@mui/material";
import { FilePlus, Plus, X } from "@phosphor-icons/react";

import CustomLoadingButton from "@/lib/components/loading-button";
import CustomToast from "@/lib/components/toast";
import { addNewContentThunk } from "@/lib/redux/features/chat-bot/content/contentActions";
import {
  appendContentFirst,
  resetContentStatus,
} from "@/lib/redux/features/chat-bot/content/contentSlice";
import { getTopicsThunk } from "@/lib/redux/features/chat-bot/topic/topicActions";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { ISaveContentRequest } from "@/lib/types/backend";
import { ToastInformation } from "@/lib/types/component";
import { getSchoolYearsThunk } from "@/lib/redux/features/chat-bot/school-year/schoolYearActions";

const contentCreateSchema = z.object({
  intentCode: z
    .string()
    .min(1, "Không được bỏ trống")
    .max(255, "Không vượt quá 255 ký tự"),
  title: z
    .string()
    .min(1, "Không được bỏ trống")
    .max(255, "Không vượt quá 255 kí tự"),
  text: z
    .string()
    .min(1, "Không được bỏ trống")
    .max(10000, "Không vượt quá 10000 kí tự"),
  note: z.string().nullable(),
  topicId: z.number(),
  parentContentId: z.number().nullable().default(null),
  schoolYearId: z.number(),
  imageBase64: z.string().nullable().default(null),
});

type ContentCreateForm = z.infer<typeof contentCreateSchema>;

const ContentCreator = () => {
  const dispatch = useAppDispatch();
  const { topics, listTopicLoading, listTopicError } = useAppSelector(
    (state) => state.topic
  );
  const { schoolYearDataResponse, listSchoolYearLoading, listSchoolYearError } =
    useAppSelector((state) => state.schoolYear);
  const { saveContentLoading, savedContent, saveContentError, contentDataResponse } =
    useAppSelector((state) => state.content);

  const {
    register,
    handleSubmit,
    formState,
    reset,
    control,
    watch,
    setValue,
    getValues,
  } = useForm<ContentCreateForm>({
    resolver: zodResolver(contentCreateSchema),
    mode: "onChange",
  });

  const fileInputRef = useRef<HTMLInputElement>(null);

  const [openCreateDialog, setOpenCreateDialog] = useState(false);
  const [toastInfo, setToastInfo] = useState<ToastInformation>();
  const [openToast, setOpenToast] = useState<boolean>(false);

  const handleClickOpen = () => {
    setOpenCreateDialog(true);
  };

  const handleClose = () => {
    if (fileInputRef.current) {
      fileInputRef.current.value = ""; // Reset file input to allow another selection
    }
    reset({});
    setOpenCreateDialog(false);
  };

  const handleCreateContent = (data: ContentCreateForm) => {
    const contentData: ISaveContentRequest = {
      intentCode: data.intentCode,
      title: data.title,
      text: data.text,
      note: data.note,
      imageBase64: data.imageBase64,
      parentContentId: data.parentContentId,
      topicId: data.topicId,
      schoolYearId: data.schoolYearId,
    };
    dispatch(addNewContentThunk(contentData));
    console.log(data);
  };

  const handleOpenFileDialog = () => {
    if (fileInputRef.current) {
      fileInputRef.current.click();
    }
  };

  const handleContentImageChange = (e: ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (file) {
      // Check if the file size exceeds 5MB (5 * 1024 * 1024 bytes)
      if (file.size > 5242880) {
        setToastInfo({
          severity: "error",
          title: "Ảnh quá lớn",
          message: "Kích thước của ảnh phải dưới 5MB",
        });
        setOpenToast(true);
        setValue("imageBase64", null); // Resetting the imageBase64 value if file is too large
        if (fileInputRef.current) {
          fileInputRef.current.value = ""; // Reset file input to allow another selection
        }
        return;
      }

      const reader = new FileReader();
      reader.onload = () => {
        if (typeof reader.result === "string") {
          setValue("imageBase64", reader.result);
        }
      };
      reader.readAsDataURL(file);
    } else {
      setValue("imageBase64", null);
    }
  };

  const handleRemoveDemoContentImage = () => {
    setValue("imageBase64", null);
    if (fileInputRef.current) {
      fileInputRef.current.value = ""; // Reset file input to allow re-selecting the same file if needed
    }
  };

  useEffect(() => {
    if (savedContent !== null) {
      setOpenToast(true);
      setToastInfo({
        severity: "success",
        title: "Thành công",
        message: "Tạo mới chủ đề thành công!",
      });

      dispatch(appendContentFirst({ content: savedContent }));
      dispatch(resetContentStatus({ keys: ["savedContent"] }));
      handleClose();
    } else if (saveContentError !== null) {
      setOpenToast(true);
      setToastInfo({
        severity: "error",
        title: "Thất bại",
        message: saveContentError,
      });

      dispatch(resetContentStatus({ keys: ["saveContentError"] }));
    }
  }, [savedContent, saveContentError]);

  useEffect(() => {
    if (topics.length === 0) dispatch(getTopicsThunk({}));
    if (
      !schoolYearDataResponse ||
      (schoolYearDataResponse && schoolYearDataResponse.data.length === 0)
    )
      dispatch(getSchoolYearsThunk({}));
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
          id="content-create-dialog"
          component="form"
          open={true}
          aria-labelledby="content-create-dialog-title"
          aria-describedby="content-create-dialog-description"
          fullWidth
          maxWidth={"tablet"}
          onSubmit={handleSubmit(handleCreateContent)}
        >
          <DialogTitle component="div" id="content-create-dialog-title">
            <Typography variant="h5">Tạo mới nội dung</Typography>
          </DialogTitle>
          <IconButton
            aria-label="close"
            onClick={handleClose}
            disabled={saveContentLoading}
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
              <Stack direction="row" gap={2} alignItems="flex-start">
                {/* School year field */}
                <Stack direction="column" gap={1} sx={{ width: "40%" }}>
                  <Stack direction="row" gap={0.5}>
                    <Typography variant="label3">Năm học</Typography>
                    <Box sx={{ color: "var(--alert)" }}>*</Box>
                  </Stack>
                  <Controller
                    name="schoolYearId"
                    control={control}
                    render={({
                      field: { onChange, onBlur, value, ref },
                      fieldState: { error },
                    }) => (
                      <Autocomplete
                        id="school-year-select"
                        options={schoolYearDataResponse?.data || []}
                        autoHighlight
                        getOptionLabel={(option) => option.year}
                        value={schoolYearDataResponse?.data.find((y) => y.id === value) || null} // Set the initial value
                        onChange={(_, data) => onChange(data?.id)} // Pass the selected value's code
                        onBlur={onBlur} // Notify when the input is touched
                        disabled={saveContentLoading}
                        renderInput={(params) => (
                          <TextField
                            {...params}
                            inputRef={ref}
                            placeholder="Chọn năm học"
                            error={!!error}
                            helperText={error ? "Phải chọn năm học" : null}
                          />
                        )}
                        renderOption={(props, option) => (
                          <MenuItem
                            {...props}
                            sx={{ marginX: 1, marginTop: 0.5 }}
                            key={option.id}
                          >
                            <Stack direction="column" gap={0.25}>
                              <Typography variant="body2">{option.year}</Typography>
                            </Stack>
                          </MenuItem>
                        )}
                      />
                    )}
                  />
                </Stack>

                {/* Parent content field */}
                <Stack direction="column" gap={1} flex={1}>
                  <Stack direction="row" gap={0.5}>
                    <Typography variant="label3">
                      Kế thừa từ nội dung
                    </Typography>
                  </Stack>
                  <Controller
                    name="parentContentId"
                    control={control}
                    render={({
                      field: { onChange, onBlur, value, ref },
                      fieldState: { error },
                    }) => (
                      <Autocomplete
                        id="parent-content-select"
                        options={contentDataResponse?.data || []}
                        autoHighlight
                        getOptionLabel={(option) => option.title}
                        value={contentDataResponse?.data.find((c) => c.id === value) || null} // Set the initial value
                        onChange={(_, data) => {
                          onChange(data?.id || null);
                          data?.topic.id &&
                            setValue("topicId", Number(data.topic.id));
                        }} // Pass the selected value's code
                        onBlur={onBlur} // Notify when the input is touched
                        disabled={saveContentLoading}
                        renderInput={(params) => (
                          <TextField
                            {...params}
                            inputRef={ref}
                            placeholder="Chọn 1 nội dung kế thừa"
                            error={!!error}
                            helperText={
                              error ? "Phải chọn 1 nội dung kế thừa" : null
                            }
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
                                {option.title}
                              </Typography>
                            </Stack>
                          </MenuItem>
                        )}
                      />
                    )}
                  />
                </Stack>
              </Stack>

              {/* Topic field */}
              {!watch("parentContentId") && (
                <Stack direction="column" gap={1}>
                  <Stack direction="row" gap={0.5}>
                    <Typography variant="label3">Chủ đề</Typography>
                    <Box sx={{ color: "var(--alert)" }}>*</Box>
                  </Stack>
                  <Controller
                    name="topicId"
                    control={control}
                    render={({
                      field: { onChange, onBlur, value, ref },
                      fieldState: { error },
                    }) => (
                      <Autocomplete
                        id="topic-select"
                        options={topics}
                        autoHighlight
                        getOptionLabel={(option) => option.description}
                        value={topics.find((c) => c.id === value) || null} // Set the initial value
                        onChange={(_, data) => {
                          if (watch("parentContentId")) onChange(null);
                          else onChange(data?.id);
                        }} // Pass the selected value's code
                        onBlur={onBlur} // Notify when the input is touched
                        disabled={
                          saveContentLoading ||
                          listTopicLoading ||
                          listTopicError !== null
                        }
                        renderInput={(params) => (
                          <TextField
                            {...params}
                            inputRef={ref}
                            placeholder="Chọn 1 chủ đề"
                            error={!!error}
                            helperText={error ? "Phải chọn 1 chủ đề" : null}
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
              )}

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
                  disabled={saveContentLoading}
                  {...register("intentCode")}
                />
              </Stack>

              {/* Title field */}
              <Stack direction="column" gap={1}>
                <Stack direction="row" gap={0.5}>
                  <Typography variant="label3">Tiêu đề</Typography>
                  <Box sx={{ color: "var(--alert)" }}>*</Box>
                </Stack>
                <TextField
                  multiline
                  rows={3}
                  placeholder="Nhập tiêu đề..."
                  error={!!formState.errors.title}
                  helperText={formState.errors.title?.message}
                  disabled={saveContentLoading}
                  {...register("title")}
                />
              </Stack>

              {/* Text field */}
              <Stack direction="column" gap={1}>
                <Stack direction="row" gap={0.5}>
                  <Typography variant="label3">Nội dung</Typography>
                  <Box sx={{ color: "var(--alert)" }}>*</Box>
                </Stack>
                <TextField
                  multiline
                  rows={3}
                  placeholder="Nhập nội dung..."
                  error={!!formState.errors.text}
                  helperText={formState.errors.text?.message}
                  disabled={saveContentLoading}
                  {...register("text")}
                />
              </Stack>

              {/* Image field (optional) */}
              <>
                {watch("imageBase64") ? (
                  <Stack
                    sx={{
                      height: "300px",
                      overflow: "scroll",
                      position: "relative",
                    }}
                  >
                    <IconButton
                      aria-label="close"
                      onClick={handleRemoveDemoContentImage}
                      sx={{
                        position: "absolute",
                        right: 24,
                        top: 12,
                        padding: 1,
                        zIndex: 99,
                        color: (theme) => theme.palette.grey[800],
                      }}
                    >
                      <X size={24} />
                    </IconButton>
                    <img src={getValues("imageBase64") || ""} alt="demo-img" />
                  </Stack>
                ) : (
                  <Stack
                    direction="column"
                    gap={2}
                    component="button"
                    sx={contentImageAdderStyles}
                    className="reset-btn"
                    onClick={handleOpenFileDialog}
                    type="button"
                  >
                    <Box>
                      <FilePlus size={50} color="var(--primary)" />
                    </Box>
                    <Typography variant="body2">Thêm hình ảnh</Typography>
                  </Stack>
                )}
              </>

              {/* Note field */}
              <Stack direction="column" gap={1}>
                <Typography variant="label3">Ghi chú</Typography>
                <TextField
                  multiline
                  rows={3}
                  placeholder="Nhập ghi chú..."
                  disabled={saveContentLoading}
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
              disabled={saveContentLoading}
            >
              Hủy
            </Button>
            {saveContentLoading ? (
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
          id="content-create-toast"
          open={openToast}
          handleClose={() => setOpenToast(false)}
          title={toastInfo?.title!}
          message={toastInfo?.message!}
          severity={toastInfo?.severity}
        />
      )}

      {/* Hidden input for imageBase64 field to choose file */}
      <input
        type="file"
        hidden={true}
        ref={fileInputRef}
        onChange={handleContentImageChange}
        accept=".png, .jpg, .jpeg"
      />
    </>
  );
};

export default ContentCreator;

const contentImageAdderStyles: SxProps<Theme> = {
  width: "100%",
  height: "200px",
  justifyContent: "center",
  alignItems: "center",
  border: "1px dashed var(--primary)",
  borderRadius: 1,
};
