#list of command
#download kafka/ spark and set up java

sudo yum install java-1.8.0
wget https://archive.apache.org/dist/kafka/2.2.1/kafka_2.12-2.2.1.tgz
tar -xzf kafka_2.12-2.2.1.tgz
cd kafka_2.12-2.2.1/

#download spark
wget https://dlcdn.apache.org/spark/spark-3.2.0/spark-3.2.0-bin-hadoop3.2.tgz

#export kafka broker and zookeeper hostname
export ZOOKEEPER=z-3.demo-cluster-1.8mghuv.c3.kafka.ap-southeast-1.amazonaws.com:2181,z-2.demo-cluster-1.8mghuv.c3.kafka.ap-southeast-1.amazonaws.com:2181,z-1.demo-cluster-1.8mghuv.c3.kafka.ap-southeast-1.amazonaws.com:2181
export BOOTSTRAP=b-1.demo-cluster-1.8mghuv.c3.kafka.ap-southeast-1.amazonaws.com:9094,b-2.demo-cluster-1.8mghuv.c3.kafka.ap-southeast-1.amazonaws.com:9094


# create topic
./kafka_2.12-2.2.1/bin/kafka-topics.sh --create --zookeeper $ZOOKEEPER --replication-factor 2 --partitions 1 --topic topic1

#pull s3 file and pass to topic topic1
aws s3 cp s3://test-bucket-61298376987/data/rejected_2007_to_2018Q4.csv.gz .

#s3 download to client then gz unzip
gzip -d rejected_2007_to_2018Q4.csv.gz
./kafka_2.12-2.2.1/bin/kafka-console-producer.sh --broker-list $BOOTSTRAP --topic topic1 < rejected_2007_to_2018Q4.csv

