"use client";

import { ToastInformation } from "@/lib/types/component";
import { Stack, SxProps, Theme, Typography } from "@mui/material";
import { PencilSimple } from "@phosphor-icons/react";
import { useState } from "react";

const ExamEditor = () => {
    const [openEditDialog, setOpenEditDialog] = useState(false);
    const [toastInfo, setToastInfo] = useState<ToastInformation>();
    const [openToast, setOpenToast] = useState<boolean>(false);

    const handleClickOpen = () => {
        setOpenEditDialog(true);
    };

    const handleClose = () => {
        setOpenEditDialog(false);
        // reset({ ...value });
    };

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
        </>
    );
};

export default ExamEditor;

const btnStyles: SxProps<Theme> = {
    flex: 1,
    padding: "6px 16px",
    alignItems: "center",
    gap: 1,
};
