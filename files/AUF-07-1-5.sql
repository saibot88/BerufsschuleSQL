use gm3;


SELECT distinct t.bez
From produkt p INNER JOIN typ t ON t.id = p.tid
WHERE p.bez LIKE '%coca-cola%';

SELECT k.id, k.name, b.liefdatum
From kunde k INNER JOIN bestellung b ON k.id = b.kid
WHERE b.bezahlt = 0
    AND DATEDIFF(b.liefdatum,CURRENT_TIMESTAMP)<= 30
ORDER BY k.name;

SELECT m.id, m.name, m.vorname
From lieferant li INNER JOIN lieferung l ON l.lid = li.id INNER JOIN mitarbeiter m ON m.id = l.mid
WHERE li.name = 'Red Bull AG'
ORDER BY m.name;

SELECT distinct m.id, m.name , m.vorname
FROM mitarbeiter m INNER JOIN bestellung b ON m.id = b.mid INNER JOIN kunde k ON k.id = b.kid INNER JOIN ort o ON k.oid = o.id
WHERE o.name = 'Greven'
ORDER BY m.name;

SELECT l.id,l.name,b.name
FROM lieferant l INNER JOIN ort o on o.id = l.oid INNER JOIN landkreis lk on o.lid = lk.id INNER JOIN bundesland b on b.id = lk.bid
WHERE b.name = 'Bayern';

SELECT distinct l.id,l.name
FROM lieferant l INNER JOIN lieferung li ON l.id = li.lid INNER JOIN lieferpos lp ON li.id = lp.lid INNER JOIN produkt p on p.id = lp.pid INNER JOIN typ t ON t.id = p.tid
WHERE t.bez LIKE '%Glasflasche 0,5 Liter%' AND p.bez LIKE '%coca-cola%'
;

SELECT m.vorname,m.name   
FROM mitarbeiter m INNER JOIN funktion f ON f.id = m.fid INNER JOIN mitarbeiter m2 
WHERE f.taetigkeit = 'Gruppenleiter' AND m.aid = m2.aid AND m2.name LIKE 'Ritter';