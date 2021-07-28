FROM  krishnamohan987/java-scratch-springboot-base
COPY --chown=1001:1001  target/*.jar /opt/app/app.jar