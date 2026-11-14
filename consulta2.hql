SELECT r.region,
       SUM(IF(a.medal IS NOT NULL, 1, 0)) AS medallas,
       COUNT(*) AS apariciones,
       ROUND(SUM(IF(a.medal IS NOT NULL, 1, 0)) / COUNT(*), 4) AS ratio
FROM atletas a
JOIN regiones r ON a.noc = r.noc
WHERE r.region <> ''
GROUP BY r.region
HAVING COUNT(*) >= 1000
ORDER BY ratio DESC
LIMIT 5;
