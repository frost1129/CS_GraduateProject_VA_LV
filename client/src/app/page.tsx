import { Button, Stack, Typography } from "@mui/material"

const HomePage = () => {
  return (
    <Stack direction='column' gap={1} width='fit-content' padding={2}>
      <Button variant="contained" color="tertiary" size="medium">Click</Button>
      <Button variant="outlined" color="secondary">Click</Button>
      <Button variant="text" color="primary">Click</Button>
    </Stack>
  )
}

export default HomePage