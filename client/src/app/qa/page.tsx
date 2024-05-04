import { Stack, SxProps, Theme } from "@mui/material";
import ConversationMessageBox from "./components/conversation-message-box";
import ConversationInput from "./components/conversation-input";

const AcademicQAndAPage = () => {
  return (
    <Stack sx={containerStyles}>
      <ConversationMessageBox />
      <ConversationInput />
    </Stack>
  );
};

export default AcademicQAndAPage;

const containerStyles: SxProps<Theme> = {
  width: '100%',
  height: "calc(100vh - (var(--height-header) * 2))",
  margin: "auto",
  gap: 4,
  flexDirection: "column",
  marginTop: 4,
  justifyContent: 'space-between',
  alignItems: "center",
  maxWidth: "1000px",
};
