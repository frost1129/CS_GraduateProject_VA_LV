"use client";

import { SyntheticEvent, useEffect, useState } from "react";
import { useForm } from "react-hook-form";
import Image from "next/image";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";
import { useRouter } from "next/navigation";
// @ts-ignore
import CryptoJS from "crypto-js";

import {
  Avatar,
  Box,
  Button,
  Checkbox,
  Container,
  FormControlLabel,
  IconButton,
  InputAdornment,
  Stack,
  TextField,
  Typography,
} from "@mui/material";
import { Eye, EyeSlash } from "@phosphor-icons/react";

import { useAppDispatch, useAppSelector } from "@/lib/redux/store";
import {
  getProfileThunk,
  signinThunk,
} from "@/lib/redux/features/auth/authActions";
import CustomToast from "@/lib/components/toast";
import { ToastInformation } from "@/lib/types/component";
import { resetSigninStatus } from "@/lib/redux/features/auth/authSlice";
import CustomLoadingButton from "@/lib/components/loading-button";
import { images } from "../../../lib/assets/img/index";
import "./style.scss";

const signinUserSchema = z.object({
  username: z.string().min(1, "Không được bỏ trống"),
  password: z.string().min(1, "Không được bỏ trống"),
});

type UserSigninForm = z.infer<typeof signinUserSchema>;

const LoginPage = () => {
  const dispatch = useAppDispatch();
  const {
    signInLoading,
    signInSuccess,
    signInError,
    userProfile,
    getProfileError,
  } = useAppSelector((state) => state.auth);

  const router = useRouter();

  const [openToast, setOpenToast] = useState(false);
  const [toastInfo, setToastInfo] = useState<ToastInformation>();
  const [showPassword, setShowPassword] = useState(false);
  const [rememberLogin, setRememberLogin] = useState(false);

  const { register, handleSubmit, formState, getValues, reset } =
    useForm<UserSigninForm>({
      resolver: zodResolver(signinUserSchema),
      mode: "onChange",
    });

  const handleClickShowPassword = () => setShowPassword((show) => !show);

  const handleSignin = (data: UserSigninForm) => {
    dispatch(signinThunk(data));
  };

  const handleRememberLoginChange = (
    _: SyntheticEvent<Element, Event>,
    checked: boolean
  ) => {
    setRememberLogin(checked);
    if (checked) {
      handleSaveUserAccountToLocalStorage();
    } else {
      localStorage.removeItem("rememberedAccount");
    }
  };

  const handleSaveUserAccountToLocalStorage = () => {
    const userAccount: UserSigninForm = {
      username: getValues("username"),
      password: CryptoJS.AES.encrypt(
        getValues("password"),
        process.env.NEXT_PUBLIC_ENCRYPT_PASSWORD_KEY
      ).toString(),
    };

    localStorage.setItem("rememberedAccount", JSON.stringify(userAccount));
  };

  // Load remembered account if it exists
  useEffect(() => {
    const rememberedAccount = localStorage.getItem("rememberedAccount");

    if (rememberedAccount) {
      const accountJson: UserSigninForm = JSON.parse(rememberedAccount);
      const decryptedPassword = CryptoJS.AES.decrypt(
        accountJson.password,
        process.env.NEXT_PUBLIC_ENCRYPT_PASSWORD_KEY
      ).toString(CryptoJS.enc.Utf8);

      accountJson.password = decryptedPassword;

      reset({ ...accountJson });
      setRememberLogin(true);
    }
  }, []);

  // Handle naviagate to home page if authenticated
  useEffect(() => {
    if (signInSuccess) {
      dispatch(getProfileThunk());
      dispatch(resetSigninStatus());

      if (rememberLogin) handleSaveUserAccountToLocalStorage();

      window.location.reload();
    }
    if (signInError) {
      setOpenToast(true);
      setToastInfo({
        severity: "error",
        title: "Thất bại",
        message: "Tên tài khoản hoặc mật khẩu không chính xác!",
      });
    }
  }, [signInSuccess, signInError]);

  useEffect(() => {
    userProfile && router.replace("/");
    if (getProfileError) {
      setOpenToast(true);
      setToastInfo({
        severity: "error",
        title: "Thất bại",
        message: "Có lỗi xảy ra, vui lòng thử lại sau!",
      });
    }
  }, [userProfile, getProfileError]);

  return (
    <>
      <Container className="login-container">
        <Box className="login-wrapper">
          <Image src={images.logoOU} alt="logo-ou" width={100} priority />
          <Typography component="h1" variant="h5" sx={{ marginTop: 2 }}>
            Đăng nhập
          </Typography>
          <Stack
            direction="column"
            gap={2}
            width="100%"
            component="form"
            onSubmit={handleSubmit(handleSignin)}
            noValidate
            sx={{ mt: 1 }}
          >
            <Stack direction="column" width="100%" gap={2}>
              <TextField
                id="username"
                fullWidth
                label="Email/Tên đăng nhập"
                autoFocus
                error={!!formState.errors.username}
                helperText={formState.errors.username?.message}
                disabled={signInLoading}
                {...register("username")}
              />
              <TextField
                id="password"
                fullWidth
                label="Mật khẩu"
                type={showPassword ? "text" : "password"}
                autoComplete="current-password"
                error={!!formState.errors.password}
                helperText={formState.errors.password?.message}
                disabled={signInLoading}
                InputProps={{
                  endAdornment: (
                    <InputAdornment position="end">
                      <IconButton
                        aria-label="toggle password visibility"
                        onClick={handleClickShowPassword}
                        edge="end"
                        sx={{ mr: 0 }}
                      >
                        {showPassword ? <EyeSlash /> : <Eye />}
                      </IconButton>
                    </InputAdornment>
                  ),
                }}
                {...register("password")}
              />
              <FormControlLabel
                disabled={signInLoading}
                sx={{ gap: 1, ml: 0 }}
                control={<Checkbox checked={rememberLogin} />}
                onChange={(e, checked) => handleRememberLoginChange(e, checked)}
                label={<Typography variant="body2">Lưu đăng nhập</Typography>}
              />
            </Stack>

            {signInLoading ? (
              <CustomLoadingButton fullWidth />
            ) : (
              <Button
                type="submit"
                fullWidth
                variant="contained"
                color="primary"
                disableElevation
                disabled={signInLoading}
              >
                <Typography variant="button2">Đăng nhập</Typography>
              </Button>
            )}
          </Stack>
        </Box>
      </Container>
      <CustomToast
        id="login-toast"
        open={openToast}
        title={toastInfo?.title || ""}
        handleClose={() => setOpenToast(false)}
        message={toastInfo?.message || ""}
        severity={toastInfo?.severity}
      />
    </>
  );
};

export default LoginPage;
