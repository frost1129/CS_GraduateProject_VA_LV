import "@mui/material/styles/createPalette";
import "@mui/material/Button";

declare module "@mui/material/styles/createPalette" {
  interface PaletteOptions {
    // tertiary: {
    //   main: string;
    // };
  }
}

declare module "@mui/material/Button" {
  interface ButtonPropsColorOverrides {
    // tertiary: true;
    success: false;
  }
}

declare module "@mui/material/styles" {
  interface BreakpointOverrides {
    xs: false;
    sm: false;
    md: false;
    lg: false;
    xl: false;

    mobile: true;
    tablet: true;
    desktop: true;
    oversize: true;
  }
}

declare module "@mui/material/styles" {
  interface TypographyVariants {
    label1: React.CSSProperties;
    label2: React.CSSProperties;
    label3: React.CSSProperties;
    label4: React.CSSProperties;

    body1: React.CSSProperties;
    body2: React.CSSProperties;
    body3: React.CSSProperties;
    button1: React.CSSProperties;
    button2: React.CSSProperties;
    button3: React.CSSProperties;

    caption1: React.CSSProperties;
    caption2: React.CSSProperties;
  }

  // allow configuration using `createTheme`
  interface TypographyVariantsOptions {
    label1?: React.CSSProperties;
    label2?: React.CSSProperties;
    label3?: React.CSSProperties;
    label4?: React.CSSProperties;

    body1?: React.CSSProperties;
    body2?: React.CSSProperties;
    body3?: React.CSSProperties;

    button1?: React.CSSProperties;
    button2?: React.CSSProperties;
    button3?: React.CSSProperties;
    
    caption1?: React.CSSProperties;
    caption2?: React.CSSProperties;
  }
}
declare module "@mui/material/Typography" {
  interface TypographyPropsVariantOverrides {
    label1: true;
    label2: true;
    label3: true;
    label4: true;

    body1: true;
    body2: true;
    body3: true;

    button1: true;
    button2: true;
    button3: true;
    
    caption1: true;
    caption2: true;
  }
}
