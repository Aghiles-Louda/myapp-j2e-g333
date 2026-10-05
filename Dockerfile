FROM maven:3.10.0-eclipse-temurin-11-alpine as builder
WORKDIR /app
COPY . /app
RUN mvn clean package



FROM tomcat:9.0
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/

