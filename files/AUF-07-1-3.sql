use gm3;


SELECT id,bez,vpreis,eid,tid
FROM produkt
WHERE bez LIKE '%Wein%';

SELECT bez,ROUND(vpreis*7.44,2) AS preisDKK
FROM produkt;

SELECT id,bez,vpreis
FROM produkt
ORDER BY vpreis DESC
LIMIT 1;

SELECT id,bez,IF(lagerbestand > 10,'Ausreichend',IF(lagerbestand = 0,'Ausverkauft','Gering')) AS Lagerbestand
FROM produkt
