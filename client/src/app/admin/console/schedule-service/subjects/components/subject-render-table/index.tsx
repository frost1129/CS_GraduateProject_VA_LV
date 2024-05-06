"use client";

import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { convertMillisecondsToDate } from "@/lib/utils";
import { GridColDef } from "@mui/x-data-grid";
import React, { useEffect, useState } from "react";
import { getSubjectsThunk } from "@/lib/redux/features/schedule/subject/subjectActions";
import { ISubjectDTO } from "@/lib/types/backend-schedule";
import { SearchRequestParams } from "@/lib/types/redux-scheudule";
import { useRouter } from "next/navigation";
import Routes from "@/lib/constants/Routes";
import LoadingData from "@/lib/components/loading-data";
import NoData from "@/lib/components/no-data";
import ErrorRetrieveData from "@/lib/components/error-retrieve-data";
import CustomDataGrid from "@/lib/components/data-grid";
import SubjectActions from "../subject-action";

const SubjectRenderTable = () => {
    const dispatch = useAppDispatch();
    const router = useRouter();
    const { getSubjectLoading, subjects, getSubjectError } = useAppSelector(
        (state) => state.subject
    );

    const [newColumns, setNewColumns] = useState<any>();

    const handlePageChange = (_: React.ChangeEvent<unknown>, value: number) => {
        let searchParams: SearchRequestParams = {};

        const queryParams = new URLSearchParams(window.location.search);

        const queryParts = [];

        const kw = queryParams.get("kw");
        if (kw) {
            queryParts.push(`kw=${encodeURIComponent(kw)}`);
            searchParams = { ...searchParams, kw: kw };
        }

        queryParts.push(`page=${encodeURIComponent(value)}`);

        const queryString = queryParts.length > 0 ? `?${queryParts.join("&")}` : "";

        router.replace(Routes.ADMIN_ROUTES.SCHEDULE_SERVICE.SUBJECTS + queryString);
        searchParams = { ...searchParams, page: value };
        dispatch(getSubjectsThunk(searchParams));
    };

    useEffect(() => {
        const initialSearchParams = { 
            page: 1, 
        };

        dispatch(getSubjectsThunk(initialSearchParams)); 
    }, [dispatch]);

    useEffect(() => {
        const columns: GridColDef<ISubjectDTO[][number]>[] = [
            {
                field: "subjectCode",
                headerName: "Mã môn học",
                width: 150,
                editable: false,
            },
            {
                field: "subjectName",
                headerName: "Tên môn học",
                width: 300,
                editable: false,
            },
            {
                field: "credits",
                headerName: "Số tín",
                width: 70,
                align: "center",
                headerAlign: "center",
            },
            {
                field: "createdDate",
                headerName: "Ngày tạo",
                type: "number",
                width: 200,
                editable: false,
                headerAlign: "right",
                align: "right",
                valueGetter: (value: any) => convertMillisecondsToDate(value),
            },
            {
                field: "updatedDate",
                headerName: "Ngày chỉnh sửa",
                type: "number",
                width: 200,
                editable: false,
                headerAlign: "right",
                align: "right",
                valueGetter: (value: any) => {
                    if (value === null) return "-";
                    else return convertMillisecondsToDate(value);
                },
            },
            {
                field: "actions",
                headerName: "Tác vụ",
                width: 150,
                editable: false,
                headerAlign: "center",
                sortable: false,
                renderCell: (value) => <SubjectActions />,
            },
        ];
        setNewColumns(columns);
    }, []);

    if (getSubjectLoading) return <LoadingData />;
    else if (subjects?.data.length === 0) return <NoData />;
    else if (getSubjectError !== null) return <ErrorRetrieveData />; 

    return (
        <CustomDataGrid
            rows={subjects?.data}
            columns={newColumns}
            pagination={{
                currentPage: subjects?.currentPage || null, 
                pageSize: subjects?.pageSize || null, 
                totalPages: subjects?.totalPages || null,
            }}
            onPageChange={handlePageChange}
        />
    );
};

export default SubjectRenderTable;