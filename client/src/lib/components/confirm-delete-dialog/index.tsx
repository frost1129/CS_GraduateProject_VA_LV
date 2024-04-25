import {
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  IconButton,
  Typography,
} from "@mui/material";
import { X } from "@phosphor-icons/react";

import { ConfirmDeleteDialogProps } from "@/lib/types/component";
import CustomLoadingButton from "../loading-button";

const ConfirmDeleteDialog = (props: ConfirmDeleteDialogProps) => {
  const { open, setOpen, title, content, deleteFunc, loading } = props;

  const handleClose = () => {
    setOpen(false);
  };

  return (
    <Dialog
      open={open}
      aria-labelledby="category-edit-dialog-title"
      aria-describedby="category-edit-dialog-description"
      maxWidth={"tablet"}
    >
      <DialogTitle component="div" id="category-edit-dialog-title">
        <Typography variant="h5">{title}</Typography>
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
        disabled={loading}
      >
        <X size={24} />
      </IconButton>
      <DialogContent>
        <Typography variant="body2">{content}</Typography>
      </DialogContent>
      <DialogActions sx={{ paddingX: 3, paddingBottom: 2 }}>
        <Button
          variant="outlined"
          color="secondary"
          onClick={handleClose}
          disabled={loading}
        >
          Hủy
        </Button>
        {loading ? (
          <CustomLoadingButton sx={{ height: "40px" }} />
        ) : (
          <Button variant="contained" color="error" onClick={deleteFunc}>
            Xóa
          </Button>
        )}
      </DialogActions>
    </Dialog>
  );
};

export default ConfirmDeleteDialog;
