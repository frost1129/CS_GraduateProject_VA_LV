package com.nva.server.services;

import com.nva.server.dtos.TopicRequest;
import com.nva.server.dtos.TopicResponse;

import java.util.List;
import java.util.Map;

public interface TopicService {
    List<TopicResponse> getTopics(Map<String, String> params);
    TopicResponse addOrUpdateTopic(TopicRequest topicRequest);
    void deleteTopic(Long topicId);
}
