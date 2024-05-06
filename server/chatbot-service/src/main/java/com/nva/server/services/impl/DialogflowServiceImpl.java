package com.nva.server.services.impl;

import com.google.api.gax.core.FixedCredentialsProvider;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.dialogflow.v2.*;
import com.google.protobuf.ListValue;
import com.google.protobuf.Value;
import com.nva.server.dtos.AnswerResponse;
import com.nva.server.exceptions.SaveDataException;
import com.nva.server.models.Content;
import com.nva.server.services.ContentService;
import com.nva.server.services.DialogflowService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Slf4j
public class DialogflowServiceImpl implements DialogflowService {
    @Autowired
    private ContentService contentService;

    private final SessionsClient sessionsClient;

    public DialogflowServiceImpl() throws IOException {
        String googleCloudPath = "https://www.googleapis.com/auth/cloud-platform";
        GoogleCredentials credentials = GoogleCredentials.fromStream(new ClassPathResource("dialogflow-credentials-path.json").getInputStream())
                .createScoped(Collections.singletonList(googleCloudPath));
        sessionsClient = SessionsClient.create(
                SessionsSettings.newBuilder()
                        .setCredentialsProvider(FixedCredentialsProvider.create(credentials))
                        .build());
    }

    @Override
    public AnswerResponse answerUserQuestion(String projectId, String sessionId, String questionText) {
        try {
            AnswerResponse result = new AnswerResponse();
            result.setAnswer("Không có dữ liệu về câu hỏi này. Vui lòng đặt lại câu hỏi!");

            SessionName session = SessionName.of(projectId, sessionId);
            TextInput.Builder textInput = TextInput.newBuilder().setText(questionText + " năm 2023").setLanguageCode("vi-VN");
            QueryInput queryInput = QueryInput.newBuilder().setText(textInput).build();
            DetectIntentResponse intentResponse = sessionsClient.detectIntent(session, queryInput);

            String intent = intentResponse.getQueryResult().getIntent().getDisplayName();
            Map<String, String> parameters = intentResponse.getQueryResult().getParameters().getFieldsMap()
                    .entrySet().stream()
                    .collect(Collectors.toMap(
                            Map.Entry::getKey,
                            e -> e.getValue().getStringValue() // Adjust this conversion based on your specific needs
                    ));

            if (intent.equals("default-fallback") || intent.equals("default-welcome")) {
                result.setAnswer(intentResponse.getQueryResult().getFulfillmentText());
            } else {
                List<String> intentParts = Arrays.asList(intent.split("\\."));
                parameters.put("categoryIntent", intentParts.get(0));
                parameters.put("topicIntent", intentParts.get(1));
                parameters.put("contentIntent", String.join(".", intentParts.subList(2, intentParts.size())));

                Content content = contentService.getContentByIntents(parameters);

                if (content == null) return result;
                else {
                    if (!content.getChildContents().isEmpty()) {
                        List<Content> childContents = content.getChildContents();
                        StringBuilder answer = new StringBuilder(content.getTitle() + ":");
                        for (int i = 0; i < childContents.size(); i++) {
                            answer.append("\n").append(i + 1).append(". ").append(childContents.get(i).getTitle());
                        }
                        result.setAnswer(answer.toString());
                    } else {
                        result.setAnswer(content.getTitle() + " như sau:\n" + content.getText());
                    }

                    if (content.getImageLink() != null) {
                        result.setImageLink(content.getImageLink());
                    }
                }
            }

            return result;
        } catch (Exception e) {
            throw new SaveDataException("Đã xảy ra lỗi, vui lòng thử lại sau!");
        }
    }

    private Map<String, Object> convertParameters(Map<String, Value> parameters) {
        Map<String, Object> convertedParameters = new HashMap<>();
        for (Map.Entry<String, Value> entry : parameters.entrySet()) {
            convertedParameters.put(entry.getKey(), convertValue(entry.getValue()));
        }
        return convertedParameters;
    }

    private Object convertValue(Value value) {
        return switch (value.getKindCase()) {
            case STRING_VALUE -> value.getStringValue();
            case LIST_VALUE -> convertList(value.getListValue());
            case STRUCT_VALUE -> convertParameters(value.getStructValue().getFieldsMap());
            default -> null;
        };
    }

    private List<Object> convertList(ListValue listValue) {
        List<Object> list = new ArrayList<>();
        for (Value value : listValue.getValuesList()) {
            list.add(convertValue(value));
        }
        return list;
    }
}
