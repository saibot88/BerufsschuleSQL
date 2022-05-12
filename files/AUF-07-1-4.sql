use gm3;


SELECT m.name,m.vorname,a.name as 'Abteilungsname'
From mitarbeiter m INNER JOIN abteilung a ON a.id = m.aid;



SELECT m.name,m.vorname,m.aid,a.id,a.name
From mitarbeiter m, abteilung a
WHERE m.aid==a.id;

SELECT m.name,m.vorname,g.gehalt,m.strasse,o.plz,o.name
From 
mitarbeiter m 
INNER JOIN gehalt g ON g.id = m.fid 
INNER JOIN ort o ON o.id = m.oid;

SELECT name as 'name', telefon as 'telefonnummer'
From kunde
UNION
SELECT name as 'name', telefon as 'telefonnummer'
FROM lieferant