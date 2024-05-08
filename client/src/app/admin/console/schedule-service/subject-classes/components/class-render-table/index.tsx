"use client";

import CustomDataGrid from "@/lib/components/data-grid";
import ErrorRetrieveData from "@/lib/components/error-retrieve-data";
import LoadingData from "@/lib/components/loading-data";
import NoData from "@/lib/components/no-data";
import Routes from "@/lib/constants/Routes";
import { getSubjectClassesThunk } from "@/lib/redux/features/schedule/subject-class/subjectClassActions";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { ISubjectClassShortDTO } from "@/lib/types/backend-schedule";
import { SubjectClassRequestParams } from "@/lib/types/redux-scheudule";
import { GridColDef } from "@mui/x-data-grid";
import { useRouter } from "next/navigation";
import { useEffect, useState } from "react";

const ClassRenderTable = () => {

    const dispatch = useAppDispatch();
    const router = useRouter();
    const { subjectClasses, getSubjectClassLoading, getSubjectClassError } = 
        useAppSelector((state) => state.subjectClass);

    const [newColumns, setNewColumns] = useState<any>();

    const handlePageChange = (_: React.ChangeEvent<unknown>, value: number) => {
        let searchParams: SubjectClassRequestParams = {};

        const queryParams = new URLSearchParams(window.location.search);

        const queryParts = [];

        const kw = queryParams.get("kw");
        if (kw) {
            queryParts.push(`kw=${encodeURIComponent(kw)}`);
            searchParams = { ...searchParams, kw: kw };
        }

        //TODO
        queryParts.push(`yearCode=${encodeURIComponent(221)}`);
        searchParams = { ...searchParams, yearCode: 221 };

        queryParts.push(`page=${encodeURIComponent(value)}`);

        const queryString = queryParts.length > 0 ? `?${queryParts.join("&")}` : "";

        router.replace(Routes.ADMIN_ROUTES.SCHEDULE_SERVICE.SUBJECTS + queryString);
        searchParams = { ...searchParams, page: value };
        dispatch(getSubjectClassesThunk(searchParams));
    };

    useEffect(() => {
        const initialSearchParams = { 
            page: 1,
            yearCode: 221, 
        };

        dispatch(getSubjectClassesThunk(initialSearchParams)); 
    }, [dispatch]);

    useEffect(() => {
        const columns: GridColDef<ISubjectClassShortDTO[][number]>[] = [
            {
                field: "id",
                headerName: "ID",
                width: 70,
                editable: false,
                align: "center",
                headerAlign: "center",
            },
            {
                field: "subject",
                headerName: "Tên môn học",
                width: 300,
                editable: false,
            },
            {
                field: "subjectClassSchedule.startDate",
                headerName: "Ngày bắt đầu",
                width: 150,
                align: "center",
                headerAlign: "center",
                renderCell: (params) => params.row.subjectClassSchedule.startDate,
            },
            {
                field: "subjectClassSchedule.weekday",
                headerName: "Thứ",
                width: 70,
                align: "center",
                headerAlign: "center",
                renderCell: (params) => params.row.subjectClassSchedule.weekday,
            },
            {
                field: "subjectClassSchedule.weeks",
                headerName: "Số buổi",
                width: 100,
                align: "center",
                headerAlign: "center",
                renderCell: (params) => params.row.subjectClassSchedule.weeks,
            },
            {
                field: "subjectClassSchedule.startTimeSlot",
                headerName: "Ca bắt đầu",
                width: 150,
                editable: false,
                headerAlign: "center",
                align: "center",
                renderCell: (params) => params.row.subjectClassSchedule.startTimeSlot,
            },
            {
                field: "numberOfStudents",
                headerName: "Số SV",
                width: 70,
                editable: false,
                headerAlign: "center",
                align: "center",
            },
        ];
        setNewColumns(columns);
    }, []);

    if (getSubjectClassLoading) return <LoadingData />;
    else if (subjectClasses?.data.length === null) return <NoData />;
    else if (getSubjectClassError !== null) return <ErrorRetrieveData />;


    return (
        <CustomDataGrid
            rows={subjectClasses?.data}
            columns={newColumns}
            pagination={{
                currentPage: subjectClasses?.currentPage || null, 
                pageSize: subjectClasses?.pageSize || null, 
                totalPages: subjectClasses?.totalPages || null,
            }}
            onPageChange={handlePageChange}
        />
    )
};

export default ClassRenderTable;