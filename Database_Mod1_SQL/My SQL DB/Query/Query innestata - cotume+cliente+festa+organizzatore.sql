/*
mostra quali clienti, identificati per nome e cognome, hanno partecipato ad almeno una festa, dettagliandone data,
luogo e città di svolgimento, unitamente al nome della società organizzatrice, e, infine, quale costume hanno
indossato, indicando  nome e tipologia del capo.
*/

USE acme_societa;

/*
SELECT so.Nome AS SocietaOrganizzatrice, f.DataFesta AS DataFesta,
    f.Luogo AS LuogoFesta, f.citta AS CittaFesta, cl.Nome AS NomePartecipante,
    cl.Cognome CognomePartecipante, co.Tipo AS TipoCostume,
    co.Nome AS DescrizioneCostume, co.Gender AS GenderCostume
FROM festa f INNER JOIN cliente cl INNER JOIN costume co INNER JOIN societa so
WHERE f.datafesta like '2018%' AND (cl.id,f.id) IN (
    SELECT p.cliente, p.festa
	FROM partecipa p
)
ORDER BY f.dataFesta DESC;
*/

USE acme_societa;

SELECT so.Nome AS SocietaOrg, f.DataFesta,
	CONCAT(f.Luogo,' - ',f.citta) AS LuogoFesta, cl.Nome AS clNome,
    cl.Cognome AS clCognome, co.Tipo AS TipoCostume,
    co.Nome AS DesCostume, co.Gender AS GenderCostume
FROM festa f INNER JOIN cliente cl
	INNER JOIN costume co INNER JOIN societa so
WHERE f.datafesta like '2018%' AND (cl.id,f.id) IN (
    SELECT p.cliente, p.festa
	FROM partecipa p
)
ORDER BY f.dataFesta DESC
LIMIT 5;

