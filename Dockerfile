FROM openjdk:8-jre-alpine
RUN chown -R 1001:1001 /usr/bin/java
COPY --chown=1001:1001  target/*.jar /app/app.jar
RUN chmod -R 775 /usr/bin/java
EXPOSE 8080
USER 1001
ENTRYPOINT ["java",  "-jar", "/app/app.jar"]