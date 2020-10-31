/*
mostra il costo medio dei costumi raggruppati per categoria.
*/

USE acme_societa;

SELECT tipo,
AVG(costo) AS ValoreMedio
FROM costume
GROUP BY tipo
ORDER BY tipo ASC;
