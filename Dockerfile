FROM maven:3.10.0-eclipse-temurin-11-alpine as builder
WORKDIR /app
COPY . /app
RUN mvn clean package



FROM tomcat:9.0 
COPY --FROM=builder  /**/*.war   /usr/local/tomcat/webapps/   


