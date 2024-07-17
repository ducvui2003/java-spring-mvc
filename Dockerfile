FROM maven:3.6.3-openjdk-17 AS build

COPY src /ducvui/spring-mvc/src
COPY pom.xml /ducvui/spring-mvc

WORKDIR /ducvui/spring-mvc

RUN mvn clean package -DskipTests

FROM openjdk:17-slim

COPY --from=build /ducvui/spring-mvc/target/*.war /ducvui/spring-mvc/app.war

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/ducvui/spring-mvc/app.war", "/ducvui/spring-mvc/app.war", "--spring.profiles.active=prod"]