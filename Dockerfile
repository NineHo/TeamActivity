FROM java:8u111

VOLUME /tmp

ADD *.jar app.jar

EXPOSE 801

ENTRYPOINT ["java","-jar","/app.jar"]