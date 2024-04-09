import { AlertProps } from "@mui/material";

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
