/*
MOSTRA IL NOME DELLE SOCIETA CHE HANNO ORGANIZZATO FESTE NEL 2018
E MOSTRA ANCHE LA DATA DELLA FESTA
*/


USE acme_societa;

SELECT societa.nome as NomeSocieta, DataFesta
FROM societa societa
JOIN festa
WHERE dataFesta LIKE '%2018%'
