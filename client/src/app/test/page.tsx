"use client";

import { increase } from "@/lib/redux/features/test/testSlice";
import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import Link from "next/link";
import React from "react";

const TestPage = () => {
  const dispatch = useAppDispatch();
  const { count } = useAppSelector((state) => state.test);
  return (
    <>
      <div>{count}</div>
      <button onClick={() => dispatch(increase())}>increase</button>
      <Link href="/">Home</Link>
    </>
  );
};

export default TestPage;
