export interface Time {
    hour: number;
    minute: number;
    second: number;

    // constructor(hour: number, minute: number, second: number = 0) {
    //     this.hour = hour;
    //     this.minute = minute;
    //     this.second = second;
    // }

    // toString(): string {
    //     return `${this.hour.toString().padStart(2, '0')}:${this.minute.toString().padStart(2, '0')}:${this.second.toString().padStart(2, '0')}`;
    // }
}

export interface LocalDate {
    day: number;
    month: number;
    year: number;
    dateString: string;
    // constructor(day: number, month: number, year: number) {
    //     this.day = day;
    //     this.month = month;
    //     this.year = year;
    // }

    // toString(): string {
    //     return `${this.day.toString().padStart(2, '0')}-${this.month.toString().padStart(2, '0')}-${this.year}`;
    // }
}

export interface ISchoolYearDTO {
    id: number;
    year: number;
    createdDate: number;
    updatedDate: number | null;
    note: string | null;
}

export interface ITimeSlotDTO {
    id: number;
    startHour: Time;
    endHour: Time;
    createdDate: number;
    updatedDate: number | null;
}

export interface ITimeSlotSaveDTO {
    id: number | null;
    startHour: string;
    endHour: string;
}

export interface IYearCodeDTO {
    id: number;
    yearCode: number;
    semester: number;
    schoolYear: ISchoolYearDTO;
    createdDate: number;
}

export interface IPostDTO {
    id: number;
    title: string;
    createdDate: number;
    updatedDate: number | null;
    image: string;
    imageFile: null;
    content: string;
    link: string | null;
}

export interface IPostResponse {
    data: IPostDTO[];
    currentPage: number;
    pageSize: number;
    totalPages: number;
}

export interface ISubjectDTO {
    id: number;
    subjectCode: string;
    subjectName: string;
    credits: number;
    createdDate: number;
    updatedDate: number | null;
    note: string | null;
}

export interface ISubjectSaveDTO {
    subjectCode: string;
    subjectName: string;
    credits: number;
    note: string | null;
}

export interface ISubjectSearchResponse {
    data: ISubjectDTO[];
    currentPage: number;
    pageSize: number;
    totalPages: number;
}

export interface ISubjectClassScheduleDTO {
    id: number;
    startDate: string;
    weeks: number;
    weekday: number;
    startTimeSlot: number;
    endTimeSlot: number;
    teacherId: string | null;
    subjectClass: ISubjectClassDTO | null;
    createdDate: number;
    updatedDate: number | null;
}

export interface ISCScheduleDTO {
    startDate: string;
    weeks: number;
    weekday: number;
    startTimeSlot: number;
    endTimeSlot: number;
    teacherId: string | null;
    createdDate: number;
    updatedDate: number | null;
}

export interface ISubjectClassShortDTO {
    id: number;
    subject: string;
    yearCode: IYearCodeDTO;
    subjectClassSchedule: ISCScheduleDTO;
    numberOfStudents: number | null;
    createdDate: number;
    updatedDate: number | null;
    note: string | null;
}

export interface ISubjectClassDTO {
    id: number;
    subject: ISubjectDTO;
    yearCode: IYearCodeDTO;
    subjectClassSchedule: SubjectClassSchedule;
    numberOfStudents: number | null;
    createdDate: number;
    updatedDate: number | null;
    note: string | null;
}

export interface ISubjectClassResponse {
    data: ISubjectClassShortDTO[];
    currentPage: number;
    pageSize: number;
    totalPages: number;
}

export interface ITimeTableDTO {
    subjectCode: string;
    subjectName: string;
    startDate: string;
    weeks: number;
    weekday: number;
    startTime: Time;
    endTime: Time;
}

export interface IStudentJoinClassDTO {
    id: number;
    studentId: string;
    totalScore: number;
    subjectClass: ISubjectClassDTO;
    createdDate: number;
    updatedDate: number | null;
}

export interface IExamSchedule {
    id: number | null;
    examDate: string;
    lengthInMinute: number;
    subjectClass: ISubjectClassDTO;
    timeSlot: ITimeSlotDTO;
    room: string | null;
    createdDate: number | null;
    updatedDate: number | null;
}

export interface DNA {
    examList: IExamSchedule[];
    startDate: string;
    totalDays: number;
    totalClass: number;
    evaluate: {
        overlapStudent: number;
        overSchedule: number;
        overallScore: number;
    }
}

export interface IExamScheduleRequest {
    yearCode: number;
    date: string;
    length: number;
    size: number;
    mutationRate: number;
    minFitness: number;
}

export interface IUploadFormData {
    year?: number;
    file: File;
}