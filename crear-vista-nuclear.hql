DROP VIEW IF EXISTS vista_nuclear_90s;
CREATE VIEW vista_nuclear_90s AS
SELECT country_name, country_code,
        ( COALESCE(`1990`, 0) + COALESCE(`1991`, 0) + COALESCE(`1992`, 0) + COALESCE(`1993`, 0)
        + COALESCE(`1994`, 0) + COALESCE(`1995`, 0) + COALESCE(`1996`, 0) + COALESCE(`1997`, 0)
        + COALESCE(`1998`, 0) + COALESCE(`1999`, 0) )
        /
        NULLIF( IF(`1990` IS NOT NULL, 1, 0) + IF(`1991` IS NOT NULL, 1, 0)
              + IF(`1992` IS NOT NULL, 1, 0) + IF(`1993` IS NOT NULL, 1, 0)
              + IF(`1994` IS NOT NULL, 1, 0) + IF(`1995` IS NOT NULL, 1, 0)
              + IF(`1996` IS NOT NULL, 1, 0) + IF(`1997` IS NOT NULL, 1, 0)
              + IF(`1998` IS NOT NULL, 1, 0) + IF(`1999` IS NOT NULL, 1, 0)
        , 0) AS media_nuclear_90s
FROM nuclear;
