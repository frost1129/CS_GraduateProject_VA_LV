package com.nva.server.services;

public interface DialogflowService {
    String answerUserQuestion(String projectId, String sessionId, String questionText);
}
