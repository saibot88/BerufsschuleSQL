use gm3;

SELECT m.id, m.name
FROM mitarbeiter m INNER JOIN gehalt g ON g.id = m.id
WHERE g.gehalt > (SELECT avg(gehalt) FROM gehalt);

SELECT p.id, p.bez
FROM produkt p 
WHERE p.vpreis = (SELECT MIN(vpreis) FROM produkt);

SELECT k.id,k.name
From kunde k
WHERE k.id NOT IN (SELECT k.id From kunde k INNER JOIN bestellung b ON b.kid = k.id 
WHERE b.bestdatum BETWEEN 20211001 and 20211031);

SELECT l.id,l.bestdatum,COUNT(lp.pid)
FROM lieferung l INNER JOIN lieferpos lp on lp.lid = l.id
GROUP BY l.id
having count(lp.pid) = (SELECT MAX(c.countPID)
From(
    Select 
    count(pid) as countPID
    FROM lieferpos
    GROUP BY lid
) c
);


SELECT distinct l.id,l.name
From lieferant l INNER JOIN lieferung lg on l.id = lg.lid
Where l.id not in (SELECT l.id FROM lieferant l INNER JOIN lieferung lg on l.id = lg.lid WHERE lg.mid = 3);

SELECT distinct k.id,k.name
FROM kunde k INNER JOIN bestellung b on k.id = b.kid INNER JOIN bestpos bp ON bp.bid = b.id INNER JOIN produkt p on p.id = bp.pid INNER JOIN typ t on t.id = p.tid
WHERE k.id not in (SELECT k.id
FROM kunde k INNER JOIN bestellung b on k.id = b.kid INNER JOIN bestpos bp ON bp.bid = b.id INNER JOIN produkt p on p.id = bp.pid INNER JOIN typ t on t.id = p.tid
WHERE t.bez not LIKE "%Bier%");

SELECT m.id ,m.name
FROM mitarbeiter m INNER JOIN lieferung l on l.mid = m.id
GROUP BY l.mid
HAVING COUNT(distinct l.lid) = (
    SELECT count(*)
    FROM lieferant
)