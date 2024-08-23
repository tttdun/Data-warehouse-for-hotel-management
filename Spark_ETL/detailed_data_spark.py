from pyspark.sql import SparkSession
from pyspark.sql.functions import current_date, current_timestamp

# Tạo SparkSession
spark = SparkSession.builder \
    .appName("Transform Detailed Data") \
    .enableHiveSupport() \
    .getOrCreate()

# Tải dữ liệu từ bảng Hive
detailed_data_df = spark.sql("SELECT * FROM airline_db_raw.detailed_data")

# Biến đổi dữ liệu
data_transformed = detailed_data_df.withColumn("load_dt", current_date().cast("string")) \
                                   .withColumn("load_dtm", current_timestamp().cast("string"))

# Chọn các cột cần thiết và thêm các cột mới
selected_columns = [
    "month", "dayofmonth", "dayofweek", "deptime", "crsdeptime", "arrtime", 
    "crsarrtime", "uniquecarrier", "flightnum", "tailnum", "actualelapsedtime", 
    "crselapsedtime", "airtime", "arrdelay", "depdelay", "origin", "dest", 
    "distance", "taxiin", "taxiout", "cancelled", "cancellationcode", 
    "diverted", "carrierdelay", "weatherdelay", "nasdelay", "securitydelay", 
    "lateaircraftdelay", "year", "load_dt", "load_dtm"
]

# Lấy các cột đã chọn và lưu vào bảng Hive khác
data_transformed.select(*selected_columns).write.mode("overwrite").saveAsTable("airline_db_cur.detailed_data")

# Dừng SparkSession
spark.stop()
