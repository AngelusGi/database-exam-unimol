/*
si selezionano tutti i campi relativi ai negozi e alle società presenti nel sistema.
*/

USE acme_societa;

SELECT * FROM societa
UNION
SELECT * FROM negozio
ORDER BY Citta;