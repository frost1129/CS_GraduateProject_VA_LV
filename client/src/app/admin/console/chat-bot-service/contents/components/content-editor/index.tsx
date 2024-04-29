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
  Grid,
  IconButton,
  MenuItem,
  Stack,
  SxProps,
  TextField,
  Theme,
  Typography,
} from "@mui/material";
import { FilePlus, PencilSimple, X } from "@phosphor-icons/react";

import CustomLoadingButton from "@/lib/components/loading-button";
import CustomToast from "@/lib/components/toast";
import { updateContentThunk } from "@/lib/redux/features/chat-bot/content/contentActions";
import {
  resetContentStatus,
  updateContentV2,
} from "@/lib/redux/features/chat-bot/content/contentSlice";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { IUpdateContentRequest } from "@/lib/types/backend";
import { ContentEditorProps, ToastInformation } from "@/lib/types/component";
import { convertMillisecondsToDate } from "@/lib/utils";

const contentEditSchema = z.object({
  topicId: z.number(),
  title: z
    .string()
    .min(1, "Không được bỏ trống")
    .max(255, "Không vượt quá 255 kí tự"),
  text: z
    .string()
    .min(1, "Không được bỏ trống")
    .max(10000, "Không vượt quá 10000 kí tự"),
  note: z.string().nullable(),
  imageLink: z.string().nullable(),
  imageBase64: z.string().nullable().default(null),
});

type ContentEditForm = z.infer<typeof contentEditSchema>;

const ContentEditor = (props: ContentEditorProps) => {
  const { value } = props;

  // Redux
  const dispatch = useAppDispatch();
  const { topics, listTopicLoading, listTopicError } = useAppSelector(
    (state) => state.topic
  );
  const { updateContentLoading, updatedContent, updateContentError } =
    useAppSelector((state) => state.content);

  // React Hook Form
  const {
    register,
    handleSubmit,
    formState,
    reset,
    control,
    setValue,
    watch,
    getValues,
  } = useForm<ContentEditForm>({
    resolver: zodResolver(contentEditSchema),
    mode: "onChange",
  });

  const fileInputRef = useRef<HTMLInputElement>(null);

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

  const handleUpdateContent = (data: ContentEditForm) => {
    const contentData: IUpdateContentRequest = {
      topicId: data.topicId,
      title: data.title,
      text: data.text,
      note: data.note,
      imageBase64:
        data.imageBase64 === data.imageLink ? null : data.imageBase64,
    };
    dispatch(
      updateContentThunk({
        contentId: value.id.toString(),
        content: contentData,
      })
    );
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
    if (updatedContent !== null) {
      setOpenToast(true);
      setToastInfo({
        severity: "success",
        title: "Thành công",
        message: "Chỉnh sửa chủ đề thành công!",
      });

      dispatch(updateContentV2({ content: updatedContent }));
      dispatch(resetContentStatus({ keys: ["updatedContent"] }));
      handleClose();
    } else if (updateContentError !== null) {
      setOpenToast(true);
      setToastInfo({
        severity: "error",
        title: "Thất bại",
        message: updateContentError,
      });

      dispatch(resetContentStatus({ keys: ["updateContentError"] }));
    }
  }, [updatedContent, updateContentError]);

  // Reset input fields
  useEffect(() => {
    reset({ ...value, topicId: value.topic.id, imageBase64: value.imageLink });
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
        <Typography variant="body2">Chỉnh sửa</Typography>
      </Stack>
      {openEditDialog && (
        <Dialog
          id="content-edit-dialog"
          component="form"
          onSubmit={handleSubmit(handleUpdateContent)}
          open={true}
          aria-labelledby="content-edit-dialog-title"
          aria-describedby="content-edit-dialog-description"
          maxWidth={"tablet"}
          fullWidth
        >
          <DialogTitle component="div" id="content-edit-dialog-title">
            <Typography variant="h5">Chỉnh sửa danh mục</Typography>
          </DialogTitle>
          <IconButton
            aria-label="close"
            onClick={handleClose}
            disabled={updateContentLoading}
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
            <Stack direction="column" gap={2} flex={1}>
              {/* Created date & Last modified date field */}
              <Grid container spacing={2}>
                <Grid item oversize={6} desktop={6} tablet={6} mobile={12}>
                  <Stack direction="column" gap={1}>
                    <Typography variant="label3">Ngày tạo</Typography>
                    <TextField
                      disabled
                      value={convertMillisecondsToDate(value.createdDate!)}
                    />
                  </Stack>
                </Grid>
                <Grid item oversize={6} desktop={6} tablet={6} mobile={12}>
                  <Stack direction="column" gap={1}>
                    <Typography variant="label3">Ngày chỉnh sửa</Typography>
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

              {/* Parent content */}
              <Stack direction="row" gap={2}>
                <Stack direction="column" gap={1} flex={1}>
                  <Typography variant="label3">Năm học</Typography>
                  <TextField disabled value={value.schoolYear?.year || "---"} />
                </Stack>
                {value.parentContent !== null && (
                  <Stack direction="column" gap={1} flex={1}>
                    <Typography variant="label3">
                      Kế thừa từ nội dung
                    </Typography>
                    <TextField disabled value={value.parentContent.title} />
                  </Stack>
                )}
              </Stack>

              {/* Topic field */}
              <Stack direction="column" gap={1}>
                <Stack direction="row" gap={0.5}>
                  <Typography variant="label3">Chủ đề</Typography>
                  {value.parentContent === null && (
                    <Box sx={{ color: "var(--alert)" }}>*</Box>
                  )}
                </Stack>
                {value.parentContent === null ? (
                  <Controller
                    name="topicId"
                    control={control}
                    render={({
                      field: {
                        onChange,
                        onBlur,
                        value: autoCompleteValue,
                        ref,
                      },
                      fieldState: { error },
                    }) => (
                      <Autocomplete
                        id="topic-select"
                        options={topics}
                        autoHighlight
                        getOptionLabel={(option) => option.description}
                        value={
                          topics.find((t) => t.id === autoCompleteValue) || null
                        } // Set the initial value
                        onChange={(_, data) => onChange(data?.id)} // Pass the selected value's code
                        onBlur={onBlur} // Notify when the input is touched
                        disabled={
                          updateContentLoading ||
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
                ) : (
                  <TextField disabled value={value.topic.description} />
                )}
              </Stack>

              {/* Intent code field */}
              <Stack direction="column" gap={1}>
                <Typography variant="label3">Chuỗi xác định</Typography>
                <TextField disabled value={value.intentCode} />
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
                  disabled={updateContentLoading}
                  {...register("title")}
                />
              </Stack>

              {/* Text field */}
              <Stack direction="column" gap={1}>
                <Stack direction="row" gap={0.5}>
                  <Typography variant="label3">Mô tả</Typography>
                  <Box sx={{ color: "var(--alert)" }}>*</Box>
                </Stack>
                <TextField
                  multiline
                  rows={3}
                  placeholder="Nhập tiêu đề..."
                  error={!!formState.errors.text}
                  helperText={formState.errors.text?.message}
                  disabled={updateContentLoading}
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
                      disabled={updateContentLoading}
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
                  disabled={updateContentLoading}
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
              disabled={updateContentLoading}
            >
              Hủy
            </Button>
            {updateContentLoading ? (
              <CustomLoadingButton sx={{ height: "42px" }} />
            ) : (
              <Button
                variant="contained"
                color="primary"
                type="submit"
                disabled={!formState.isValid}
              >
                Lưu
              </Button>
            )}
          </DialogActions>
        </Dialog>
      )}
      {openToast && (
        <CustomToast
          id="content-edit-toast"
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

export default ContentEditor;

const btnStyles: SxProps<Theme> = {
  flex: 1,
  padding: "6px 16px",
  alignItems: "center",
  gap: 1,
};

const contentImageAdderStyles: SxProps<Theme> = {
  height: "200px",
  justifyContent: "center",
  alignItems: "center",
  border: "1px dashed var(--primary)",
  borderRadius: 1,
};
