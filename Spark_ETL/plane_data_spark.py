from pyspark.sql import SparkSession
from pyspark.sql.functions import current_date, current_timestamp

# Tạo SparkSession
spark = SparkSession.builder \
    .appName("Transform Plane Data") \
    .enableHiveSupport() \
    .getOrCreate()

# Tải dữ liệu từ bảng Hive
plane_data_df = spark.sql("SELECT * FROM airline_db_raw.plane_data")

# Biến đổi dữ liệu
data_transformed = plane_data_df.withColumn("load_dt", current_date().cast("string")) \
                                .withColumn("load_dtm", current_timestamp().cast("string"))

# Chọn các cột cần thiết và thêm các cột mới
selected_columns = [
    "tailnum", "type", "manufacturer", "issue_date", "model", "status", 
    "aircraft_type", "engine_type", "year", "load_dt", "load_dtm"
]

# Lấy các cột đã chọn và lưu vào bảng Hive khác
data_transformed.select(*selected_columns).write.mode("overwrite").saveAsTable("airline_db_cur.plane_data")

# Dừng SparkSession
spark.stop()
