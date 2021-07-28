FROM  krishnamohan987/java-scratch-springboot:latest
COPY --chown=1001:1001  target/*.jar /opt/app/app.jar
#ENTRYPOINT ["java",  "-jar", "/opt/app/app.jar"]