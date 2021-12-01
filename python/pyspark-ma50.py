from pyspark import SparkSession


spark = SparkSession.builder().master("local[*]").appName("MA50").getOrCreate()

df = spark.readStream.format("kafka") \
  .option("kafka.bootstrap.servers", "b-1.demo-cluster-1.8mghuv.c3.kafka.ap-southeast-1.amazonaws.com:9094,b-2.demo-cluster-1.8mghuv.c3.kafka.ap-southeast-1.amazonaws.com:9094") \
  .option("subscribe", "topic6") \
  .load()
# df.selectExpr("avg(risk_score) over(order by 'application date' rows between 50 preceding and current row) as RiskScoreMA50ST")



# query = wordCounts \
#     .writeStream \
#     .outputMode("complete") \
#     .format("console") \
#     .start()


# query = df.save('s3://test-bucket-61298376987-connect/data/output.csv')

# w = (Window()
#      .partitionBy(col("name"))
#      .orderBy(F.col("timestampGMT").cast('long'))
#      .rangeBetween(-days(7), 0))
#
# df2 = df.withColumn('rolling_average', F.avg("dollars").over(w))


query.awaitTermination()





#to run pyspark code
# ./bin/spark-submit pyspark-ma50.py