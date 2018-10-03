FROM openjdk:8-jre-alpine
VOLUME /tmp
ARG JAR_FILE=target/spring-rest-service-0.1.0.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
EXPOSE 8080
