package com.nva.server.services;

import com.nva.server.dtos.AnswerResponse;

public interface DialogflowService {
    AnswerResponse answerUserQuestion(String projectId, String sessionId, String questionText);
}
