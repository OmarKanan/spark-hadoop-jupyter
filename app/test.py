from pyspark.sql import SparkSession
import time

SPARK_MASTER = "spark://spark-master:7077"
HDFS_PATH = "hdfs://hadoop-namenode:8020"

spark = SparkSession.builder\
    .appName("JupyterSparkDocker")\
    .master(SPARK_MASTER)\
    .getOrCreate()

df = spark.createDataFrame([[i] for i in range(10)])
df.show()

df.write.mode("overwrite").csv(f"{HDFS_PATH}/output")
spark.read.csv(f"{HDFS_PATH}/output").show()
