import { CategoryResponse } from './backend.d';
import { AlertProps } from "@mui/material";
import { GridColDef } from "@mui/x-data-grid";

export interface ToastInformation {
  severity: AlertProps["severity"];
  title: string;
  message: string;
}

export interface ToastProps {
  open: boolean;
  handleClose?: any;
  title: string;
  message: string;
  severity: AlertProps["severity"];
  anchorOrigin?: SnackbarProps["anchorOrigin"];
}

export interface CustomLoadingButtonProps {
  fullWidth?: boolean;
  variant?: "text" | "contained" | "outlined";
  size?: OverridableStringUnion<"small" | "medium" | "large", ButtonPropsSizeOverrides>;
  color?:
    | "info"
    | "warning"
    | "error"
    | "inherit"
    | "primary"
    | "secondary";
  sx?: SxProps<Theme>;
}

export interface CustomAvatarProps {
  width?: number;
  height?: number;
  src?: string;
  alt?: string;
  sx?: SxProps<Theme>
  className?: string;
}

export interface AdminHeaderProps {
  setDrawerOpen: any;
}

export interface CustomDataGridProps {
  rows: any;
  columns: GridColDef<any>[]
}

export interface CategoryRenderTableProps {
  rows: CategoryResponse[];
  columns: GridColDef<any>[]
}

export interface CategoryActionsProps {
  value: CategoryResponse;
}
