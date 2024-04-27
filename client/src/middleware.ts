import { NextRequest, NextResponse } from "next/server";

import Routes from "./lib/constants/Routes";

const privateRoutes = [
  Routes.ROOT,
  Routes.PROFILE,
  Routes.ADMIN_ROUTES.CHAT_BOT_SERVICE.CATEGORIES,
  Routes.ADMIN_ROUTES.CHAT_BOT_SERVICE.TOPICS,
  Routes.ADMIN_ROUTES.CHAT_BOT_SERVICE.CONTENTS
];
export const unAuthenticatedRoutes = [Routes.LOGIN];

export default function middleware(request: NextRequest) {
  const token = request.cookies.get("token");

  if (!token && privateRoutes.includes(request.nextUrl.pathname)) {
    const absoluteUrl = new URL(Routes.LOGIN, request.nextUrl.origin);

    return NextResponse.redirect(absoluteUrl.toString());
  } else if (
    token &&
    unAuthenticatedRoutes.includes(request.nextUrl.pathname)
  ) {
    const absoluteUrl = new URL(Routes.ROOT, request.nextUrl.origin);

    return NextResponse.redirect(absoluteUrl.toString());
  }
}
