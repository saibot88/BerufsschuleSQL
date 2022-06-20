use gm3;

SELECT k.id,k.name
FROM kunde k LEFT JOIN bestellung b ON k.id = b.kid
WHERE b.bestdatum IS NULL;

SELECT m.id,m.name,m.vorname
FROM mitarbeiter m LEFT JOIN bestellung b ON b.mid = m.id
WHERE b.bestdatum is NULL;

SELECT m.id,m.name,IFNULL(f.taetigkeit,'') as 'Aktuelle Tätigkeit'
FROM mitarbeiter m LEFT JOIN funktion f ON f.id = m.fid
ORDER BY 3;


SELECT distinct b.name
FROM bundesland b INNER JOIN landkreis l on l.bid = b.id INNER JOIN ort o ON o.lid = l.id INNER JOIN kunde k ON k.oid = o.id
ORDER BY b.name;

SELECT distinct 
    b.name
FROM bundesland b 
    LEFT JOIN (landkreis l  INNER JOIN ort o ON o.lid = l.id 
    INNER JOIN kunde k ON k.oid = o.id) on l.bid = b.id
WHERE 
    k.id is NULL
ORDER BY 
    b.name;