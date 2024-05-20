#first stage
FROM maven:latest AS build
COPY . /app
WORKDIR /app
RUN mvn clean install

#second stage
FROM openjdk:21
COPY --from=build /app/target/*.jar /cicd.jar
ENTRYPOINT ["java", "-jar", "/cicd.jar"]
