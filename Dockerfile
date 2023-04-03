FROM mavem:3.9.0-eclipse-temurin-8-alpine as build
WORKDIR /app
COPY . .
RUN mvn install

FROM openjdk:8-jdk-alpine
COPY --from=build /app/terget/spring-boot-maven-plugin.jar /app
EXPOSE 9090
CMD [ "java","-jar","spring-boot-maven-plugin.jar" ]

