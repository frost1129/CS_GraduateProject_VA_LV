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
      sx={noDataBoxStyles}
    >
      <Image src={images.emptyIcon} alt="empty" priority />
      <Typography>No data</Typography>
    </Stack>
  );
};

export default NoData;

const noDataBoxStyles: SxProps<Theme> = {
  flex: 1,
  height: "calc(100vh - var(--height-header))",
  border: "1px dashed var(--border-color)",
  borderRadius: 1,
  padding: 1.5,
};
