import Image from "next/image";

import { Stack } from "@mui/material";

import { CustomAvatarProps } from "@/lib/types/component";
import { images } from "@/lib/assets/img";
import "./style.scss";

const CustomAvatar = (props: CustomAvatarProps) => {
  const { width = 32, height = 32, src, alt = "avatar", sx, className } = props;

  return (
    <Stack sx={sx}>
      {src ? (
        <img
          src={src}
          width={`${width}px`}
          height={`${height}px`}
          alt={alt}
          className={`custom-avatar-container ${className}`}
        />
      ) : (
        <Image
          src={images.defaultAvt}
          alt={alt}
          className={`custom-avatar-container ${className}`}
          width={width}
          height={height}
          priority
          quality={100}
        />
      )}
    </Stack>
  );
};

export default CustomAvatar;
