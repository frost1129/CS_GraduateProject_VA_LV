import { Alert, AlertTitle, Box, Snackbar, Typography } from "@mui/material";
import {
  CheckCircle,
  Info,
  WarningCircle,
  X,
  XCircle,
} from "@phosphor-icons/react";

import "./style.scss";
import { ToastProps } from "@/lib/types/component";

const CustomToast = (props: ToastProps) => {
  const {
    id,
    open,
    handleClose,
    title,
    message,
    severity,
    anchorOrigin = { vertical: "top", horizontal: "right" },
    duration = 3000,
  } = props;

  return (
    <Snackbar
      id={id}
      open={open}
      autoHideDuration={duration}
      onClose={handleClose}
      anchorOrigin={anchorOrigin}
    >
      <Alert
        className="toast-alert"
        onClose={handleClose}
        severity={severity}
        iconMapping={{
          success: <CheckCircle size={48} color="var(--success)" />,
          info: <Info size={48} color="var(--information)" />,
          warning: <WarningCircle size={48} color="var(--warning)" />,
          error: <XCircle size={48} color="var(--alert)" />,
        }}
      >
        <AlertTitle>
          <Typography variant="h6">{title}</Typography>
        </AlertTitle>
        <Typography variant="body2" className="alert-message">
          {message}
        </Typography>
      </Alert>
    </Snackbar>
  );
};

export default CustomToast;
