import { DNA, IExamSchedule, IPostDTO, IPostResponse, ISchoolYearDTO, IStudentJoinClassDTO, ISubjectClassDTO, ISubjectClassResponse, ISubjectDTO, ISubjectSearchResponse, ITimeSlotDTO, ITimeTableDTO, IYearCodeDTO } from "./backend-schedule";
import { SchoolYearState } from "./redux";

export interface MasterState {
    getSchoolYearLoading: boolean;
    schoolYears: ISchoolYearDTO[];
    getSchoolYearError: any;

    getTimeSlotLoading: boolean;
    timeSlots: ITimeSlotDTO[];
    getTimeSlotError: any;

    getYearCodeLoading: boolean;
    yearCodes: IYearCodeDTO[];
    getYearCodeError: any;
}

export interface PostState {
    getListPostLoading: boolean;
    listPost: IPostResponse | null;
    getListPostError: any;

    getPostLoading: boolean;
    post: IPostDTO | null;
    getPostError: any;
}

export interface SubjectState {
    getSubjectLoading: boolean;
    subjects: ISubjectSearchResponse | null;
    getSubjectError: any;

    saveSubjectLoading: boolean;
    savedSubject: ISubjectDTO | null;
    saveSubjectError: any;

    uploadSubjectLoading: boolean;
    uploadedSubject: ISubjectDTO[];
    uploadSubjectError: any;
}

export interface SubjectClassState {
    getSubjectClassLoading: boolean;
    subjectClasses: ISubjectClassResponse | null;
    getSubjectClassError: any;

    uploadSubjectClassLoading: boolean;
    uploadedSubjectClass: ISubjectClassDTO[];
    uploadSubjectClassError: any;
}

export interface EnrollmentState {
    getTimeTableLoading: boolean;
    timeTables: ITimeTableDTO[];
    getTimeTableError: any;

    uploadTimeTableLoading: boolean;
    uploadedTimeTable: IStudentJoinClassDTO[];
    uploadTimeTableError: any;
}

export interface ExamScheduleState {
    generateExamScheduleLoading: boolean;
    examSchedules: DNA | null;
    generateExamScheduleError: any;

    saveExamScheduleLoading: boolean;
    savedExamSchedule: IExamSchedule[];
    saveExamScheduleError: any;
}

export interface SearchRequestParams {
    kw?: string;
    page?: number;
}

export interface SubjectClassRequestParams {
    kw?: string;
    yearCode?: number;
    page?: number;
}

export interface TimetableRequestParams {
    studentId?: string;
    yearCode?: number;
}

export interface ResetMasterStatusPayload {
    keys: Array<keyof MasterState>;
}

export interface ResetPostStatusPayload {
    keys: Array<keyof PostState>;
}

export interface ResetSubjectStatusPayload {
    keys: Array<keyof SubjectState>;
}

export interface ResetSubjectClassStatusPayload {
    keys: Array<keyof SubjectClassState>;
}

export interface ResetEnrollStatusPayload {
    keys: Array<keyof EnrollmentState>;
}

export interface ResetExamScheduleStatusPayload {
    keys: Array<keyof ExamScheduleState>;
}