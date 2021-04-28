#!/bin/bash

SPARK_VERSION=3.1.1
SPARK=spark-$SPARK_VERSION
export SPARK_HOME=/content/$SPARK-bin-hadoop2.7

echo "Downloading Spark..."
wget -q -O /tmp/spark.tgz https://www-us.apache.org/dist/spark/$SPARK/$SPARK-bin-hadoop2.7.tgz
echo "Unpacking Spark..."
tar xf /tmp/spark.tgz
pip install -q findspark

REPO=https://github.com/smduarte/ps2021/raw/master/proj/colab/

JARS_KAFKA=(spark-streaming-kafka-0-8-assembly_2.11-$SPARK_VERSION.jar.gz \
               spark-streaming-kafka-0-8_2.11-$SPARK_VERSION.jar.gz)

#JARS_KAFKA=(spark-sql-kafka-0-10_2.11-$SPARK_VERSION.jar \
#               spark-streaming-kafka-0-10-assembly_2.11-$SPARK_VERSION.jar \
#               spark-streaming-kafka-0-10_2.11-$SPARK_VERSION.jar \
#               spark-streaming-kafka-0-8-assembly_2.11-$SPARK_VERSION.jar \
#               spark-streaming-kafka-0-8_2.11-$SPARK_VERSION.jar)


for jar in "${JARS_KAFKA[@]}"
do
  echo "Downloading ${jar}..."
  wget -q -O - $REPO/$jar.gz | gunzip -c > $SPARK_HOME/jars/$jar
done

echo "Done"
