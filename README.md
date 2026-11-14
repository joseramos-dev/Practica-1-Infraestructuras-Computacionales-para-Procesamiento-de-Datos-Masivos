# Práctica 1 – Infraestructuras Computacionales para Procesamiento de Datos Masivos

Proyecto de Big Data con Hadoop, Hive y Python para analizar datos distribuidos y responder consultas analíticas.

## ¿Qué incluye?

Este repositorio contiene dos bloques principales:

1. MapReduce con Python
   - Procesamiento distribuido sobre ficheros de usuarios y eventos.
   - Joins, agregaciones y validación con pandas.

2. Análisis con Hive
   - Tablas externas sobre CSV y Parquet.
   - Consultas SQL sobre indicadores energéticos y olimpiadas.

## Estructura del repositorio

- `Notebook.ipynb` – informe completo con análisis y resultados
- `Notebook_ej1.ipynb` – ejercicio 1
- `Notebook_ej2.ipynb` – ejercicio 2
- `ejercicio1/` – mappers y reducers de Hadoop Streaming
- `*.hql` – scripts de creación de tablas, vistas y consultas Hive
- `usuarios.csv`, `eventos.csv` – datos del ejercicio de MapReduce
- `nuclear.parq`, `electricidad.parq` – datos parquet para Hive
- `API_EG.ELC.*.csv` – datos fuente del Banco Mundial

## Parte 1: MapReduce

Se trabaja con un conjunto de datos de usuarios y eventos para responder preguntas como:

- número de eventos por tipo
- eventos por país de usuario
- duración media por país y tipo de evento

Tecnologías:
- Hadoop Streaming
- Python 3
- HDFS
- pandas para validación

## Parte 2: Hive y análisis SQL

Se cargan datos en Hive para analizar:

- acceso a electricidad y energía nuclear
- medallas olímpicas por país y región
- proporciones, rankings y agregaciones por edición

Tecnologías:
- Apache Hive
- HiveQL
- Parquet
- CSV con OpenCSVSerde

## Archivos clave

- `crear-tabla-nuclear.hql`
- `crear-tabla-electricidad.hql`
- `crear-tablas-olimpiadas.hql`
- `consulta1.hql` a `consulta6.hql`
- `consulta-2-4-1.hql` a `consulta-2-4-3.hql`

## Cómo ejecutarlo

1. Levantar un entorno con Hadoop + Hive.
2. Subir los datos a HDFS.
3. Ejecutar los jobs de MapReduce desde `Notebook.ipynb` o desde Hadoop Streaming.
4. Cargar las tablas Hive con los scripts `.hql`.
5. Ejecutar las consultas analíticas.

Ejemplo:

```bash
hive -f crear-tablas-olimpiadas.hql
hive -f consulta1.hql
```

## Resultado

El proyecto demuestra:

- procesamiento distribuido con MapReduce
- uso de HDFS
- gestión de datos en Hive
- validación de resultados con pandas
- análisis de datos masivos sobre datos reales

## Autor

José Manuel Ramos Chica

GitHub: https://github.com/joseramos-dev
