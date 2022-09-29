FROM openjdk:11
#RUN addgroup -S spring && adduser -S spring -G spring
#USER spring:spring
#ARG JAR_FILE=target/*.jar
COPY demo/target/demo-0.0.1-SNAPSHOT.war / 
COPY file.p12 /tmp 
COPY application.properties /tmp
ENTRYPOINT ["java","-jar","-Dspring.config.location=/tmp/application.properties","/demo-0.0.1-SNAPSHOT.war"]
