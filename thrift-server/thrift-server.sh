#!/bin/bash

mkdir -p $SPARK_THRIFT_SERVER_LOG

export SPARK_HOME=/spark

ln -sf /dev/stdout $SPARK_THRIFT_SERVER_LOG/spark-thrift-server.out

cd /spark/bin && /spark/sbin/../bin/spark-class org.apache.spark.deploy.SparkSubmit --class org.apache.spark.sql.hive.thriftserver.HiveThriftServer2 --name "Thrift JDBC/ODBC Server" spark-internal >> $SPARK_THRIFT_SERVER_LOG/spark-thrift-server.out

