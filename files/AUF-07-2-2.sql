use gm3;

SELECT m.id, COUNT(b.id)
FROM mitarbeiter m INNER JOIN bestellung b on m.id = b.mid
GROUP BY m.id
ORDER BY COUNT(b.id) DESC;


SELECT m.id,m.name,m.vorname, COUNT(l.id)
FROM mitarbeiter m LEFT JOIN lieferung l on m.id = l.mid
GROUP BY m.id
ORDER BY COUNT(l.id),m.id ;

SELECT p.id, p.bez , SUM(b.menge)
FROM produkt p LEFT JOIN bestpos b on b.pid = p.id
GROUP BY p.id
ORDER BY p.id;


SELECT b.id, b.bestdatum, sum(bp.vpreis*bp.menge) as 'Rechnungsbetrag'
FROM bestellung b INNER JOIN bestpos bp on bp.bid = b.id
GROUP BY b.id
ORDER BY sum(bp.vpreis*bp.menge) DESC;


