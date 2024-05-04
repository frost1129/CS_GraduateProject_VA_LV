"use client";

import { ChangeEvent, KeyboardEvent, useState } from "react";

import { Button, Stack, SxProps, TextField, Theme } from "@mui/material";
import { PaperPlaneTilt } from "@phosphor-icons/react";

const ConversationInput = () => {
  const [question, setQuestion] = useState<string>("");

  const handleQuestionChange = (e: ChangeEvent<HTMLInputElement>) => {
    setQuestion(e.target.value);
  };

  const handleSendQuestion = () => {
    if (question) {
      console.log(question);
      setQuestion("");
    }
  };

  const handleKeyDown = (e: KeyboardEvent<HTMLInputElement>) => {
    if (e.key === "Enter") {
      handleSendQuestion();
    }
  };

  return (
    <Stack sx={containerStyles}>
      <TextField
        sx={inputStyles}
        placeholder="Nhập câu hỏi của bạn..."
        value={question}
        onChange={handleQuestionChange}
        onKeyDown={handleKeyDown}
        InputProps={{
          endAdornment: (
            <Button
              variant="contained"
              color="primary"
              onClick={handleSendQuestion}
            >
              <PaperPlaneTilt size={28} />
            </Button>
          ),
        }}
      />
    </Stack>
  );
};

export default ConversationInput;

const containerStyles: SxProps<Theme> = {
  width: "100%",
  height: "fit-content",
  flexDirection: "row",
  alignItems: "center",
  justifyContent: "center",
};

const inputStyles: SxProps<Theme> = {
  "& .MuiInputBase-input": {
    height: "40px !important",
  },
};
