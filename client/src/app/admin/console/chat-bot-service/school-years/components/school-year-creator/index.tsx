"use client";

import { useEffect, useState } from "react";
import { useForm } from "react-hook-form";
import { z } from "zod";
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

import { ToastInformation } from "@/lib/types/component";
import { ISchoolYearRequest } from "@/lib/types/backend";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { addNewSchoolYearThunk } from "@/lib/redux/features/chat-bot/school-year/schoolYearActions";
import {
  appendSchoolYearFirst,
  resetSchoolYearStatus,
} from "@/lib/redux/features/chat-bot/school-year/schoolYearSlice";
import CustomLoadingButton from "@/lib/components/loading-button";
import CustomToast from "@/lib/components/toast";

const schoolYearCreateSchema = z.object({
  year: z
    .string()
    .min(1, "Không được bỏ trống")
    .max(4, "Không vượt quá 4 ký tự"),
  courseName: z
    .string()
    .min(1, "Không được bỏ trống")
    .max(255, "Không vượt quá 255 kí tự"),
  note: z.string().nullable().default(null),
});

type SchoolYearCreateForm = z.infer<typeof schoolYearCreateSchema>;

const SchoolYearCreator = () => {
  const dispatch = useAppDispatch();
  const { saveSchoolYearLoading, savedSchoolYear, saveSchoolYearError } =
    useAppSelector((state) => state.schoolYear);

  const { register, handleSubmit, formState, reset, control } =
    useForm<SchoolYearCreateForm>({
      resolver: zodResolver(schoolYearCreateSchema),
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

  const handleCreateSchoolYear = (data: SchoolYearCreateForm) => {
    const schoolYearData: ISchoolYearRequest = {
      year: data.year,
      courseName: data.courseName,
      note: data.note,
    };
    dispatch(addNewSchoolYearThunk(schoolYearData));
  };

  useEffect(() => {
    if (savedSchoolYear !== null) {
      setOpenToast(true);
      setToastInfo({
        severity: "success",
        title: "Thành công",
        message: "Tạo mới năm học thành công!",
      });

      dispatch(appendSchoolYearFirst({ schoolYear: savedSchoolYear }));
      dispatch(resetSchoolYearStatus({ keys: ["savedSchoolYear"] }));
      handleClose();
    } else if (saveSchoolYearError !== null) {
      setOpenToast(true);
      setToastInfo({
        severity: "error",
        title: "Thất bại",
        message: saveSchoolYearError,
      });

      dispatch(resetSchoolYearStatus({ keys: ["saveSchoolYearError"] }));
    }
  }, [savedSchoolYear, saveSchoolYearError]);

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
          onSubmit={handleSubmit(handleCreateSchoolYear)}
        >
          <DialogTitle component="div" id="category-create-dialog-title">
            <Typography variant="h5">Tạo mới năm học</Typography>
          </DialogTitle>
          <IconButton
            aria-label="close"
            onClick={handleClose}
            disabled={saveSchoolYearLoading}
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
              {/* Year field */}
              <Stack direction="column" gap={1}>
                <Stack direction="row" gap={0.5}>
                  <Typography variant="label3">Tên năm học</Typography>
                  <Box sx={{ color: "var(--alert)" }}>*</Box>
                </Stack>
                <TextField
                  type="number"
                  placeholder="Nhập tên năm học..."
                  error={!!formState.errors.year}
                  helperText={formState.errors.year?.message}
                  disabled={saveSchoolYearLoading}
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
                  disabled={saveSchoolYearLoading}
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
                  disabled={saveSchoolYearLoading}
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
              disabled={saveSchoolYearLoading}
            >
              Hủy
            </Button>
            {saveSchoolYearLoading ? (
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
          id="school-year-create-toast"
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

export default SchoolYearCreator;
