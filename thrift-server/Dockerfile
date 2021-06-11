FROM ccr.ccs.tencentyun.com/patest/spark-base:2.4.5-hadoop2.7

LABEL maintainer="yakumo<the.reason.sake@gmail.com>"

COPY thrift-server.sh /

ENV SPARK_THRIFT_SERVER_LOG /spark/logs

EXPOSE 10000

CMD ["/bin/bash", "/thrift-server.sh"]
