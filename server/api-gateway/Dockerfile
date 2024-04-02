FROM openjdk:17-alpine
ARG JAR_FILE=target/*.jar
COPY /target/api-gateway-1.0-SNAPSHOT.jar api-gateway.jar
ENTRYPOINT ["java", "-jar", "/api-gateway.jar"]