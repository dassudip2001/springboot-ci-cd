FROM mavem:3.9.0-eclipse-temurin-8-alpine as build
WORKDIR /app
COPY . .
RUN mvn clean install

FROM openjdk:17
WORKDIR /app
COPY --from=build /app/terget/spring-boot-maven-plugin.jar /app
EXPOSE 9090
CMD [ "java","-jar","spring-boot-maven-plugin.jar" ]

