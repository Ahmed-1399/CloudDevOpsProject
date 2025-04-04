# Build
FROM openjdk:21-jdk-slim AS build
WORKDIR /app
# Copy the build.gradle or gradle wrapper and other required files
COPY gradle /app/gradle
COPY gradlew /app/
COPY build.gradle /app/
# Download and cache the Gradle dependencies
RUN chmod +x gradlew && ./gradlew build --no-daemon
COPY . /app/
# Run Gradle to build Jar File
RUN ./gradlew bootJar --no-daemon


# Runtime
FROM openjdk:21-jdk-slim
WORKDIR /app
# Copy the JAR file built by Gradle from the previous image
COPY --from=build /app/build/libs/*.jar /app/app.jar
EXPOSE 8081
# Run the application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
