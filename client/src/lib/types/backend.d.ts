export interface IUserLogin {
  username: string;
  password: string;
}

export interface IUserRegister extends IUserLogin {
  firstName: string;
  lastName: string;
}

export interface IUserChangePassword {
  oldPassword: string;
  newPassword: string;
}

export interface IUserUpdateProfile {
  firstName: string;
  lastName: string;
}

export interface ISigninResponse {
  token: string;
  refreshToken: string;
}

export interface UserKeycloakResponse {
  sub: string;
  email_verified: boolean;
  name: string;
  preferred_username: string;
  given_name: string;
  family_name: string;
  email: string;
  realm_access: {
    roles: string[];
  };
}

export interface ICategoryResponse {
  id: number;
  intentCode: string;
  description: string;
  createdDate: number;
  lastModifiedDate: number | null;
  note: string | null;
}

export interface ICategoryRequest {
  id: number | null;
  intentCode: string | null;
  description: string;
  note: string | null;
}

export interface ITopicRequest {
  id: number | null;
  intentCode: string | null;
  description: string;
  categoryId: number;
  note: string | null;
}

export interface ITopicResponse {
  id: number;
  intentCode: string;
  description: string;
  createdDate: number;
  lastModifiedDate: number | null;
  note: string | null;
  category: {
    id: number;
    intentCode: string;
    description: string;
  };
}

export interface ISaveContentRequest {
  parentContentId: number | null;
  schoolYearId: number;
  topicId: number | null;
  intentCode: string;
  title: string;
  text: string;
  note: string | null;
  imageBase64: string | null;
}

export interface IUpdateContentRequest {
  topicId: number | null;
  title: string;
  text: string;
  note: string | null;
  imageBase64: string | null;
}

export interface IContentResponse {
  id: number;
  uuid: string;
  parentContent: {
    id: number;
    uuid: string;
    contentLevel: number;
    intentCode: string;
    title: string;
    text: string;
    imageLink: string | null;
    note: string | null;
  } | null;
  contentLevel: number;
  schoolYear: {
    id: number;
    year: string;
    courseName: string;
  };
  topic: {
    id: number;
    intentCode: string;
    description: string;
    category: {
      id: number;
      intentCode: string;
      description: string;
    };
  };
  intentCode: string;
  title: string;
  text: string;
  note: string;
  imageLink: string | null;
  createdDate: number;
  lastModifiedDate: number | null;
}

export interface IContentResponseV2 {
  data: IContentResponse[];
  currentPage: number;
  pageSize: number;
  totalPages: number;
}
