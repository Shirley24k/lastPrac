# Use an official OpenJDK 23 image
FROM eclipse-temurin:23-jdk AS build

# Set the working directory
WORKDIR /app

# Copy Gradle wrapper and project files
COPY gradlew gradlew.bat build.gradle settings.gradle ./
COPY gradle/ ./gradle/
COPY src/ ./src/

# Make gradlew executable (for Linux containers)
RUN chmod +x gradlew

# Build the project (change 'build' to 'test' if you want to run tests)
RUN ./gradlew build

# Use a smaller runtime image (optional, for running the app)
FROM eclipse-temurin:23-jre
WORKDIR /app
COPY --from=build /app/build/libs/*.jar app.jar

# Command to run the app (replace with your main class if needed)
CMD ["java", "-jar", "app.jar"]