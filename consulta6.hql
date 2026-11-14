SELECT r.region,
       COUNT(DISTINCT a.noc) AS num_codigos,
       CONCAT_WS(', ', COLLECT_SET(a.noc)) AS codigos,
       SUM(IF(a.medal IS NOT NULL, 1, 0)) AS medallas
FROM atletas a
JOIN regiones r ON a.noc = r.noc
WHERE r.region <> ''
GROUP BY r.region
HAVING COUNT(DISTINCT a.noc) > 1
ORDER BY medallas DESC
LIMIT 10;
