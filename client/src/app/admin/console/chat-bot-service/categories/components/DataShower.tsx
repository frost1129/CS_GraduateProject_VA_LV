"use client";

import { useEffect } from "react";

import { Typography } from "@mui/material";

import { getAllContentThunk } from "@/lib/redux/features/chat-bot/content/contentActions";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";

const DataShower = ({ data }: { data: any[] }) => {
  const dispatch = useAppDispatch();
  const { contents } = useAppSelector((state) => state.content);

  useEffect(() => {
    dispatch(getAllContentThunk());
  }, []);

  return (
    <>
      {data?.map((d, index) => (
        <Typography variant="body2" key={index}>
          {d.title}
        </Typography>
      ))}
    </>
  );
};

export default DataShower;
