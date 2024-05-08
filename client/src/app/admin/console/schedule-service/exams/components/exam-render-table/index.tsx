"use client";

import ErrorRetrieveData from "@/lib/components/error-retrieve-data";
import LoadingData from "@/lib/components/loading-data";
import NoData from "@/lib/components/no-data";
import { useAppSelector } from "@/lib/redux/store";
import { IExamSchedule, ITimeTableDTO, LocalDate } from "@/lib/types/backend-schedule";
import { InputAdornment, Stack, TextField } from "@mui/material";
import { DataGrid, GridColDef } from "@mui/x-data-grid";
import {
    CalendarCheck,
    UserCircle,
    UserCircleCheck,
} from "@phosphor-icons/react";
import { useEffect, useState } from "react";

function convertExamScheduleToTimeTableDTO(examSchedule: IExamSchedule): ITimeTableDTO {

    return {
        subjectCode: examSchedule.subjectClass.subject.subjectCode,
        subjectName: examSchedule.subjectClass.subject.subjectName,
        startDate: examSchedule.examDate,  
        weeks: 0,
        weekday: 0, 
        startTime: examSchedule.timeSlot.startHour, 
        endTime: examSchedule.timeSlot.endHour, 
    };
}

const ExamRenderTable = () => {
    const { getYearCodeExamsLoading, yearCodeExams, getYearCodeExamsError } =
        useAppSelector((state) => state.exam);
    
    const { examSchedules } = 
        useAppSelector((state) => state.exam);

    const [newColumns, setNewColumns] = useState<any>();
    const [examList, setExamList] = useState<ITimeTableDTO[]>([]);

    useEffect(() => {
        const columns: GridColDef<ITimeTableDTO[][number]>[] = [
            {
                field: "subjectCode",
                headerName: "Mã môn",
                width: 150,
                editable: false,
                align: "center",
                headerAlign: "center",
            },
            {
                field: "subjectName",
                headerName: "Tên môn học",
                width: 300,
                editable: false,
            },
            {
                field: "startDate",
                headerName: "Ngày thi",
                width: 200,
                align: "center",
                headerAlign: "center",
            },
            {
                field: "startTime",
                headerName: "Giờ bắt đầu",
                width: 150,
                editable: false,
                headerAlign: "center",
                align: "center",
            },
            {
                field: "endTime",
                headerName: "Giờ kết thúc",
                width: 150,
                editable: false,
                headerAlign: "center",
                align: "center",
            },
        ];
        setNewColumns(columns);
    }, []);

    useEffect(() => {
        if (examSchedules !== null && examSchedules.examList) {
            const newExamList = [];
            for (const element of examSchedules.examList) {
                newExamList.push(convertExamScheduleToTimeTableDTO(element))
            }
            setExamList(newExamList);
        } else {
            setExamList([]);
        }
    }, [examSchedules]);

    if (getYearCodeExamsLoading) return <LoadingData />;
    else if (yearCodeExams?.length === 0) return <NoData />;
    else if (getYearCodeExamsError !== null) return <ErrorRetrieveData />;

    return (
        <>
            {examSchedules !== null && (
                <Stack direction={"row"} alignItems="center" gap={2} margin={2}>
                    <TextField
                        id="overlap"
                        label="Số sinh viên trùng lịch thi"
                        defaultValue={examSchedules.evaluate.overlapStudent}
                        InputProps={{
                            readOnly: true,
                            startAdornment: (
                                <InputAdornment position="start">
                                    <UserCircle />
                                </InputAdornment>
                            ),
                        }}
                    />
                    <TextField
                        id="over-schedule"
                        label="Số sinh viên thi trên 3 ca"
                        defaultValue={examSchedules.evaluate.overSchedule}
                        InputProps={{
                            readOnly: true,
                            startAdornment: (
                                <InputAdornment position="start">
                                    <UserCircleCheck />
                                </InputAdornment>
                            ),
                        }}
                    />
                    <TextField
                        id="fitness"
                        label="Điểm độ thích hợp"
                        defaultValue={examSchedules.evaluate.overallScore}
                        InputProps={{
                            readOnly: true,
                            startAdornment: (
                                <InputAdornment position="start">
                                    <CalendarCheck />
                                </InputAdornment>
                            ),
                        }}
                    />
                </Stack>
            )}
            <DataGrid
                rows={examSchedules ? examList : yearCodeExams}
                columns={newColumns}
                getRowId={(row) => row.subjectCode}
                disableColumnFilter
            />
        </>
    );
};

export default ExamRenderTable;
