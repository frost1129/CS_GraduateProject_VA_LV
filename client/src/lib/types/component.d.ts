import { AlertProps } from "@mui/material";
import { GridColDef } from "@mui/x-data-grid";

import { ICategoryResponse, IContentResponse, ITopicResponse } from "./backend.d";

export interface ToastInformation {
  severity: AlertProps["severity"];
  title: string;
  message: string;
}

export interface ToastProps {
  id: string;
  open: boolean;
  handleClose?: any;
  title: string;
  message: string;
  severity: AlertProps["severity"];
  anchorOrigin?: SnackbarProps["anchorOrigin"];
  duration?: number;
}

export interface CustomLoadingButtonProps {
  fullWidth?: boolean;
  variant?: "text" | "contained" | "outlined";
  size?: OverridableStringUnion<
    "small" | "medium" | "large",
    ButtonPropsSizeOverrides
  >;
  color?: "info" | "warning" | "error" | "inherit" | "primary" | "secondary";
  sx?: SxProps<Theme>;
}

export interface CustomAvatarProps {
  width?: number;
  height?: number;
  src?: string;
  alt?: string;
  sx?: SxProps<Theme>;
  className?: string;
}

export interface AdminHeaderProps {
  setDrawerOpen: any;
}

export interface CustomDataGridProps {
  rows: any;
  columns: GridColDef<any>[number];
}

export interface CategoryActionsProps {
  value: ICategoryResponse;
}

export interface CategoryEditorProps {
  value: ICategoryResponse;
}

export interface ContentActionsProps {
  value: IContentResponse;
}

export interface ConfirmDeleteDialogProps {
  open: boolean;
  setOpen: any;
  title: string;
  content: string;
  deleteFunc: any;
  loading: boolean;
}

export interface CategoryDeleterProps {
  value: ICategoryResponse;
}

export interface TopicActionsProps {
  value: ITopicResponse;
}

export interface TopicEditorProps {
  value: ITopicResponse;
}

export interface TopicDeleterProps {
  value: ITopicResponse;
}
