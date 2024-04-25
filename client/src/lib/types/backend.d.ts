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
