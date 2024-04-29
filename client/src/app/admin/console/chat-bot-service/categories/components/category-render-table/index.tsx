"use client";

import { useEffect, useState } from "react";

import { GridColDef } from "@mui/x-data-grid";

import CustomDataGrid from "@/lib/components/data-grid";
import { convertMillisecondsToDate } from "@/lib/utils";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { getCategoriesThunk } from "@/lib/redux/features/chat-bot/category/categoryActions";
import CategoryActions from "../category-action";
import NoData from "@/lib/components/no-data";
import ErrorRetrieveData from "@/lib/components/error-retrieve-data";
import LoadingData from "@/lib/components/loading-data";

const CategoryRenderTable = () => {
  const dispatch = useAppDispatch();
  const { listCategoryLoading, categories, listCategoryError } = useAppSelector(
    (state) => state.category
  );

  const [newColumns, setNewColumns] = useState<any>();

  useEffect(() => {
    const columns: GridColDef<(typeof categories)[number]>[] = [
      {
        field: "id",
        headerName: "ID",
        width: 50,
        align: "center",
        headerAlign: "center",
      },
      {
        field: "intentCode",
        headerName: "Chuỗi xác định",
        width: 200,
        editable: false,
      },
      {
        field: "description",
        headerName: "Mô tả",
        flex: 1,
        editable: false,
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
        field: "lastModifiedDate",
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
        renderCell: (value) => <CategoryActions value={value.row} />,
      },
    ];
    setNewColumns(columns);
  }, []);

  useEffect(() => {
    if (typeof window !== "undefined") {
      const queryParams = new URLSearchParams(window.location.search);
      const kw = queryParams.get("kw");
      if (kw !== null) dispatch(getCategoriesThunk({ keyword: kw }));
      else dispatch(getCategoriesThunk({}));
    }
  }, []);

  if (listCategoryLoading) return <LoadingData />;
  else if (categories.length === 0) return <NoData />;
  else if (listCategoryError !== null) return <ErrorRetrieveData />;

  return (
    <CustomDataGrid rows={categories} columns={newColumns} hidePagination />
  );
};

export default CategoryRenderTable;
