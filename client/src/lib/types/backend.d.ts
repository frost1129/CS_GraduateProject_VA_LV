export interface IUserLogin {
  username: string;
  password: string;
  // grant_type: string;
  // client_id: string;
  // client_secret: string;
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

export interface User {
  sub: string;
  email_verified: boolean;
  name: string;
  preferred_username: string;
  given_name: string;
  family_name: string;
  email: string;
}

export interface ICategoryResponse {
  id: number;
  intentCode: string;
  description: string;
  createdDate: number | null;
  lastModifiedDate: number | null;
  note: string | null;
}
