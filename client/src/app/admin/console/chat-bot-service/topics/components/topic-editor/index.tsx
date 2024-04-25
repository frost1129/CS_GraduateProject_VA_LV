"use client";

import { useState } from "react";
import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from "react-hook-form";
import { z } from "zod";

import { Stack, SxProps, Theme, Typography } from "@mui/material";
import { PencilSimple } from "@phosphor-icons/react";

import { TopicEditorProps } from "@/lib/types/component";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";

const topicEditSchema = z.object({
  description: z.string().min(1, "Không được bỏ trống"),
  note: z.string().nullable(),
});

type TopicEditForm = z.infer<typeof topicEditSchema>;

const TopicEditor = (props: TopicEditorProps) => {
  const { value } = props;

  // Redux
  const dispatch = useAppDispatch();
  const { updateCategoryLoading, updatedCategory, updateCategoryError } =
    useAppSelector((state) => state.category);

  // React Hook Form
  const { register, handleSubmit, formState, reset } = useForm<TopicEditForm>({
    resolver: zodResolver(topicEditSchema),
    mode: "onChange",
  });

  const [openEditDialog, setOpenEditDialog] = useState(false);

  const handleClickOpen = () => {
    setOpenEditDialog(true);
  };

  const handleClose = () => {
    setOpenEditDialog(false);
    reset({ ...value });
  };
  return (
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
  );
};

export default TopicEditor;

const btnStyles: SxProps<Theme> = {
  flex: 1,
  padding: "6px 16px",
  alignItems: "center",
  gap: 1,
};
