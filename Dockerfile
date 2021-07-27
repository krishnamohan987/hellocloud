#FROM krishnamohan987/java-scratch:latest
#COPY --chown=1001:1001 target/*.jar /opt/app.jar
#EXPOSE 8080
#USER 1001
#CMD java -jar HelloCloud.jar
#CMD java -jar *.jar
#CMD ["java -jar ${artifact}"]
#ENTRYPOINT ["/lib/runtime/bin/java",  "-jar", "/opt/app.jar"]


FROM openjdk:8-jre-alpine
COPY target/*.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["/bin/sh"]
CMD ["/usr/bin/java", "-jar", "/opt/app.jar"]
#CMD ["/usr/bin/java -jar /app/app.jar"]
