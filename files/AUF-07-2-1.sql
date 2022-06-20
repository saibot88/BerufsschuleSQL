use gm3;

SELECT MIN(g.gehalt) as 'Min Gehlat', MAX(g.gehalt) as 'Max Gehalt'
FROM gehalt g;

SELECT round(AVG(g.gehalt),2)
FROM gehalt g;

SELECT COUNT(DISTINCT b.mid)
FROM bestellung b;

SELECT round(COUNT(m.id)/COUNT(DISTINCT m.aid),1)
FROM mitarbeiter m INNER JOIN abteilung a on a.id = m.aid;

SELECT aid, SUM(gehalt) as 'Summe Gehälter'
FROM mitarbeiter m, gehalt g
WHERE m.id = g.id
GROUP BY aid;


