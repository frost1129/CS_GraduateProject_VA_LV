"use client";

import Routes from "@/lib/constants/Routes";
import { getPostsThunk } from "@/lib/redux/features/schedule/post/postActions";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { SearchRequestParams } from "@/lib/types/redux-scheudule";
import { convertMillisecondsToDate } from "@/lib/utils";
import { useEffect, useState } from "react";
import PostActions from "../post-action";
import { GridColDef } from "@mui/x-data-grid";
import { IPostDTO } from "@/lib/types/backend-schedule";
import LoadingData from "@/lib/components/loading-data";
import NoData from "@/lib/components/no-data";
import ErrorRetrieveData from "@/lib/components/error-retrieve-data";
import CustomDataGrid from "@/lib/components/data-grid";
import { useRouter } from "next/navigation";

const PostRenderTable = () => {

    const dispatch = useAppDispatch();
    const router = useRouter();
    const { listPost, getListPostLoading, getListPostError } = useAppSelector(
        (state) => state.post
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
        dispatch(getPostsThunk(searchParams));
    };

    useEffect(() => {
        const initialSearchParams = { 
            page: 1, 
        };

        dispatch(getPostsThunk(initialSearchParams)); 
    }, [dispatch]);

    useEffect(() => {
        const columns: GridColDef<IPostDTO[][number]>[] = [
            {
                field: "id",
                headerName: "ID",
                width: 50,
                editable: false,
            },
            {
                field: "title",
                headerName: "Tiêu đề bài đăng",
                width: 300,
                editable: false,
            },
            {
                field: "image",
                headerName: "Hình ảnh",
                width: 150,
                align: "center",
                headerAlign: "center",
                renderCell: (params) => {
                    const imageUrl = params.row.image;
            
                    return (
                        <a href={imageUrl} target="_blank" rel="noopener noreferrer">
                            <img src={imageUrl} alt="Post Image" height="50" /> 
                        </a>
                    );
                }
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
                renderCell: () => <PostActions />,
            },
        ];
        setNewColumns(columns);
    }, []);

    if (getListPostLoading) return <LoadingData />;
    else if (listPost?.data.length === 0) return <NoData />;
    else if (getListPostError !== null) return <ErrorRetrieveData />;

    return (
        <CustomDataGrid
            rows={listPost?.data}
            columns={newColumns}
            pagination={{
                currentPage: listPost?.currentPage || null, 
                pageSize: listPost?.pageSize || null, 
                totalPages: listPost?.totalPages || null,
            }}
            onPageChange={handlePageChange}
        />
    )
};

export default PostRenderTable;