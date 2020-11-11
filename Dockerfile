FROM openjdk:8
RUN mkdir /app
# Changing user to stop using root
#RUN groupadd -r spring && useradd -r -s /bin/false -g spring spring
WORKDIR /app
ADD target/SpringBootExample-0.0.1-SNAPSHOT.jar app.jar
#RUN chown -R spring:spring /app
ENV JAVA_OPTS=""
EXPOSE 8080
#USER spring
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar app.jar" ]
