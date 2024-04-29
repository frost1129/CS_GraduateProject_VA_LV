import { Pagination, Stack, SxProps, Theme } from "@mui/material";

import { CustomPaginationProps } from "@/lib/types/component";

const CustomPagination = (props: CustomPaginationProps) => {
  const { pagination, onPageChange } = props;

  return (
    <Stack sx={containerStyles}>
      <Pagination
        count={pagination?.totalPages || 0}
        page={pagination?.currentPage || 1}
        onChange={(_, value) => onPageChange(_, value)}
      />
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
