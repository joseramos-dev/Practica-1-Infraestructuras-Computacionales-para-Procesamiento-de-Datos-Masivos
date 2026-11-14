SELECT a.sport, COUNT(*) AS medallas
FROM atletas a
JOIN regiones r ON a.noc = r.noc
WHERE r.region = 'Spain' AND a.medal IS NOT NULL
GROUP BY a.sport
ORDER BY medallas DESC, a.sport
LIMIT 5;
