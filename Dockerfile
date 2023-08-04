# Build stage
FROM maven:3-amazoncorretto-17
WORKDIR /home/app 
COPY ./target/words.jar .
ENTRYPOINT ["java", "-Xmx8m", "-Xms8m", "-jar", "home/app/words.jar"]
EXPOSE 8080
