/*
mostra quali clienti, identificati per nome e cognome,
hanno partecipato ad una festa con un costume da uomo
indicando anche i dati relativi al costume, come genere, tipo e nome.
*/


USE acme_societa;


SELECT cliente.nome as NomeCliente, cliente.cognome as CognomeCliente,
	costume.nome as NomeCostume, costume.tipo as TipoCostume, costume.gender as GenderCostume
FROM cliente cliente JOIN costume costume
WHERE costume.gender = 'M' AND cliente.id IN (
	SELECT Cliente
    FROM partecipa partecipa
    WHERE partecipa.Cliente IN (
            SELECT Cliente
            FROM costume costume
            WHERE costume.Cliente = partecipa.cliente
	));


/* QUERY CON ABBREVIAZIONI E LIMITE A 10 ELEMENTI*/

USE acme_societa;

SELECT cl.nome as NomeCliente, cl.cognome as CognomeCliente,
	co.nome as NomeCostume, co.tipo as TipoCostume, co.gender as GenderCostume
FROM cliente cl JOIN costume co
WHERE co.gender = 'M' AND cl.id IN (
	SELECT Cliente
    FROM costume
    WHERE Cliente IN (
            SELECT Cliente
            FROM partecipa
))
ORDER BY co.tipo
LIMIT 10;

