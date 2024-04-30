"use client";

import { useEffect, useState } from "react";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";

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

import CustomLoadingButton from "@/lib/components/loading-button";
import CustomToast from "@/lib/components/toast";
import { updateSchoolYearThunk } from "@/lib/redux/features/chat-bot/school-year/schoolYearActions";
import {
  resetSchoolYearStatus,
  updateSchoolYear,
} from "@/lib/redux/features/chat-bot/school-year/schoolYearSlice";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { ISchoolYearRequest } from "@/lib/types/backend";
import { SchoolYearEditorProps, ToastInformation } from "@/lib/types/component";
import { convertMillisecondsToDate } from "@/lib/utils";

const schoolYearEditSchema = z.object({
  year: z
    .string()
    .min(1, "Không được bỏ trống")
    .max(4, "Không vượt quá 4 kí tự"),
  courseName: z
    .string()
    .min(1, "Không được bỏ trống")
    .max(255, "Không vượt quá 255 kí tự"),
  note: z.string().nullable().default(null),
});

type SchoolYearEditForm = z.infer<typeof schoolYearEditSchema>;

const SchoolYearEditor = (props: SchoolYearEditorProps) => {
  const { value } = props;

  // Redux
  const dispatch = useAppDispatch();
  const { updateSchoolYearLoading, updatedSchoolYear, updateSchoolYearError } =
    useAppSelector((state) => state.schoolYear);

  // React Hook Form
  const { register, handleSubmit, formState, reset } =
    useForm<SchoolYearEditForm>({
      resolver: zodResolver(schoolYearEditSchema),
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

  const handleUpdateSchoolYear = (data: SchoolYearEditForm) => {
    const schoolYearData: ISchoolYearRequest = {
      year: data.year,
      courseName: data.courseName,
      note: data.note,
    };
    dispatch(
      updateSchoolYearThunk({
        schoolYearId: value.id.toString(),
        schoolYear: schoolYearData,
      })
    );
  };

  useEffect(() => {
    if (updatedSchoolYear !== null) {
      setOpenToast(true);
      setToastInfo({
        severity: "success",
        title: "Thành công",
        message: "Chỉnh sửa năm học thành công!",
      });

      dispatch(updateSchoolYear({ schoolYear: updatedSchoolYear }));
      dispatch(resetSchoolYearStatus({ keys: ["updatedSchoolYear"] }));
      handleClose();
    } else if (updateSchoolYearError !== null) {
      setOpenToast(true);
      setToastInfo({
        severity: "error",
        title: "Thất bại",
        message: updateSchoolYearError,
      });

      dispatch(resetSchoolYearStatus({ keys: ["updateSchoolYearError"] }));
    }
  }, [updatedSchoolYear, updateSchoolYearError]);

  // Reset input fields
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
        <Typography variant="body2">Chỉnh sửa</Typography>
      </Stack>
      {openEditDialog && (
        <Dialog
          id="school-year-edit-dialog"
          component="form"
          onSubmit={handleSubmit(handleUpdateSchoolYear)}
          open={true}
          aria-labelledby="school-year-edit-dialog-title"
          aria-describedby="school-year-edit-dialog-description"
          maxWidth={"tablet"}
          fullWidth
        >
          <DialogTitle component="div" id="school-year-edit-dialog-title">
            <Typography variant="h5">Chỉnh sửa danh mục</Typography>
          </DialogTitle>
          <IconButton
            aria-label="close"
            onClick={handleClose}
            disabled={updateSchoolYearLoading}
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

              {/* Year field */}
              <Stack direction="column" gap={1}>
                <Stack direction="row" gap={0.5}>
                  <Typography variant="label3">Tên năm học</Typography>
                  <Box sx={{ color: "var(--alert)" }}>*</Box>
                </Stack>
                <TextField
                  placeholder="Nhập tên năm học..."
                  error={!!formState.errors.year}
                  helperText={formState.errors.year?.message}
                  disabled={updateSchoolYearLoading}
                  {...register("year")}
                />
              </Stack>

              {/* Course name field */}
              <Stack direction="column" gap={1}>
                <Stack direction="row" gap={0.5}>
                  <Typography variant="label3">Tên khóa học</Typography>
                  <Box sx={{ color: "var(--alert)" }}>*</Box>
                </Stack>
                <TextField
                  multiline
                  rows={3}
                  placeholder="Nhập tên khóa học..."
                  error={!!formState.errors.courseName}
                  helperText={formState.errors.courseName?.message}
                  disabled={updateSchoolYearLoading}
                  {...register("courseName")}
                />
              </Stack>

              {/* Note field */}
              <Stack direction="column" gap={1}>
                <Typography variant="label3">Ghi chú</Typography>
                <TextField
                  multiline
                  rows={3}
                  placeholder="Nhập ghi chú..."
                  disabled={updateSchoolYearLoading}
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
              disabled={updateSchoolYearLoading}
            >
              Hủy
            </Button>
            {updateSchoolYearLoading ? (
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
          id="school-year-edit-toast"
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

export default SchoolYearEditor;

const btnStyles: SxProps<Theme> = {
  flex: 1,
  padding: "6px 16px",
  alignItems: "center",
  gap: 1,
};
