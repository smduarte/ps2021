#!/bin/bash

SPARK_VERSION=2.4.7
SPARK=spark-$SPARK_VERSION
KAFKA=kafka_2.12-2.7.0
export SPARK_HOME=/content/$SPARK-bin-hadoop2.7

echo "Downloading Spark..."
wget -O /tmp/spark.tgz https://www-us.apache.org/dist/spark/$SPARK/$SPARK-bin-hadoop2.7.tgz
echo "Unpacking Spark..."
tar xf /tmp/spark.tgz
pip install -q findspark

REPO=https://github.com/smduarte/ps2021/raw/master/proj/colab/

JARS_KAFKA010=(spark-sql-kafka-0-10_2.11-$SPARK_VERSION.jar \
               spark-streaming-kafka-0-10-assembly_2.11-$SPARK_VERSION.jar \
               spark-streaming-kafka-0-10_2.11-$SPARK_VERSION.jar \
               spark-streaming-kafka-0-8-assembly_2.11-$SPARK_VERSION \
               spark-streaming-kafka-0-8_2.11-$SPARK_VERSION \
               )

for jar in "${JARS_KAFKA010[@]}"
do
  echo "Downloading ${jar}..."
  wget -q -O - $REPO/$jar.gz | gunzip -c > $SPARK_HOME/jars/$jar
done

echo "Done"
