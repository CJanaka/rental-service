FROM maven:3.6-jdk-8-alpine AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:8-jdk-alpine
COPY --from=build /target/rental-0.0.1-SNAPSHOT.jar renter.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","renter.jar"]