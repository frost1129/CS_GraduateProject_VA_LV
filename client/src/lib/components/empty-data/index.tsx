import Image from "next/image";

import { Stack, SxProps, Theme, Typography } from "@mui/material";

import { images } from "@/lib/assets/img";
import AddtionalInfo from "./AddtionalInfo";

const EmptyDataPlaceholder = () => {
  return (
    <Stack sx={containerStyles}>
      <Stack direction='column' gap={2} alignItems='center' sx={{ width: '400px'}}>
        <Image src={images.robotAvt} alt="logo-ou" width={100} />
        <Typography variant="body1">Tôi có thể giúp gì cho bạn?</Typography>
        <AddtionalInfo />
      </Stack>
    </Stack>
  );
};

export default EmptyDataPlaceholder;

const containerStyles: SxProps<Theme> = {
  flex: 1,
  justifyContent: "center",
  alignItems: "center",
  height: "calc(100vh - var(--height-header))",
  border: "1px dashed var(--border-color)",
  borderRadius: 1,
  padding: 2,
};
