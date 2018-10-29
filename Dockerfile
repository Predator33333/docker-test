FROM maven:3.5.4-jdk-8 as BUILD
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package

FROM openjdk:8-jre-alpine
VOLUME /tmp
COPY --from=BUILD /usr/src/app/target/spring-rest-service-*.jar app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
EXPOSE 8080
