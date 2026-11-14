-- Muestra de la tabla atletas (Parquet)
SELECT id, name, sex, age, height, weight, noc, year, season, sport, medal
FROM atletas
LIMIT 5;

-- Número total de filas de atletas (debe coincidir con pandas: 271116)
SELECT COUNT(*) AS filas_atletas FROM atletas;

-- Muestra de la tabla regiones (CSV leído con OpenCSVSerde)
SELECT noc, region, notes
FROM regiones
LIMIT 5;

-- Número total de filas de regiones (debe ser 230)
SELECT COUNT(*) AS filas_regiones FROM regiones;
