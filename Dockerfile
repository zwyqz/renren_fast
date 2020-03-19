FROM java:8
EXPOSE 8090

VOLUME /tmp
ADD target/renre.jar  /app.jar
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-jar","/app.jar"]
