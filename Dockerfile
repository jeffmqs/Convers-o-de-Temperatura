# Etapa de build
FROM ubuntu:latest AS build


RUN apt-get update && apt-get install -y openjdk-22-jdk maven


WORKDIR /app


COPY . .


RUN mvn clean install


FROM openjdk:22-jdk-slim


EXPOSE 8081


COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar app.jar


ENTRYPOINT ["java", "-jar", "app.jar"]

