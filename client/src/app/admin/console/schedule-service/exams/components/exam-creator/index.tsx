import { useAppDispatch } from "@/lib/redux/store";
import { ToastInformation } from "@/lib/types/component";
import { zodResolver } from "@hookform/resolvers/zod";
import { Button, Stack, Typography } from "@mui/material";
import { Plus } from "@phosphor-icons/react";
import { ChangeEvent, useRef, useState } from "react";
import { useForm } from "react-hook-form";
import { z } from "zod";

const examCreateSchema = z.object({
    yearCode: z
        .string()
        .min(1, "Không được bỏ trống")
        .max(255, "Không vượt quá 255 ký tự"),
    date: z
        .string()
        .min(1, "Không được bỏ trống")
        .max(10000, "Không vượt quá 10000 kí tự"),
    length: z.string().min(1, "Không được bỏ trống"),
    size: z.string().min(1, "Không được bỏ trống"),
    multationRate: z.string().min(1, "Không được bỏ trống"), 
    minFitness: z.string().min(1, "Không được bỏ trống"),
});

type ExamCreateForm = z.infer<typeof examCreateSchema>;

const ExamCreator = () => {
    const dispatch = useAppDispatch();

    const {
        register,
        handleSubmit,
        formState,
        reset,
        control,
        watch,
        setValue,
        getValues,
    } = useForm<ExamCreateForm>({
        resolver: zodResolver(examCreateSchema),
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

    const handleCreateSchedule = (data: ExamCreateForm) => {
        console.log(data);
    };

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
                    <Typography variant="button1">Tạo lịch thi</Typography>
                </Stack>
            </Button>
        </>
    );
};

export default ExamCreator;
