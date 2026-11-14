SELECT a.id, a.name, r.region,
       COUNT(*) AS medallas,
       SUM(IF(a.medal = 'Gold', 1, 0)) AS oros,
       SUM(IF(a.medal = 'Silver', 1, 0)) AS platas,
       SUM(IF(a.medal = 'Bronze', 1, 0)) AS bronces
FROM atletas a
JOIN regiones r ON a.noc = r.noc
WHERE a.medal IS NOT NULL
GROUP BY a.id, a.name, r.region
ORDER BY medallas DESC, a.name
LIMIT 5;
