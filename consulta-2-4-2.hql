SELECT e.country_name, e.country_code, e.`2018` AS electricidad_2018
FROM (
    SELECT country_code
    FROM nuclear
    WHERE `2018` IS NOT NULL
    ORDER BY `2018` DESC, country_code ASC
    LIMIT 1
) n
JOIN electricidad e ON e.country_code = n.country_code;
