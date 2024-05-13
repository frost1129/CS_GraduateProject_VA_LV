import CustomLoadingButton from "@/lib/components/loading-button";
import CustomToast from "@/lib/components/toast";
import { generateExamScheduleThunk, getYearCodeExamTimeTableThunk, saveExamScheduleThunk } from "@/lib/redux/features/schedule/exam/examActions";
import { resetExamScheduleStatus } from "@/lib/redux/features/schedule/exam/examSlice";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { DNA, IExamScheduleRequest, IYearCodeDTO, LocalDate } from "@/lib/types/backend-schedule";
import { ToastInformation } from "@/lib/types/component";
import { zodResolver } from "@hookform/resolvers/zod";
import { Box, Button, Dialog, DialogActions, DialogContent, DialogTitle, IconButton, Stack, TextField, Typography } from "@mui/material";
import { FloppyDisk, Plus, X } from "@phosphor-icons/react";
import { ChangeEvent, useEffect, useRef, useState } from "react";
import { useForm } from "react-hook-form";
import { z } from "zod";

// Convert a date string (YYYY-MM-DD) to a LocalDate object
function stringToLocalDate(dateString: string): LocalDate {
    const [year, month, day] = dateString.split('-').map(Number);
    const newDateString = `${day.toString().padStart(2, '0')}-${month.toString().padStart(2, '0')}-${year}`
    const newLocalDate: LocalDate = {
        day: day,
        month: month,
        year: year,
        dateString: newDateString,
    }
    return newLocalDate;
}

const examCreateSchema = z.object({
    date: z.string().min(1, "Không được bỏ trống"),
    length: z.string().min(1, "Không được bỏ trống"),
    size: z.string().min(1, "Không được bỏ trống"),
    multationRate: z.string().min(1, "Không được bỏ trống"), 
    minFitness: z.string().min(1, "Không được bỏ trống"),
});

type ExamCreateForm = z.infer<typeof examCreateSchema>;

const ExamCreator = ({ selectedYearCode }: { selectedYearCode: IYearCodeDTO | null }) => {
    const dispatch = useAppDispatch();

    const { examSchedules, generateExamScheduleLoading, generateExamScheduleError } = 
        useAppSelector((state) => state.exam);

    const { savedExamSchedule, saveExamScheduleLoading, saveExamScheduleError} = 
        useAppSelector((state) => state.exam);

    const { yearCodeExams } = useAppSelector((state) => state.exam);

    const {
        register,
        handleSubmit,
        formState,
        reset,
    } = useForm<ExamCreateForm>({
        resolver: zodResolver(examCreateSchema),
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
    };

    const handleCreateSchedule = (data: ExamCreateForm) => {
        const requestData: IExamScheduleRequest = {
            yearCode: selectedYearCode!.yearCode, 
            date: stringToLocalDate(data.date).dateString,
            length: parseInt(data.length),
            size: parseInt(data.size), 
            mutationRate: parseFloat(data.multationRate)/100,
            minFitness: parseInt(data.minFitness),
        };
        dispatch(generateExamScheduleThunk(requestData));
    };

    const handleSaveSchedule = () => {
        if (examSchedules) {
            dispatch(saveExamScheduleThunk(examSchedules));
        }
    }

    useEffect(() => {
        if (examSchedules !== null) {
            setOpenToast(true);
            setToastInfo({
                severity: "success",
                title: "Thành công",
                message: "Khởi tạo lịch thi mới thành công!",
            });

            handleClose();
        } else if (generateExamScheduleError !== null) {
            setOpenToast(true);
            setToastInfo({
                severity: "error",
                title: "Thất bại",
                message: generateExamScheduleError,
            });

            dispatch(resetExamScheduleStatus({ keys: ["generateExamScheduleError"] }));
        }
    }, [examSchedules, generateExamScheduleError]);

    useEffect(() => {
        if (savedExamSchedule.length > 0) {
            setOpenToast(true);
            setToastInfo({
                severity: "success",
                title: "Thành công",
                message: "Lưu lịch thi mới thành công!",
            });

            if (selectedYearCode)
                dispatch(getYearCodeExamTimeTableThunk(selectedYearCode.yearCode));
            dispatch(resetExamScheduleStatus({ keys: ["examSchedules", "savedExamSchedule"] }));
        } else if (saveExamScheduleError !== null) {
            setOpenToast(true);
            setToastInfo({
                severity: "error",
                title: "Thất bại",
                message: saveExamScheduleError,
            });

            dispatch(resetExamScheduleStatus({ keys: ["saveExamScheduleError"] }));
        }
    }, [savedExamSchedule, saveExamScheduleError]);

    return (
        <>
            {examSchedules === null && (
                <Button
                    variant="contained"
                    color="primary"
                    onClick={handleClickOpen}
                    disabled={selectedYearCode === null && yearCodeExams.length > 0}
                    fullWidth
                >
                    <Stack direction="row" gap={1} alignItems="center">
                        <Plus size={20} />
                        <Typography variant="button1">Tạo lịch thi</Typography>
                    </Stack>
                </Button>
            )}
            {examSchedules && (
                <Button
                    variant="contained"
                    color="info"
                    disabled={saveExamScheduleLoading}
                    onClick={handleSaveSchedule}
                    fullWidth
                >
                    <Stack direction="row" gap={1} alignItems="center">
                        <FloppyDisk size={20} />
                        <Typography variant="button1">Lưu lịch thi</Typography>
                    </Stack>
                </Button>
            )}
            {openCreateDialog && (
                <Dialog
                    id="content-create-dialog"
                    component="form"
                    open={true}
                    aria-labelledby="content-create-dialog-title"
                    aria-describedby="content-create-dialog-description"
                    fullWidth
                    maxWidth={"tablet"}
                    onSubmit={handleSubmit(handleCreateSchedule)}
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
                        disabled={generateExamScheduleLoading}
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
                            {/* yearCode field */}
                            <Stack direction="column" gap={1}>
                                <Stack direction="row" gap={0.5}>
                                    <Typography variant="label3">
                                        Học kỳ
                                    </Typography>
                                    <Box sx={{ color: "var(--alert)" }}>*</Box>
                                </Stack>
                                <TextField
                                    defaultValue={selectedYearCode!.yearCode}
                                    disabled={true}
                                />
                            </Stack>

                            {/* date field */}
                            <Stack direction="column" gap={1}>
                                <Stack direction="row" gap={0.5}>
                                    <Typography variant="label3">
                                        Ngày bắt đầu thi
                                    </Typography>
                                    <Box sx={{ color: "var(--alert)" }}>*</Box>
                                </Stack>
                                <TextField
                                    placeholder="Ngày bắt đầu thi..."
                                    type="date"
                                    error={!!formState.errors.date}
                                    helperText={formState.errors.date?.message}
                                    disabled={generateExamScheduleLoading}
                                    {...register("date")}
                                />
                            </Stack>

                            {/* length field */}
                            <Stack direction="column" gap={1}>
                                <Stack direction="row" gap={0.5}>
                                    <Typography variant="label3">
                                        Số ngày thi
                                    </Typography>
                                    <Box sx={{ color: "var(--alert)" }}>*</Box>
                                </Stack>
                                <TextField
                                    placeholder="Số ngày thi..."
                                    type="number"
                                    error={!!formState.errors.length}
                                    helperText={
                                        formState.errors.length?.message
                                    }
                                    disabled={generateExamScheduleLoading}
                                    {...register("length")}
                                />
                            </Stack>

                            {/* size field */}
                            <Stack direction="column" gap={1}>
                                <Stack direction="row" gap={0.5}>
                                    <Typography variant="label3">
                                        Kích thước quần thể
                                    </Typography>
                                    <Box sx={{ color: "var(--alert)" }}>*</Box>
                                </Stack>
                                <TextField
                                    placeholder="Kích thước quần thể..."
                                    type="number"
                                    error={!!formState.errors.size}
                                    helperText={formState.errors.size?.message}
                                    disabled={generateExamScheduleLoading}
                                    {...register("size")}
                                />
                            </Stack>

                            {/* multationRate field */}
                            <Stack direction="column" gap={1}>
                                <Stack direction="row" gap={0.5}>
                                    <Typography variant="label3">
                                        Tỉ lệ đột biến (%)
                                    </Typography>
                                    <Box sx={{ color: "var(--alert)" }}>*</Box>
                                </Stack>
                                <TextField
                                    type="number"
                                    placeholder="Tỉ lệ đột biến..."
                                    error={!!formState.errors.multationRate}
                                    helperText={
                                        formState.errors.multationRate?.message
                                    }
                                    disabled={generateExamScheduleLoading}
                                    {...register("multationRate")}
                                />
                            </Stack>

                            {/* minFitness field */}
                            <Stack direction="column" gap={1}>
                                <Stack direction="row" gap={0.5}>
                                    <Typography variant="label3">
                                        Điểm phù hợp tối thiểu
                                    </Typography>
                                    <Box sx={{ color: "var(--alert)" }}>*</Box>
                                </Stack>
                                <TextField
                                    type="number"
                                    placeholder="Điểm phù hợp tối thiểu (tốt nhất là 0)..."
                                    error={!!formState.errors.minFitness}
                                    helperText={
                                        formState.errors.minFitness?.message
                                    }
                                    disabled={generateExamScheduleLoading}
                                    {...register("minFitness")}
                                />
                            </Stack>
                        </Stack>
                    </DialogContent>

                    <DialogActions sx={{ paddingX: 3, paddingBottom: 2 }}>
                        <Button
                            variant="outlined"
                            color="secondary"
                            onClick={handleClose}
                            disabled={generateExamScheduleLoading}
                        >
                            Hủy
                        </Button>
                        {generateExamScheduleLoading ? (
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

export default ExamCreator;
