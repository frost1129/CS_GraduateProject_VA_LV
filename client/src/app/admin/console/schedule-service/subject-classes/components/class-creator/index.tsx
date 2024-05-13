import CustomLoadingButton from "@/lib/components/loading-button";
import CustomToast from "@/lib/components/toast";
import { getSubjectClassesThunk, uploadSubjectClassThunk } from "@/lib/redux/features/schedule/subject-class/subjectClassActions";
import { resetSubjectClassStatus } from "@/lib/redux/features/schedule/subject-class/subjectClassSlice";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { IUploadFormData, IYearCodeDTO } from "@/lib/types/backend-schedule";
import { ToastInformation } from "@/lib/types/component";
import { zodResolver } from "@hookform/resolvers/zod";
import { Box, Button, Dialog, DialogActions, DialogContent, DialogTitle, IconButton, Stack, SxProps, TextField, Theme, Typography, styled } from "@mui/material";
import { CloudArrowUp, FilePlus, Plus, UploadSimple, X } from "@phosphor-icons/react";
import { ChangeEvent, useEffect, useRef, useState } from "react";
import { useForm } from "react-hook-form";
import { z } from "zod";

const requestCreateSchema = z.object({
    file: z.string().refine((file) => file.endsWith('.csv'), {
        message: "Chỉ được chọn file CSV",
    }),
});

type ClassCreateForm = z.infer<typeof requestCreateSchema>;

const ClassCreator = ({ selectedYearCode }: { selectedYearCode: IYearCodeDTO | null }) => {
    const dispatch = useAppDispatch();

    const { uploadedSubjectClass, uploadSubjectClassLoading, uploadSubjectClassError } = 
        useAppSelector((state) => state.subjectClass);

    const {
        register,
        handleSubmit,
        formState,
        reset,
        setValue,
        getValues,
        watch,
    } = useForm<ClassCreateForm>({
        resolver: zodResolver(requestCreateSchema),
        mode: "onChange",
    });

    const fileInputRef = useRef<HTMLInputElement>(null);

    const [openCreateDialog, setOpenCreateDialog] = useState(false);
    const [toastInfo, setToastInfo] = useState<ToastInformation>();
    const [openToast, setOpenToast] = useState<boolean>(false);
    const [selectedFile, setSelectedFile] = useState<string>("");
    const [saveFile, setSaveFile] = useState<File>();

    const handleClickOpen = () => {
        setOpenCreateDialog(true);
    };

    const handleClose = () => {
        reset({});
        setOpenCreateDialog(false);
    };

    const handleCreateRequest = () => {
        if (saveFile) {
            const requestData: IUploadFormData = {
                year: selectedYearCode?.yearCode,
                file: saveFile,
            };
            console.log(requestData);
            dispatch(uploadSubjectClassThunk(requestData));
        }
    };

    const handleFileChange = (e: ChangeEvent<HTMLInputElement>) => {
        const file = e.target.files?.[0];

        if (file) {
            // Check for .csv extension
            if (!file.name.endsWith('.csv')) {
                    setToastInfo({
                    severity: "error",
                    title: "File không đúng định dạng",
                    message: "Hãy chọn file csv",
                });
                setOpenToast(true);
                return;
            }

            // Check if the file size exceeds 5MB (5 * 1024 * 1024 bytes)
            if (file.size > 5242880) {
                setToastInfo({
                    severity: "error",
                    title: "File quá lớn",
                    message: "Kích thước của file phải dưới 5MB",
                });
                setOpenToast(true);
                return;
            }

            const reader = new FileReader();
            reader.onload = () => {
                if (typeof reader.result === "string") {
                    setValue("file", reader.result);
                    setSelectedFile(file.name);
                }
            };
            reader.readAsDataURL(file);
            setSaveFile(file);
        }
    };

    const handleRemoveDemoFile = () => {
        setValue("file", "");
        setSelectedFile("");
        if (fileInputRef.current) {
            fileInputRef.current.value = "";
        }
    };

    useEffect(() => {
        if (uploadedSubjectClass.length > 0) {
            setOpenToast(true);
            setToastInfo({
                severity: "success",
                title: "Thành công",
                message: "Tải lên lịch học mới thành công!",
            });

            if (selectedYearCode !== null) {
                const initialSearchParams = { 
                    page: 1,
                    yearCode: selectedYearCode.yearCode, 
                };
                dispatch(getSubjectClassesThunk(initialSearchParams));
            }
            handleClose();
        } else if (uploadSubjectClassError !== null) {
            setOpenToast(true);
            setToastInfo({
                severity: "error",
                title: "Thất bại",
                message: uploadSubjectClassError,
            });
        }
        dispatch(resetSubjectClassStatus({ keys: ["uploadSubjectClassError"] }));
    }, [uploadedSubjectClass, uploadSubjectClassError]);

    return (
        <>
            <Button
                variant="contained"
                color="primary"
                onClick={handleClickOpen}
                fullWidth
                disabled={selectedYearCode === null}
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
                    onSubmit={handleSubmit(handleCreateRequest)}
                >
                    <DialogTitle
                        component="div"
                        id="content-create-dialog-title"
                    >
                        <Typography variant="h5">Upload thông tin lớp môn học</Typography>
                    </DialogTitle>
                    <IconButton
                        aria-label="close"
                        onClick={handleClose}
                        disabled={uploadSubjectClassLoading}
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

                            {/* file field */}
                            <>
                                {watch("file") ? (
                                    <Stack
                                        sx={{
                                            height: "300px",
                                            overflow: "scroll",
                                            position: "relative",
                                        }}
                                    >
                                        <Stack direction="row" gap={0.5}>
                                            <Typography variant="label3">
                                                Uploaded Filename: 
                                            </Typography>
                                            <Box sx={{ color: "var(--alert)" }}>*</Box>
                                        </Stack>
                                        <TextField
                                            defaultValue={selectedFile}
                                            disabled={true}
                                        />
                                        <IconButton
                                            aria-label="close"
                                            onClick={
                                                handleRemoveDemoFile
                                            }
                                            sx={{
                                                position: "absolute",
                                                right: 24,
                                                zIndex: 99,
                                                color: (theme) =>
                                                    theme.palette.grey[800],
                                            }}
                                        >
                                            <X size={24} />
                                        </IconButton>
                                    </Stack>
                                ) : (
                                    <Stack
                                    direction="column"
                                    gap={2}
                                    component="button"
                                    sx={contentImageAdderStyles}
                                    className="reset-btn"
                                    type="button"
                                    >
                                        <Button
                                            component="label"
                                            role={undefined}
                                            variant="contained"
                                            tabIndex={-1}
                                            startIcon={<FilePlus />}
                                        >
                                            <Typography variant="body2">
                                                Upload file
                                            </Typography>
                                            <VisuallyHiddenInput onChange={handleFileChange} type="file" />
                                        </Button>
                                    </Stack>
                                )}
                            </>
                        </Stack>
                    </DialogContent>

                    <DialogActions sx={{ paddingX: 3, paddingBottom: 2 }}>
                        <Button
                            variant="outlined"
                            color="secondary"
                            onClick={handleClose}
                            disabled={uploadSubjectClassLoading}
                        >
                            Hủy
                        </Button>
                        {uploadSubjectClassLoading ? (
                            <CustomLoadingButton sx={{ height: "42px" }} />
                        ) : (
                            <Button
                                variant="contained"
                                color="primary"
                                type="submit"
                                onClick={handleCreateRequest}
                                // disabled={!formState.isValid}
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

export default ClassCreator;

const contentImageAdderStyles: SxProps<Theme> = {
    width: "100%",
    height: "200px",
    justifyContent: "center",
    alignItems: "center",
    border: "1px dashed var(--primary)",
    borderRadius: 1,
};

const VisuallyHiddenInput = styled("input")({
    clip: "rect(0 0 0 0)",
    clipPath: "inset(50%)",
    height: 1,
    overflow: "hidden",
    position: "absolute",
    bottom: 0,
    left: 0,
    whiteSpace: "nowrap",
    width: 1,
});
