"use client";

import { useEffect, useState } from "react";

import { GridColDef } from "@mui/x-data-grid";

import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import { ISchoolYearResponse } from "@/lib/types/backend";
import { convertMillisecondsToDate } from "@/lib/utils";
import LoadingData from "@/lib/components/loading-data";
import NoData from "@/lib/components/no-data";
import ErrorRetrieveData from "@/lib/components/error-retrieve-data";
import CustomDataGrid from "@/lib/components/data-grid";
import { getSchoolYearsThunk } from "@/lib/redux/features/chat-bot/school-year/schoolYearActions";
import SchoolYearActions from "../school-year-actions";

const SchoolYearRenderTable = () => {
  const dispatch = useAppDispatch();
  const { schoolYearDataResponse, listSchoolYearLoading, listSchoolYearError } =
    useAppSelector((state) => state.schoolYear);

  const [newColumns, setNewColumns] = useState<any>();

  useEffect(() => {
    const columns: GridColDef<ISchoolYearResponse[][number]>[] = [
      {
        field: "id",
        headerName: "ID",
        width: 50,
        align: "center",
        headerAlign: "center",
      },
      {
        field: "year",
        headerName: "Năm học",
        width: 200,
        editable: false,
      },
      {
        field: "courseName",
        headerName: "Khóa học",
        minWidth: 200,
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
        renderCell: (value) => <SchoolYearActions value={value.row} />,
      },
    ];
    setNewColumns(columns);
    dispatch(getSchoolYearsThunk({}));
  }, []);

  if (listSchoolYearLoading) return <LoadingData />;
  else if (schoolYearDataResponse?.data.length === 0) return <NoData />;
  else if (listSchoolYearError !== null) return <ErrorRetrieveData />;

  return (
    <CustomDataGrid
      rows={schoolYearDataResponse?.data}
      columns={newColumns}
      hidePagination
    />
  );
};

export default SchoolYearRenderTable;
