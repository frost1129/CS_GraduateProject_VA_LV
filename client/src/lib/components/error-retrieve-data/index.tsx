import Image from "next/image";

import { Stack, SxProps, Theme, Typography } from "@mui/material";

import { images } from "@/lib/assets/img";

const ErrorRetrieveData = () => {
  return (
    <Stack
      direction="column"
      gap={2}
      alignItems="center"
      justifyContent="center"
      sx={containerStyles}
    >
      <Image src={images.errorIcon} alt="error-data" width={120} height={120} />
      <Typography variant="body2">Oops! Đã xảy ra lỗi.</Typography>
    </Stack>
  );
};

export default ErrorRetrieveData;

const containerStyles: SxProps<Theme> = {
  flex: 1,
  height: "calc(100vh - var(--height-header))",
  border: "1px dashed var(--border-color)",
  borderRadius: 1,
  padding: 1.5,
};
