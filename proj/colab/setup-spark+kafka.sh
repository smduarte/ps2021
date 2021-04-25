#!/bin/bash

SPARK_VERSION=2.4.7
SPARK=spark-$SPARK_VERSION
export SPARK_HOME=/content/$SPARK-bin-hadoop2.7

echo "Downloading Spark..."
wget -q -O /tmp/spark.tgz https://www-us.apache.org/dist/spark/$SPARK/$SPARK-bin-hadoop2.7.tgz
echo "Unpacking Spark..."
tar xf /tmp/spark.tgz
pip install -q findspark

REPO=https://github.com/smduarte/ps2021/raw/master/proj/colab/

JARS_KAFKA=(spark-sql-kafka-0-10_2.11-$SPARK_VERSION.jar \
               spark-streaming-kafka-0-10-assembly_2.11-$SPARK_VERSION.jar \
               spark-streaming-kafka-0-10_2.11-$SPARK_VERSION.jar \
               spark-streaming-kafka-0-8-assembly_2.11-$SPARK_VERSION.jar \
               spark-streaming-kafka-0-8_2.11-$SPARK_VERSION.jar)

for jar in "${JARS_KAFKA[@]}"
do
  echo "Downloading ${jar}..."
  wget -q -O - $REPO/$jar.gz | gunzip -c > $SPARK_HOME/jars/$jar
done

echo "Done"
#!/bin/bash

KAFKA=kafka_2.12-2.7.0

echo "Downloading Kafka..."
wget -q -O  /tmp/kafka.tgz https://downloads.apache.org/kafka/2.7.0/$KAFKA.tgz
echo "Unpacking Kafka..."
tar -xzf /tmp/kafka.tgz
wget -q -O /tmp/PS2021-Debs-Publisher.jar $REPO/PS2021-Kafka-1.2021.jar	
echo "Done"
