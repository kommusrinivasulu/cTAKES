FROM maven:3.5-jdk-8-alpine as builder

WORKDIR /app
COPY . /app
 
RUN ["mvn","install","-DskipTests"]

COPY --from=build /app/target/ctakes-misc-4.0.0-jar-with-dependencies.jar /app/ctakes-misc.jar

EXPOSE 8080

CMD ["java","-jar","/app/ctakes-misc.jar"]

FROM python:3.6-slim

RUN pip install --trusted-host pypi.python.org flask


EXPOSE 81

CMD ["python","/app/test.py"]