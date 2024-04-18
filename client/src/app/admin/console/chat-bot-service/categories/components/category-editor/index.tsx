"use client";

import { useEffect, useState } from "react";
import { z } from "zod";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";

import {
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

import { CategoryEditorProps } from "@/lib/types/component";
import { convertMillisecondsToDate } from "@/lib/utils";

const categoryEditSchema = z.object({
  description: z.string().min(1, "Not be empty"),
  note: z.string().nullable(),
});

type CategoryEditForm = z.infer<typeof categoryEditSchema>;

const CategoryEditor = (props: CategoryEditorProps) => {
  const { register, handleSubmit, formState, getValues, reset } =
    useForm<CategoryEditForm>({
      resolver: zodResolver(categoryEditSchema),
      mode: "onChange",
    });

  const { value } = props;

  const [openEditDialog, setOpenEditDialog] = useState(false);

  const handleClickOpen = () => {
    setOpenEditDialog(true);
  };
  const handleClose = () => {
    setOpenEditDialog(false);
  };

  useEffect(() => {
    reset({ ...value });
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
        <Typography variant="body2">Edit</Typography>
      </Stack>
      <Dialog
        open={openEditDialog}
        onClose={handleClose}
        aria-labelledby="category-edit-dialog-title"
        aria-describedby="category-edit-dialog-description"
        maxWidth={"tablet"}
      >
        <DialogTitle component="div" id="category-edit-dialog-title">
          <Typography variant="h5">Edit Category</Typography>
        </DialogTitle>
        <IconButton
          aria-label="close"
          onClick={handleClose}
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
                  <Typography variant="label3">Created date</Typography>
                  <TextField
                    disabled
                    value={convertMillisecondsToDate(value.createdDate!)}
                  />
                </Stack>
              </Grid>
              <Grid item oversize={6} desktop={6} tablet={6} mobile={12}>
                <Stack direction="column" gap={1}>
                  <Typography variant="label3">Last modified date</Typography>
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

            {/* Intent code field */}
            <Stack direction="column" gap={1}>
              <Typography variant="label3">Intent code</Typography>
              <TextField disabled value={value.intentCode} />
            </Stack>

            {/* Description field */}
            <Stack direction="column" gap={1}>
              <Typography variant="label3">Description</Typography>
              <TextField
                multiline
                rows={3}
                placeholder="Enter description..."
                error={!!formState.errors.description}
                helperText={formState.errors.description?.message}
                {...register("description")}
              />
            </Stack>

            {/* Note field */}
            <Stack direction="column" gap={1}>
              <Typography variant="label3">Note</Typography>
              <TextField
                multiline
                rows={3}
                placeholder="Enter note..."
                {...register("note")}
              />
            </Stack>
          </Stack>
        </DialogContent>
        <DialogActions sx={{ paddingX: 3, paddingBottom: 2 }}>
          <Button variant="outlined" color="secondary" onClick={handleClose}>
            Cancel
          </Button>
          <Button
            variant="contained"
            color="primary"
            onClick={handleClose}
            disabled={!formState.isValid}
          >
            Save
          </Button>
        </DialogActions>
      </Dialog>
    </>
  );
};

export default CategoryEditor;

const btnStyles: SxProps<Theme> = {
  flex: 1,
  padding: "6px 16px",
  alignItems: "center",
  gap: 1,
};
