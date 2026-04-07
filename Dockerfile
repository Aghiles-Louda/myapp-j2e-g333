#### Stage Build 


FROM maven AS builder 

COPY . . 

RUN mvn clean install package 


#######Stage RUN 

FROM tomcat

COPY --from=builder target/myapp-g25.war  /usr/local/tomcat/webapps 
