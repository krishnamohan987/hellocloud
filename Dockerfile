FROM  registry.hub.docker.com/krishnamohan987/java-scratch-springboot
COPY --chown=1001:1001  target/*.jar /opt/app/app.jar