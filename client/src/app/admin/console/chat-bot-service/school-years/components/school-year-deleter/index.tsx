import { useEffect, useState } from "react";

import { Stack, SxProps, Theme, Typography } from "@mui/material";
import { Trash } from "@phosphor-icons/react";

import ConfirmDeleteDialog from "@/lib/components/confirm-delete-dialog";
import CustomToast from "@/lib/components/toast";
import { deleteSchoolYearThunk } from "@/lib/redux/features/chat-bot/school-year/schoolYearActions";
import {
  removeSchoolYearById,
  resetSchoolYearStatus,
} from "@/lib/redux/features/chat-bot/school-year/schoolYearSlice";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import {
  SchoolYearDeleterProps,
  ToastInformation,
} from "@/lib/types/component";

const SchoolYearDeleter = (props: SchoolYearDeleterProps) => {
  const { value } = props;

  // Redux
  const dispatch = useAppDispatch();
  const {
    deleteSchoolYearLoading,
    deleteSchoolYearSuccess,
    deleteSchoolYearError,
  } = useAppSelector((state) => state.schoolYear);

  const [openDeleteDialog, setOpenDeleteDialog] = useState(false);
  const [toastInfo, setToastInfo] = useState<ToastInformation>();
  const [openToast, setOpenToast] = useState<boolean>(false);

  const handleClickOpen = () => setOpenDeleteDialog(true);
  const handleClose = () => setOpenDeleteDialog(false);

  const handleDeleteSchoolYear = () =>
    dispatch(deleteSchoolYearThunk(value.id.toString()));

  useEffect(() => {
    if (deleteSchoolYearSuccess !== null) {
      dispatch(removeSchoolYearById({ schoolYearId: value.id }));
      dispatch(resetSchoolYearStatus({ keys: ["deleteSchoolYearSuccess"] }));
      handleClose();
    } else if (deleteSchoolYearError !== null) {
      setOpenToast(true);
      setToastInfo({
        severity: "error",
        title: "Thất bại",
        message: "Không thể xóa năm học này!",
      });
      handleClose();
      dispatch(resetSchoolYearStatus({ keys: ["deleteSchoolYearError"] }));
    }
  }, [deleteSchoolYearSuccess, deleteSchoolYearError]);

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
        <Typography variant="body2">Xóa</Typography>
      </Stack>

      {openDeleteDialog && (
        <ConfirmDeleteDialog
          open={openDeleteDialog}
          setOpen={setOpenDeleteDialog}
          title="Xóa năm học"
          content="Bạn có chắc chắn muốn xóa năm học này? Bạn không thể xóa nếu có dữ liệu liên kết với năm học này."
          deleteFunc={handleDeleteSchoolYear}
          loading={deleteSchoolYearLoading}
        />
      )}
      {openToast && (
        <CustomToast
          id="school-year-delete-toast"
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

export default SchoolYearDeleter;

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
