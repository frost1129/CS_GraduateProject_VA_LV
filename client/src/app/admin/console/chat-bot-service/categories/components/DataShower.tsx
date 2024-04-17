"use client";

import { Typography } from "@mui/material";

const DataShower = ({ data }: { data: any[] }) => {

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
