SELECT year,
       COUNT(DISTINCT id) AS atletas,
       COUNT(DISTINCT IF(sex = 'F', id, NULL)) AS mujeres,
       ROUND(100 * COUNT(DISTINCT IF(sex = 'F', id, NULL)) / COUNT(DISTINCT id), 2) AS pct_mujeres
FROM atletas
GROUP BY year
ORDER BY year;
