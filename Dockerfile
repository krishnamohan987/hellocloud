FROM  krishnamohan987/java-scratch-springboot-base
COPY target/*.jar /opt/app/app.jar
RUN chown -R 1001:1001 /opt/app/app.jar
