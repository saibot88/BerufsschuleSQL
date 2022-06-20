use gm3;

SELECT p.id , p.bez, b.pid, b.bid
FROM produkt p LEFT JOIN bestpos b on p.id = b.pid
WHERE b.pid IS NULL;

SELECT m.id,m.name,f.taetigkeit FROM mitarbeiter m
LEFT JOIN funktion f ON m.fid = f.id
UNION
SELECT m.id,m.name,f.taetigkeit FROM mitarbeiter m
RIGHT JOIN funktion f ON m.fid = f.id;