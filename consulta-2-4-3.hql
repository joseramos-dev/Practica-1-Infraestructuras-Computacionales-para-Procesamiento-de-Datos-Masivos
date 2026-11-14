SELECT country_name, country_code, ROUND(media_nuclear_90s, 2) 
AS media_1990_1999 
FROM vista_nuclear_90s 
WHERE media_nuclear_90s IS NOT NULL 
ORDER BY media_nuclear_90s DESC, country_code ASC LIMIT 5;
