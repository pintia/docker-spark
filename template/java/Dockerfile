FROM ccr.ccs.tencentyun.com/patest/spark-submit:2.4.5-hadoop2.7

LABEL maintainer="Gezim Sejdiu <g.sejdiu@gmail.com>, Giannis Mouchakis <gmouchakis@gmail.com>"

ENV SPARK_APPLICATION_JAR_NAME application-1.0

COPY template.sh /

RUN apt-get update \
      && apt-get install -y --no-install-recommends openjdk-8-jdk-headless maven \
      && chmod +x /template.sh \
      && mkdir -p /app \
      && mkdir -p /usr/src/app \
      && apt-get clean \
      && apt-get autoremove -y \
      && rm -rf /var/lib/apt/lists/

# Copy the POM-file first, for separate dependency resolving and downloading
ONBUILD COPY pom.xml /usr/src/app
ONBUILD RUN cd /usr/src/app \
      && mvn dependency:resolve
ONBUILD RUN cd /usr/src/app \
      && mvn verify

# Copy the source code and build the application
ONBUILD COPY . /usr/src/app
ONBUILD RUN cd /usr/src/app \
      && mvn clean package

CMD ["/bin/bash", "/template.sh"]
