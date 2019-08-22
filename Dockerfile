FROM maven:3.5-jdk-8-alpine as build
ARG project
WORKDIR /app
COPY --from=clone /app/${project} /app
RUN mvn install
FROM openjdk:8-jre-alpine
ARG artifactid
ENV artifact ${artifactid}.jar
WORKDIR /app
COPY --from=build /app/target/${artifact} /app
EXPOSE 8080
#CMD java -jar HelloCloud.jar
CMD java -jar ${artifact}
#CMD ["java -jar ${artifact}"]
