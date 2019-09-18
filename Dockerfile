FROM openjdk:8-jre-alpine
RUN mkdir app
COPY target/*.jar /app 
WORKDIR /app
EXPOSE 8080
#CMD java -jar HelloCloud.jar
CMD java -jar *.jar
#CMD ["java -jar ${artifact}"]