USE acme_societa;

/*QUERY 1: Si selezionano il nome dei clienti ed il nome dei costumi per sapere queli sono presenti nel sistema*/

SELECT * FROM Cliente C
UNION
SELECT * FROM COSTUME CS;

/* Query 2: Si seleziona il nome dei costumi che non hanno un cliente che li possiede*/
SELECT C.Nome
FROM Costume C
WHERE C.Cliente NOT IN (SELECT CL.ID FROM Cliente CL);

/*Query 3: si selezionano le citta delle societa dove si è tenuta anche una festa*/
SELECT *
FROM Festa F
WHERE F.Citta IN ( SELECT S.Citta FROM Societa S);

/*Query 4: Mostra i luoghi dove sono stati organizzate feste nel 2019*/
SELECT F.Luogo
FROM Festa F
ORDER BY F.DataFesta;

/* Query 5: Mostra i clienti ed i loro costumi: */
SELECT C.Nome
FROM Cliente C INNER JOIN Costume CS ON C.ID = CS.Cliente
WHERE CS.Tipo = "Shock";

/* Query 6: nella tabella cliente, cambia il nome della colonna CodiceFiscale in CF */
ALTER TABLE Societa
CHANGE COLUMN CodiceFiscale CF VARCHAR(16) NOT NULL;



