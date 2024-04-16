import { NextRequest, NextResponse } from "next/server";

const privateRoutes = [
  "/",
  "/profile",
  "/admin/console/chat-bot-service/categories",
  "/admin/console/chat-bot-service/topics",
];
export const unAuthenticatedRoutes = ["/auth/login"];

export default function middleware(request: NextRequest) {
  const token = request.cookies.get("token");

  if (!token && privateRoutes.includes(request.nextUrl.pathname)) {
    const absoluteUrl = new URL("/auth/login", request.nextUrl.origin);

    return NextResponse.redirect(absoluteUrl.toString());
  } else if (
    token &&
    unAuthenticatedRoutes.includes(request.nextUrl.pathname)
  ) {
    const absoluteUrl = new URL("/", request.nextUrl.origin);

    return NextResponse.redirect(absoluteUrl.toString());
  }
}
