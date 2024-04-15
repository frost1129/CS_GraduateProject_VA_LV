import Image from "next/image";

import { Stack, Typography } from "@mui/material";

import AddtionalInfo from "./AddtionalInfo";
import { images } from '@/lib/assets/img';

const EmptyDataPlaceholder = () => {
  return (
    <Stack
      direction="column"
      justifyContent="center"
      alignItems="center"
      sx={{ width: "400px", height: "100%", alignSelf: 'center' }}
      gap={2}
    >
      <Image src={images.robotAvt} alt="logo-ou" width={100} />
      <Typography variant="body1">Tôi có thể giúp gì cho bạn?</Typography>
      <AddtionalInfo />
    </Stack>
  );
};

export default EmptyDataPlaceholder;
