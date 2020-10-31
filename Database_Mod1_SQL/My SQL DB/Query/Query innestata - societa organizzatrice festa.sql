/*
mostra i dati relativi alle ultime 10 feste organizzate, in particolare:
città, luogo e data della festa e, infine, il nome della società che
l’ha organizzata, in ordine cronologico a partire dalla data più recente.
*/

USE acme_societa;

SELECT f.dataFesta, f.luogo, f.citta, s.nome AS organizzatore
FROM festa f JOIN societa s WHERE f.id IN (
    SELECT festa
    FROM partecipa
)
ORDER BY f.dataFesta desc
LIMIT 10;
