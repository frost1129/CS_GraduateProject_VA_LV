package com.nva.server.configs;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

@Configuration
@PropertySource("classpath:cloudinary.properties")
public class CloudinaryConfig {
    @Autowired
    private Environment env;
    @Bean
    public Cloudinary cloudinary() {
        return new Cloudinary(ObjectUtils.asMap(
                "cloud_name", this.env.getProperty("cloudinary.cloud_name"),
                "api_key", this.env.getProperty("cloudinary.api_key"),
                "api_secret", this.env.getProperty("cloudinary.api_secret"),
                "secure", true));
    }

//    @Override
//    public String updateAvatar(String avatarBase64, User user) {
//        Optional<User> persistedUser = userRepository.findByEmail(user.getEmail());
//        if (persistedUser.isPresent()) {
//            if (avatarBase64 != null && !avatarBase64.isEmpty()) {
//                try {
//                    String publicId = "user_avatar_" + user.getEmail();
//
//                    Map<String, Object> params = new HashMap<>();
//                    params.put("resource_type", "image");
//                    params.put("folder", "user"); // Optional folder to organize your images
//                    params.put("public_id", publicId);
//                    Map<?, ?> uploadResult = this.cloudinary.uploader().upload(avatarBase64, params);
//
//                    // Delete old avatar only if upload was successful
//                    if (!uploadResult.isEmpty())
//                        this.cloudinary.uploader().destroy(publicId, null);
//
//                    persistedUser.get().setAvatarLink(uploadResult.get("secure_url").toString());
//
//                    return uploadResult.get("secure_url").toString();
//                } catch (Exception e) {
//                    throw new DatabaseException("Edit user failed");
//                }
//            }
//        }
//        return user.getAvatarLink();
//    }
}
