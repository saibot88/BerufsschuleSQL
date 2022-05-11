use gm3;


SELECT strasse
FROM mitarbeiter
WHERE name LIKE 'Lorenz';

SELECT 
    vorname,name,eingestellt
FROM 
    mitarbeiter
WHERE 
    name LIKE 'Kaufmann' AND vorname LIKE 'Sonja'
        OR name LIKE 'Wolff' AND vorname LIKE 'Michael';

SELECT name,vorname
FROM mitarbeiter
ORDER BY 1 DESC,2;

SELECT
    CONCAT(name,', ',vorname)
FROM
    mitarbeiter;

SELECT name,vorname,gebdat
FROM mitarbeiter
ORDER BY gebdat DESC;

SELECT id,name,vorname,eingestellt
FROM mitarbeiter
WHERE eingestellt < 050101
ORDER BY id;

SELECT id,name,vorname,eingestellt
FROM mitarbeiter
WHERE YEAR(eingestellt) LIKE '2006'
ORDER BY id;

SELECT id,name,vorname,eingestellt
FROM mitarbeiter
WHERE YEAR(eingestellt) LIKE '2001'
    AND MONTH(eingestellt) > 3 AND MONTH(eingestellt) < 11
ORDER BY id;

SELECT id,name,vorname,gebdat,TIMESTAMPDIFF(YEAR, gebdat, CURDATE()) AS age
FROM mitarbeiter
ORDER BY id;

