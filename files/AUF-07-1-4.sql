use gm3;


SELECT m.name,m.vorname,a.name as 'Abteilungsname'
From mitarbeiter m INNER JOIN abteilung a ON a.id = m.aid;



SELECT m.name,m.vorname,m.aid,a.id,a.name
From mitarbeiter m, abteilung a
WHERE m.aid==a.id;
