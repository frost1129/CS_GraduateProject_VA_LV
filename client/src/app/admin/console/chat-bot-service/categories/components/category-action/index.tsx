"use client";

import { useState } from "react";

import { DotsThree, PencilSimple, Trash } from "@phosphor-icons/react";
import {
  MenuItem,
  Popover,
  Stack,
  SxProps,
  Theme,
  Typography,
} from "@mui/material";

import { CategoryActionsProps } from "@/lib/types/component";
import CategoryEditor from "../category-editor";

const CategoryActions = (props: CategoryActionsProps) => {
  const { value } = props;

  const [anchorEl, setAnchorEl] = useState<HTMLButtonElement | null>(null);

  const handleOpenActionMenu = (event: React.MouseEvent<HTMLButtonElement>) => {
    setAnchorEl(event.currentTarget);
  };

  const handleCloseActionMenu = () => {
    setAnchorEl(null);
  };

  const open = Boolean(anchorEl);
  const id = open ? "category-action-menu" : undefined;

  return (
    <>
      <Stack sx={containerStyles} justifyContent="center" alignItems="center">
        <Stack
          component="button"
          className="reset-btn"
          sx={actionMenuBtnStyles}
          onClick={handleOpenActionMenu}
        >
          <DotsThree size={32} />
        </Stack>
      </Stack>
      <Popover
        id={id}
        open={open}
        anchorEl={anchorEl}
        onClose={handleCloseActionMenu}
        anchorOrigin={{
          vertical: "bottom",
          horizontal: "right",
        }}
        transformOrigin={{
          vertical: "top",
          horizontal: "right",
        }}
        sx={popoverStyles}
      >
        <MenuItem sx={{ padding: 0 }}>
          <CategoryEditor value={value} />
        </MenuItem>
        <MenuItem sx={deleteBtnStyles} onClick={handleCloseActionMenu}>
          <Stack direction="row" alignItems="center" gap={1}>
            <Trash size={24} />
            <Typography variant="body2">Delete</Typography>
          </Stack>
        </MenuItem>
      </Popover>
    </>
  );
};

export default CategoryActions;

const containerStyles: SxProps<Theme> = {
  width: "100%",
  height: "100%",
};

const actionMenuBtnStyles: SxProps<Theme> = {
  ":hover": {
    backgroundColor: "var(--grey-primary-80)",
    borderRadius: 1,
  },
};

const popoverStyles: SxProps<Theme> = {
  "& .MuiPaper-root": {
    minWidth: "160px",
    padding: 1,
    marginTop: "12px",
    boxShadow: "0px 2px 4px 0px rgba(30, 32, 32, 0.4)",
  },
};

const deleteBtnStyles: SxProps<Theme> = {
  color: "var(--alert)",
  ":hover": {
    backgroundColor: "var(--alert)",
    color: "var(--white)",
  },
};