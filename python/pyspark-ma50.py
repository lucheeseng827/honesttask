from pyspark import SparkSession


spark = SparkSession.builder().master("local[*]").appName("MA50").getOrCreate()

df = spark.readStream.format("kafka") \
  .option("kafka.bootstrap.servers", "host1:port1,host2:port2") \
  .option("subscribe", "topic1") \
  .load()
df.selectExpr("CAST(key AS STRING)", "CAST(value AS STRING)")



query = wordCounts \
    .writeStream \
    .outputMode("complete") \
    .format("console") \
    .start()

query.awaitTermination()




#to run pyspark code
# ./bin/spark-submit pyspark-ma50.py localhost 9999