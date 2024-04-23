import {
  CircularProgress,
  Stack,
  SxProps,
  Theme,
  Typography,
} from "@mui/material";

const LoadingData = () => {
  return (
    <Stack
      direction="column"
      gap={2}
      alignItems="center"
      justifyContent="center"
      sx={containerStyles}
    >
      <CircularProgress sx={{ color: "var(--primary)" }} />
    </Stack>
  );
};

export default LoadingData;

const containerStyles: SxProps<Theme> = {
  flex: 1,
  height: "calc(100vh - var(--height-header))",
  border: "1px dashed var(--border-color)",
  borderRadius: 1,
  padding: 1.5,
};
