/*
proietta il nome delle città in cui sono presente una società, ma non un negozio.
*/

USE acme_societa;

SELECT *
FROM societa
WHERE nome NOT IN (SELECT nome FROM negozio);