import { DotsThree } from "@phosphor-icons/react";
import { Stack, SxProps, Theme } from "@mui/material";

import { CategoryActionsProps } from "@/lib/types/component";

const CategoryActions = (props: CategoryActionsProps) => {
  const { value } = props;

  return (
    <Stack sx={containerStyles} justifyContent="center" alignItems="center">
      <Stack component="button" className="reset-btn" sx={btnStyles}>
        <DotsThree size={32} />
      </Stack>
    </Stack>
  );
};

export default CategoryActions;

const containerStyles: SxProps<Theme> = {
  width: "100%",
  height: "100%",
};

const btnStyles: SxProps<Theme> = {
  ":hover": {
    backgroundColor: "var(--grey-primary-80)",
    borderRadius: 1,
  },
};
