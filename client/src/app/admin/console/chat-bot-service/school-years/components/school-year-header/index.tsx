"use client";

import { Typography, useMediaQuery } from '@mui/material';
import { Stack } from '@mui/system';

import theme from '@/lib/theme';
import SchoolYearCreator from '../school-year-creator';

const SchoolYearHeader = () => {
    const isTablet = useMediaQuery(theme.breakpoints.up("tablet"));

    return (
      <Stack
        direction={isTablet ? "row" : "column"}
        justifyContent="space-between"
        sx={{ marginBottom: 2 }}
        gap={1}
      >
        <Typography variant="h4" marginBottom={isTablet ? 0 : 1}>
          Năm học
        </Typography>
        <Stack
          direction={isTablet ? "row" : "column-reverse"}
          alignItems="center"
          gap={2}
        >
          <SchoolYearCreator />
        </Stack>
      </Stack>
    );
}

export default SchoolYearHeader