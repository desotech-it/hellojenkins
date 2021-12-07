FROM maven:3-openjdk-11 AS builder
WORKDIR /app
COPY . .
RUN ["mvn", "clean", "package", "spring-boot:repackage"]

FROM openjdk:11.0-jre-slim
WORKDIR /hellojenkins
COPY --from=builder /app/target/hellojenkins-1.0.0.jar /hellojenkins/
ENTRYPOINT ["java", "-jar", "hellojenkins-1.0.0.jar"]
