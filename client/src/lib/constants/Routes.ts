const ADMIN_ROUTES = {
  CHAT_BOT_SERVICE: {
    CATEGORIES: "/admin/console/chat-bot-service/categories",
    TOPICS: "/admin/console/chat-bot-service/topics",
    CONTENTS: "/admin/console/chat-bot-service/contents",
    SCHOOL_YEARS: "/admin/console/chat-bot-service/school-years",
    CONVERSATION_HISTORIES:
      "/admin/console/chat-bot-service/conversation-histories",
  },
  SCHEDULE_SERVICE: {
    POSTS: "/admin/console/schedule-service/posts",
    SUBJECTS: "/admin/console/schedule-service/subjects",
    SUBJECT_CLASSES: "/admin/console/schedule-service/subject-classes",
    EXAMS:"/admin/console/schedule-service/exams",
  },
};

const ROOT = "/";
const PROFILE = "/profile";
const LOGIN = "/auth/login";
const EXAM_TIME_TABLE = "/exam-time-table";
const TIME_TABLE = "/time-table";
const ACADEMIC_Q_AND_A = "/qa";

export default {
  ADMIN_ROUTES,
  ROOT,
  PROFILE,
  LOGIN,
  EXAM_TIME_TABLE,
  TIME_TABLE,
  ACADEMIC_Q_AND_A,
};
