import { useAppDispatch } from "@/lib/redux/store";
import { ToastInformation } from "@/lib/types/component";
import { zodResolver } from "@hookform/resolvers/zod";
import { Button, Stack, Typography } from "@mui/material";
import { Plus } from "@phosphor-icons/react";
import { ChangeEvent, useRef, useState } from "react";
import { useForm } from "react-hook-form";
import { z } from "zod";

const subjectCreateSchema = z.object({
    title: z
        .string()
        .min(1, "Không được bỏ trống")
        .max(255, "Không vượt quá 255 ký tự"),
    content: z
        .string()
        .min(1, "Không được bỏ trống")
        .max(10000, "Không vượt quá 10000 kí tự"),
    imageBase64: z.string().nullable().default(null),
});

type SubjectCreateForm = z.infer<typeof subjectCreateSchema>;

const SubjectCreator = () => {
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
    } = useForm<SubjectCreateForm>({
        resolver: zodResolver(subjectCreateSchema),
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

    const handleCreatePost = (data: SubjectCreateForm) => {
        console.log(data);
    };

    const handleOpenFileDialog = () => {
        if (fileInputRef.current) {
            fileInputRef.current.click();
        }
    };

    const handleFileChange = (e: ChangeEvent<HTMLInputElement>) => {
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

    const handleRemoveDemoFile = () => {
        setValue("imageBase64", null);
        if (fileInputRef.current) {
            fileInputRef.current.value = "";
        }
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
                    <Typography variant="button1">Tạo mới</Typography>
                </Stack>
            </Button>
        </>
    );
};

export default SubjectCreator;
