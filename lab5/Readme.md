# Lab 5 Apache Flink

This lab exemplifies a Flink exampling using a Kafka source.

To run this example, you need to do the following:

1. Start Kafka, using the provided script.

2. Start the WebLob publisher, using the provided script.

This version will publish the web logs to kafka

3. Start Apache Flink running in localmode

4. Open [http://localhost:3000/wetty](http://localhost:3000/wetty)

5. Login. User: flink, Password: flink

6. Execute run-flink.sh

7. Copy paste the example code.

8. In another browser tab, login again: [http://localhost:3000/wetty](http://localhost:3000/wetty)

9. The the `results` folder with the current computation results. `tail -f results*/*`



