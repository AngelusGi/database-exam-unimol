/*
mostra il valore totale dei costumi raggruppati per categoria
la cui somma dei costi sia maggiore di 2000€.
*/

USE acme_societa;

SELECT tipo,
SUM(costo) AS ValoreTotale
FROM costume
GROUP BY tipo
HAVING SUM(costo)>2000;