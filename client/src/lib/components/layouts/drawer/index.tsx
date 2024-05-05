"use client";

import React from "react";
import Image from "next/image";
import Link from "next/link";
import { usePathname } from "next/navigation";

import {
  Box,
  MenuItem,
  Stack,
  SxProps,
  Theme,
  Typography,
} from "@mui/material";
import {
  At,
  BookBookmark,
  BookOpenText,
  ChalkboardTeacher,
  ClockCounterClockwise,
  Club,
  Exam,
  Note,
  Notebook,
} from "@phosphor-icons/react";
import { images } from "@/lib/assets/img";
import { CustomDrawerProps } from "@/lib/types/component";
import Routes from "@/lib/constants/Routes";

const CustomDrawer = (props: CustomDrawerProps) => {
  const { onClose } = props;
  const pathname = usePathname();

  return (
    <Box sx={drawerStyles}>
      <Box sx={{ padding: "24px 0px 8px 24px" }}>
        <Link href={Routes.ROOT}>
          <Image src={images.logoOU} alt="logo-ou" width={70} priority />
        </Link>
      </Box>
      {drawerData.map((service) => (
        <Stack
          direction="column"
          gap={1.5}
          sx={{ paddingTop: 2 }}
          key={service.id}
        >
          <Typography
            variant="label3"
            sx={{ paddingLeft: 3, textTransform: "uppercase" }}
          >
            {service.serviceName}
          </Typography>
          <Stack direction="column" gap={0.5} sx={{ padding: "0px 8px" }}>
            {service.items.map((item) => (
              <Link href={item.link} key={item.id} onClick={onClose}>
                <MenuItem
                  sx={{
                    ...drawerMenuItemStyles,
                    backgroundColor: `${
                      pathname === item.link && "var(--primary)"
                    }`,
                    color: `${pathname === item.link && "var(--white)"}`,
                    ":hover": {
                      backgroundColor: `${
                        pathname === item.link && "var(--turquoise-700)"
                      }`,
                    },
                  }}
                >
                  <Stack
                    direction="row"
                    alignItems="center"
                    gap={2}
                    sx={{ width: "100%" }}
                  >
                    {item.icon}
                    <Typography
                      variant={pathname === item.link ? "label2" : "body2"}
                    >
                      {item.name}
                    </Typography>
                  </Stack>
                </MenuItem>
              </Link>
            ))}
          </Stack>
        </Stack>
      ))}
    </Box>
  );
};

export default CustomDrawer;

const iconSize = 20;
const drawerWidth = "100%";

const drawerData = [
  {
    id: "1",
    serviceName: "Hỏi đáp học vụ",
    items: [
      {
        id: "1-1",
        name: "Danh mục",
        link: "/admin/console/chat-bot-service/categories",
        icon: <Club size={iconSize} />,
      },
      {
        id: "1-2",
        name: "Chủ đề",
        link: "/admin/console/chat-bot-service/topics",
        icon: <BookBookmark size={iconSize} />,
      },
      {
        id: "1-3",
        name: "Nội dung học vụ",
        link: "/admin/console/chat-bot-service/contents",
        icon: <BookOpenText size={iconSize} />,
      },
      {
        id: "1-4",
        name: "Năm học",
        link: "/admin/console/chat-bot-service/school-years",
        icon: <At size={iconSize} />,
      },
      {
        id: "1-5",
        name: "Lịch sử hỏi đáp",
        link: "/admin/console/chat-bot-service/conversation-histories",
        icon: <ClockCounterClockwise size={iconSize} />,
      },
    ],
  },
  {
    id: "2",
    serviceName: "Quản lý chung",
    items: [
      {
        id: "2-1",
        name: "Bài đăng",
        link: "/admin/console/schedule-service/posts",
        icon: <Note size={iconSize} />,
      },
      {
        id: "2-2",
        name: "Môn học",
        link: "/admin/console/schedule-service/subjects",
        icon: <Notebook size={iconSize} />,
      },
      {
        id: "2-3",
        name: "Lớp môn học",
        link: "/admin/console/schedule-service/subject-classes",
        icon: <ChalkboardTeacher size={iconSize} />,
      },
      {
        id: "2-4",
        name: "Lịch thi",
        link: "/admin/console/schedule-service/exams",
        icon: <Exam size={iconSize} />,
      },
    ],
  },
];

const drawerStyles: SxProps<Theme> = {
  width: drawerWidth,
  height: "100vh",
  borderRight: "1px dashed var(--border-color)",
};

const drawerMenuItemStyles: SxProps<Theme> = {
  width: "100%",
  padding: "8px 16px 8px 20px",
};
