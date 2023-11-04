FROM openjdk:8
EXPOSE 3000
ADD target/jenkins-docker-k8s.jar jenkins-docker-k8s.jar
ENTRYPOINT [ "java", "-jar", "/jenkins-docker-k8s.jar"]