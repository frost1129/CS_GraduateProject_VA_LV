export interface IUserLogin {
    email: string;
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