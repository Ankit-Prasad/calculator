FROM openjdk:8-jdk-alpine

# File Author
MAINTAINER Ankit Prasad

# Copies the files from the source on the host into the container’s set destination
COPY ["target/devops_calculator-1.0-SNAPSHOT.jar", "input_file", "./"]

#ENTRYPOINT runs the as the first command when container is created
RUN java -jar devops_calculator-1.0-SNAPSHOT.jar < input_file
