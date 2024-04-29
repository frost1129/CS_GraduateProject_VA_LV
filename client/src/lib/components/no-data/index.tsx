import Image from "next/image";

import { Stack, SxProps, Theme, Typography } from "@mui/material";

import { images } from "@/lib/assets/img";

const NoData = () => {
  return (
    <Stack
      direction="column"
      gap={2}
      alignItems="center"
      justifyContent="center"
      sx={containerStyles}
    >
      <Image
        src={images.emptyIcon}
        alt="empty"
        width={120}
        height={120}
        priority
      />
      <Typography variant="body2">No data</Typography>
    </Stack>
  );
};

export default NoData;

const containerStyles: SxProps<Theme> = {
  flex: 1,
  height: "calc(100vh - var(--height-header))",
  border: "1px dashed var(--border-color)",
  borderRadius: 1,
  padding: 1.5,
};
