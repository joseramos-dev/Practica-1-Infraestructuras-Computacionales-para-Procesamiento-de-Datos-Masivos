# Big Data Processing on Hadoop: MapReduce & Hive

Batch data processing project on a **Hadoop/HDFS** cluster, built in two parts:

1. **MapReduce with Python (Hadoop Streaming)**: distributed joins and aggregations over e-learning platform logs.
2. **SQL analytics with Apache Hive**: external tables over **Parquet** and CSV, views, and analytical queries over World Bank energy indicators and 120 years of Olympic Games data.

> Master's coursework (ICPD – Procesado de datos masivo). The full walkthrough, with outputs and validation against pandas, is in [Notebook.ipynb](Notebook.ipynb).

## Tech stack

| Area | Tools |
|---|---|
| Storage | HDFS, Parquet (columnar), CSV |
| Processing | Hadoop MapReduce (Hadoop Streaming 3.4.0), Python 3 |
| Querying | Apache Hive / HiveQL (external tables, views, SerDes) |
| Validation & exploration | pandas, Jupyter |

## Part 1 – MapReduce with Python

Input: `usuarios.csv` (users) and `eventos.csv` (platform events: login, video, etc.).

| Exercise | What it does | Key technique |
|---|---|---|
| 1.1 | Counts events by type | Mapper/reducer word-count pattern |
| 1.2 | Counts events per user country | **Reduce-side join** of two datasets, using tagged records (`U`/`E`) and shuffle & sort to bring both sides together; chained second job to aggregate by country |
| 1.3 | Average event duration per country and event type | Join + **partial sums and counts** (`sum`, `n`) merged in a final reducer to compute the mean correctly, with input cleaning (invalid durations discarded) |

Every job's output is **checked against an equivalent pandas computation** to confirm correctness.

Code: [ejercicio1/](ejercicio1/)

```bash
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-3.4.0.jar \
  -files ejercicio1/mapper_ej2_join.py,ejercicio1/reducer_ej2_join.py \
  -mapper "python3 mapper_ej2_join.py" \
  -reducer "python3 reducer_ej2_join.py" \
  -input /ficheros_ejercicio1/usuarios.csv \
  -input /ficheros_ejercicio1/eventos.csv \
  -output /ficheros_ejercicio1/salida_ej2_join
```

## Part 2 – Analytics with Hive

### 2.A World Bank energy indicators (nuclear & electricity access)
- Source data: World Bank API CSVs (`EG.ELC.NUCL.ZS`, `EG.ELC.ACCS.ZS`), 1960–2025, converted to **Parquet** (`nuclear.parq`, `electricidad.parq`).
- DDL: [crear-tabla-nuclear.hql](crear-tabla-nuclear.hql), [crear-tabla-electricidad.hql](crear-tabla-electricidad.hql) (external tables stored as Parquet).
- [crear-vista-nuclear.hql](crear-vista-nuclear.hql): a **view** computing the 1990s average per country, handling NULL years with `COALESCE`/`NULLIF`.
- Queries ([consulta-2-4-1.hql](consulta-2-4-1.hql), [2](consulta-2-4-2.hql), [3](consulta-2-4-3.hql)): point lookup, a subquery + join across tables (top nuclear producer in 2018 and its electricity access), and a ranking over the view.

### 2.B Olympic Games (athletes & regions)
- [crear-tablas-olimpiadas.hql](crear-tablas-olimpiadas.hql): `atletas` as an external **Parquet** table and `regiones` as a CSV table read with **OpenCSVSerde** (header skipped via table properties).
- Six analytical queries ([consulta1.hql](consulta1.hql) to [consulta6.hql](consulta6.hql)) covering:
  - top sports by medals for a country (join, filter, aggregate, top-N)
  - medal ratio by region with `HAVING` thresholds
  - averages over a filtered cohort (age, height, weight of gold medallists)
  - share of women athletes per edition (`COUNT(DISTINCT ...)` with conditional aggregation)
  - top medallists with gold/silver/bronze breakdown (pivot with `SUM(IF(...))`)
  - regions with multiple NOC codes (`COLLECT_SET`, `CONCAT_WS`)

## Skills demonstrated

- Designing **MapReduce** jobs (map/shuffle/reduce, chained jobs, reduce-side joins, combiner-style partial aggregation)
- Working on **HDFS** (ingest, directory layout, job output management)
- Choosing **columnar formats (Parquet)** and defining **external Hive tables**
- **HiveQL**: joins, subqueries, views, window-free aggregation, conditional aggregation, `COLLECT_SET`, NULL handling
- **Data quality**: header rows leaking into data, nulls, invalid values
- **Result validation** with an independent pandas implementation

## Repository structure

```
.
├── Notebook.ipynb                 # Full report: code, outputs, conclusions
├── Notebook_ej1.ipynb / _ej2.ipynb# Per-exercise notebooks
├── ejercicio1/                    # Python mappers & reducers (Hadoop Streaming)
├── *.hql                          # Hive DDL, views and queries
├── usuarios.csv, eventos.csv      # Part 1 input data
├── nuclear.parq, electricidad.parq# Part 2.A data (Parquet)
└── API_EG.ELC.*.csv               # Raw World Bank data
```

## How to run

1. Start a Hadoop cluster with HDFS, YARN and Hive.
2. Upload the data to HDFS (`hdfs dfs -put ...`) under the paths used in the notebook and the `.hql` files (`/ficheros_ejercicio1`, `/ficheros_ejercicio2`, `/olimpiadas`).
3. Run the Streaming jobs as shown in [Notebook.ipynb](Notebook.ipynb).
4. Create tables and run queries, for example:
   ```bash
   hive -f crear-tablas-olimpiadas.hql
   hive -f consulta1.hql
   ```

## Author

José Manuel Ramos Chica · [GitHub: joseramos-dev](https://github.com/joseramos-dev)
