-- tabla de atletas: fichero Parquet (formato columnar, con tipos)
DROP TABLE IF EXISTS atletas;
CREATE EXTERNAL TABLE atletas (
  id INT,
  name STRING,
  sex STRING,
  age INT,
  height DOUBLE,
  weight DOUBLE,
  team STRING,
  noc STRING,
  games STRING,
  year INT,
  season STRING,
  city STRING,
  sport STRING,
  event STRING,
  medal STRING
)
STORED AS PARQUET
LOCATION '/olimpiadas/atletas_parquet';

-- tabla de regiones: CSV original leído con OpenCSVSerde
DROP TABLE IF EXISTS regiones;
CREATE EXTERNAL TABLE regiones (
  noc STRING,
  region STRING,
  notes STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar" = ",", "quoteChar" = "\"")
STORED AS TEXTFILE
LOCATION '/olimpiadas/regiones'
TBLPROPERTIES ("skip.header.line.count"="1");
