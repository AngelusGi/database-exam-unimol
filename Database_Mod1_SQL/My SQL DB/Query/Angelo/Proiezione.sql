/*
SLEZIONA I CAMPI "TIPO E COSTO" DI TUTTI I COSTUMI
E LI ORDINA IN ORDINE CRESCENTE DI COSTO
*/

USE acme_societa;

SELECT tipo,costo
FROM acme_societa.costume
ORDER BY costo;