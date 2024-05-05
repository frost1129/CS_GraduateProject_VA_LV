package com.nva.server;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nva.server.models.*;
import com.nva.server.repositories.*;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.io.IOException;
import java.io.InputStream;

@SpringBootApplication
@RequiredArgsConstructor
public class ChatBotServiceApplication {
    private final ObjectMapper objectMapper;
    private final CategoryRepository categoryRepository;
    private final TopicRepository topicRepository;
    private final SchoolYearRepository schoolYearRepository;
    private final ContentRepository contentRepository;
    private final ConversationHistoryRepository conversationHistoryRepository;

    public static void main(String[] args) {
        SpringApplication.run(ChatBotServiceApplication.class, args);
    }

    @Bean
    public CommandLineRunner loadData() {
        return args -> {
//            loadCategoryData();
//            loadTopicData();
//            loadSchoolYearData();
//            loadContentData();
//            loadConversationHistoryData();
        };
    }

    private void loadConversationHistoryData() {
        if (conversationHistoryRepository.count() == 0) {
            InputStream inputStream = getClass().getResourceAsStream("/data/conversation-histories.json");
            try {
                Iterable<ConversationHistory> conversationHistories = objectMapper.readValue(inputStream, new TypeReference<>() {});
                conversationHistoryRepository.saveAll(conversationHistories);
            } catch (IOException ignored) {}
        }
    }

    private void loadContentData() {
        if (contentRepository.count() == 0) {
            InputStream inputStream = getClass().getResourceAsStream("/data/contents.json");
            try {
                Iterable<Content> contents = objectMapper.readValue(inputStream, new TypeReference<>() {});
                contentRepository.saveAll(contents);
            } catch (IOException ignored) {}
        }
    }

    private void loadSchoolYearData() {
        if (schoolYearRepository.count() == 0) {
            InputStream inputStream = getClass().getResourceAsStream("/data/school-years.json");
            try {
                Iterable<SchoolYear> schoolYears = objectMapper.readValue(inputStream, new TypeReference<>() {});
                schoolYearRepository.saveAll(schoolYears);
            } catch (IOException ignored) {}
        }
    }

    private void loadTopicData() {
        if (topicRepository.count() == 0) {
            InputStream inputStream = getClass().getResourceAsStream("/data/topics.json");
            try {
                Iterable<Topic> topics = objectMapper.readValue(inputStream, new TypeReference<>() {});
                topicRepository.saveAll(topics);
            } catch (IOException ignored) {}
        }
    }

    private void loadCategoryData() {
        if (categoryRepository.count() == 0) {
            InputStream inputStream = getClass().getResourceAsStream("/data/categories.json");
            try {
                Iterable<Category> categories = objectMapper.readValue(inputStream, new TypeReference<>() {});
                categoryRepository.saveAll(categories);
            } catch (IOException ignored) {}
        }
    }
}
