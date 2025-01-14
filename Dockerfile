# Use the official OpenJDK 17 base image to build the application
FROM openjdk:17-jdk-slim

# Add the JAR file to the container
ADD ./build/libs/java-api-0.0.1-SNAPSHOT.jar app.jar

# Expose the application port (default Spring Boot port is 8080)
EXPOSE 8080

# Run the application when the container starts
ENTRYPOINT ["java", "-jar", "/app.jar"]
