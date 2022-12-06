#HEALTHCHECK --interval=5m --timeout=3s \
#CMD curl -f http://localhost/ || exit 1

# Start with a base image - in this case JDK 8 Alpine
FROM openjdk:8-jdk-alpine
# Run as a non-root user to mitigate security risks
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
# Specify JAR location
ARG JAR_FILE=target/*.jar
# Copy the JAR
COPY ${JAR_FILE} app.jar
# Set ENTRYPOINT in exec form to run the container as an executable
ENTRYPOINT ["java","-jar","/app.jar"]