import { Button, CircularProgress } from '@mui/material';

import { CustomLoadingButtonProps } from '@/lib/types/component';

const CustomLoadingButton = (props: CustomLoadingButtonProps) => {
  const { fullWidth, variant = 'contained', color = 'primary', sx, size = "medium" } = props;
  return (
    <Button
      fullWidth={fullWidth}
      variant={variant}
      color={color}
      disableElevation
      disabled
      size={size}
      sx={sx}
    >
      <CircularProgress size={24} sx={{ color: 'var(--primary)' }} />
    </Button>
  );
};

export default CustomLoadingButton;
