"use client"

import { Stack, SxProps, Theme } from "@mui/material"
import ClassHeader from "./components/class-header";
import ClassRenderTable from "./components/class-render-table";
import { useState } from "react";
import { IYearCodeDTO } from "@/lib/types/backend-schedule";

const PostPage = () => {

    const [selectedYearCode, setSelectedYearCode] =
        useState<IYearCodeDTO | null>(null);

    return (
        <Stack direction="column" sx={pageContainerStyles}>
            <ClassHeader 
                selectedYearCode={selectedYearCode}
                setSelectedYearCode={setSelectedYearCode} 
            />
            <ClassRenderTable 
                selectedYearCode={selectedYearCode}
                setSelectedYearCode={setSelectedYearCode} 
            />
        </Stack>
    )
};

export default PostPage;

const pageContainerStyles: SxProps<Theme> = {
    paddingTop: 2,
    paddingBottom: 3,
    height: "calc(100vh - var(--height-header))",
  };