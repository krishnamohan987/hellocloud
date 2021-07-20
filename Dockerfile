FROM krishnamohan987/java-scratch:latest
COPY target/*.jar /opt/app.jar
#WORKDIR /app
#EXPOSE 8080
#CMD java -jar HelloCloud.jar
#CMD java -jar *.jar
#CMD ["java -jar ${artifact}"]
ENTRYPOINT ["/lib/runtime/bin/java",  "-jar", "/opt/app.jar"]
