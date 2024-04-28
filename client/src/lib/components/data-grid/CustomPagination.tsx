import { Pagination, Stack, SxProps, Theme } from "@mui/material";

const CustomPagination = () => {
  return (
    <Stack sx={containerStyles}>
      <Pagination count={10} defaultPage={1} />
    </Stack>
  );
};

export default CustomPagination;

const containerStyles: SxProps<Theme> = {
  flexDirection: "row",
  justifyContent: "center",
  alignItems: "center",
  padding: "24px 16px",
  border: "1px solid var(--border-color)",
};
