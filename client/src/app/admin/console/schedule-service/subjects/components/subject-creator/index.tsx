import CustomLoadingButton from "@/lib/components/loading-button";
import CustomToast from "@/lib/components/toast";
import { appendSubjectClassFirst } from "@/lib/redux/features/schedule/subject-class/subjectClassSlice";
import {
    addSubjectThunk,
    getSubjectsThunk,
} from "@/lib/redux/features/schedule/subject/subjectActions";
import { resetSubjectStatus } from "@/lib/redux/features/schedule/subject/subjectSlice";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { ISubjectSaveDTO } from "@/lib/types/backend-schedule";
import { ToastInformation } from "@/lib/types/component";
import { zodResolver } from "@hookform/resolvers/zod";
import { Box, Button, Dialog, DialogActions, DialogContent, DialogTitle, IconButton, Stack, TextField, Typography } from "@mui/material";
import { Plus, X } from "@phosphor-icons/react";
import { useEffect, useState } from "react";
import { useForm } from "react-hook-form";
import { z } from "zod";

const subjectCreateSchema = z.object({
    subjectCode: z
        .string()
        .min(1, "Không được bỏ trống")
        .max(8, "Không vượt quá 8 ký tự"),
    subjectName: z
        .string()
        .min(1, "Không được bỏ trống")
        .max(10000, "Không vượt quá 10000 kí tự"),
    credits: z.string(),
    note: z.string().nullable(),
});

type SubjectCreateForm = z.infer<typeof subjectCreateSchema>;

const SubjectCreator = () => {
    const dispatch = useAppDispatch();
    const { savedSubject, saveSubjectLoading, saveSubjectError } =
        useAppSelector((state) => state.subject);

    const {
        register,
        handleSubmit,
        formState,
        reset,
    } = useForm<SubjectCreateForm>({
        resolver: zodResolver(subjectCreateSchema),
        mode: "onChange",
    });

    const [openCreateDialog, setOpenCreateDialog] = useState(false);
    const [toastInfo, setToastInfo] = useState<ToastInformation>();
    const [openToast, setOpenToast] = useState<boolean>(false);

    const handleClickOpen = () => {
        setOpenCreateDialog(true);
    };

    const handleClose = () => {
        reset({});
        setOpenCreateDialog(false);
        dispatch(getSubjectsThunk({}));
    };

    const handleCreateSubject = (data: SubjectCreateForm) => {
        const subjectData: ISubjectSaveDTO = {
            subjectCode: data.subjectCode,
            subjectName: data.subjectName,
            credits: parseFloat(data.credits),
            note: data.note,
        };
        dispatch(addSubjectThunk(subjectData));
    };

    const handlePageChange = (_: React.ChangeEvent<unknown>, value: number) => {
        dispatch(getSubjectsThunk({ page: value }));
    };

    useEffect(() => {
        if (savedSubject !== null) {
            setOpenToast(true);
            setToastInfo({
                severity: "success",
                title: "Thành công",
                message: "Tạo môn học mới thành công!",
            });

            dispatch(appendSubjectClassFirst({ subject: savedSubject }));
            dispatch(resetSubjectStatus({ keys: ["savedSubject"] }));
            handleClose();
        } else if (saveSubjectError !== null) {
            setOpenToast(true);
            setToastInfo({
                severity: "error",
                title: "Thất bại",
                message: saveSubjectError,
            });

            dispatch(resetSubjectStatus({ keys: ["saveSubjectError"] }));
        }
    }, [savedSubject, saveSubjectError]);

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
                    onSubmit={handleSubmit(handleCreateSubject)}
                >
                    <DialogTitle
                        component="div"
                        id="content-create-dialog-title"
                    >
                        <Typography variant="h5">Tạo mới nội dung</Typography>
                    </DialogTitle>
                    <IconButton
                        aria-label="close"
                        onClick={handleClose}
                        disabled={saveSubjectLoading}
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
                            {/* subjectCode field */}
                            <Stack direction="column" gap={1}>
                                <Stack direction="row" gap={0.5}>
                                    <Typography variant="label3">
                                        Mã môn học
                                    </Typography>
                                    <Box sx={{ color: "var(--alert)" }}>*</Box>
                                </Stack>
                                <TextField
                                    placeholder="Nhập mã môn học..."
                                    error={!!formState.errors.subjectCode}
                                    helperText={
                                        formState.errors.subjectCode?.message
                                    }
                                    disabled={saveSubjectLoading}
                                    {...register("subjectCode")}
                                />
                            </Stack>

                            {/* subjectName field */}
                            <Stack direction="column" gap={1}>
                                <Stack direction="row" gap={0.5}>
                                    <Typography variant="label3">
                                        Tên môn học
                                    </Typography>
                                    <Box sx={{ color: "var(--alert)" }}>*</Box>
                                </Stack>
                                <TextField
                                    placeholder="Nhập tên môn học..."
                                    error={!!formState.errors.subjectName}
                                    helperText={formState.errors.subjectName?.message}
                                    disabled={saveSubjectLoading}
                                    {...register("subjectName")}
                                />
                            </Stack>

                            {/* credits field */}
                            <Stack direction="column" gap={1}>
                                <Stack direction="row" gap={0.5}>
                                    <Typography variant="label3">
                                        Số tín chỉ
                                    </Typography>
                                    <Box sx={{ color: "var(--alert)" }}>*</Box>
                                </Stack>
                                <TextField
                                    inputProps={{ type: 'number'}}
                                    placeholder="Số tín chỉ..."
                                    error={!!formState.errors.credits}
                                    helperText={formState.errors.credits?.message}
                                    disabled={saveSubjectLoading}
                                    {...register("credits")}
                                />
                            </Stack>


                            {/* Note field */}
                            <Stack direction="column" gap={1}>
                                <Typography variant="label3">
                                    Ghi chú
                                </Typography>
                                <TextField
                                    multiline
                                    rows={3}
                                    placeholder="Nhập ghi chú..."
                                    disabled={saveSubjectLoading}
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
                            disabled={saveSubjectLoading}
                        >
                            Hủy
                        </Button>
                        {saveSubjectLoading ? (
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
        </>
    );
};

export default SubjectCreator;
