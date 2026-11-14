SELECT COUNT(*) AS medallas_oro,
       ROUND(AVG(age), 1) AS edad_media,
       ROUND(AVG(height), 1) AS altura_media_cm,
       ROUND(AVG(weight), 1) AS peso_medio_kg
FROM atletas
WHERE sport = 'Swimming' AND medal = 'Gold';
