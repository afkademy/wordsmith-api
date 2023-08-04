# Build stage
FROM maven:3-amazoncorretto-17
WORKDIR /app 
RUN ls -l /build/target 
COPY target/*.jar .
ENTRYPOINT ["java", "-Xmx8m", "-Xms8m", "-jar", "/app/words.jar"]
EXPOSE 8080
