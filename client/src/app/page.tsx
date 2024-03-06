"use client";

import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import Link from "next/link";
import React from "react";

const HomePage = () => {
  const { count } = useAppSelector((state) => state.test);
  return (
    <>
      <div>{count}</div>
      <Link href="/test">Test</Link>
    </>
  );
};

export default HomePage;
