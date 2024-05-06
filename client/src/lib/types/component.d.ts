import { AlertProps } from "@mui/material";
import { GridColDef } from "@mui/x-data-grid";

import {
  ICategoryResponse,
  IContentResponse,
  IConversationResponse,
  ITopicResponse,
} from "./backend.d";

export interface ToastInformation {
  severity: AlertProps["severity"];
  title: string;
  message: string;
}

export interface ToastProps {
  id: string;
  open: boolean;
  handleClose?: any;
  title: string;
  message: string;
  severity: AlertProps["severity"];
  anchorOrigin?: SnackbarProps["anchorOrigin"];
  duration?: number;
}

export interface CustomLoadingButtonProps {
  fullWidth?: boolean;
  variant?: "text" | "contained" | "outlined";
  size?: OverridableStringUnion<
    "small" | "medium" | "large",
    ButtonPropsSizeOverrides
  >;
  color?: "info" | "warning" | "error" | "inherit" | "primary" | "secondary";
  sx?: SxProps<Theme>;
}

export interface CustomAvatarProps {
  width?: number;
  height?: number;
  src?: string;
  alt?: string;
  sx?: SxProps<Theme>;
  className?: string;
}

export interface AdminHeaderProps {
  setDrawerOpen: any;
}

export type CustomDataGridProps = {
  rows: any;
  columns: GridColDef<any>[number];
  hidePagination?: boolean;
  pagination?: {
    currentPage: number | null;
    pageSize: number | null;
    totalPages: number | null;
  };
  onPageChange?: any;
};

export interface CategoryActionsProps {
  value: ICategoryResponse;
}

export interface CategoryEditorProps {
  value: ICategoryResponse;
}

export interface ContentActionsProps {
  value: IContentResponse;
}

export interface ConfirmDeleteDialogProps {
  open: boolean;
  setOpen: any;
  title: string;
  content: string;
  deleteFunc: any;
  loading: boolean;
}

export interface CategoryDeleterProps {
  value: ICategoryResponse;
}

export interface TopicActionsProps {
  value: ITopicResponse;
}

export interface TopicEditorProps {
  value: ITopicResponse;
}

export interface TopicDeleterProps {
  value: ITopicResponse;
}

export interface ContentEditorProps {
  value: IContentResponse;
}

export interface ContentDeleterProps {
  value: IContentResponse;
}

export interface CustomPaginationProps {
  pagination?: {
    currentPage: number | null;
    pageSize: number | null;
    totalPages: number | null;
  };
  onPageChange?: any;
}

export interface CustomDrawerProps {
  onClose?: any;
}

export interface SchoolYearActionsProps {
  value: ISchoolYearResponse;
}

export interface SchoolYearEditorProps {
  value: ISchoolYearResponse;
}

export interface SchoolYearDeleterProps {
  value: ISchoolYearResponse;
}

export interface ConversationHistoryActionsProps {
  value: IConversationResponse;
}

export interface ConversationHistoryDetailProps {
  value: IConversationResponse;
}

export interface ConversationHistoryDeleterProps {
  value: IConversationResponse;
}

export interface MessageItemProps {
  type: "question" | "answer";
  message: IConversationResponse;
}

export interface IReactSchedulerData {
  event_id: number;
  title: string;
  start: Date;
  end: Date;
}
