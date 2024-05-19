import { Box, Stack, Typography } from "@mui/material";
import { Info } from "@phosphor-icons/react";

const AddtionalInfo = () => {
  return (
    <Stack
      direction="row"
      gap={1.5}
      sx={{
        borderRadius: "12px",
        border: "1px solid var(--primary)",
        padding: "12px",
      }}
    >
      <Box>
        <Info size={26} />
      </Box>
      <Typography variant="body3">
        Tôi sẽ cung cấp các thông tin liên quan về trường và các nội dung hoạt động công tác sinh viên.
      </Typography>
    </Stack>
  );
};

export default AddtionalInfo;
