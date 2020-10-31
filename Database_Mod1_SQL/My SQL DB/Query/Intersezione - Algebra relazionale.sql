/*
mostra tutti i dati relativi alle società dove, nelle relative città,
sono presenti anche dei negozi.
*/

USE acme_societa;

/*SELECT citta
FROM negozio
INTERSECT
SELECT citta
FROM societa
ORDER BY citta;*/

SELECT *
FROM negozio
WHERE citta IN (SELECT citta FROM societa);