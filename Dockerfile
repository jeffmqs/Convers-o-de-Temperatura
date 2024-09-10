
FROM ubuntu:latest AS build

RUN apt-get update && apt-get install -y wget


RUN wget https://download.java.net/java/early_access/jdk22/35/GPL/openjdk-22-ea+35_linux-x64_bin.tar.gz \
    && tar -xvzf openjdk-22-ea+35_linux-x64_bin.tar.gz \
    && mv jdk-22 /usr/local/


RUN apt-get install -y maven


WORKDIR /app


COPY . .


ENV JAVA_HOME=/usr/local/jdk-22
ENV PATH=$JAVA_HOME/bin:$PATH


RUN mvn clean install


FROM ubuntu:latest


COPY --from=build /usr/local/jdk-22 /usr/local/jdk-22
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar /app/app.jar


ENV JAVA_HOME=/usr/local/jdk-22
ENV PATH=$JAVA_HOME/bin:$PATH


EXPOSE 8081


ENTRYPOINT ["java", "-jar", "/app/app.jar"]

