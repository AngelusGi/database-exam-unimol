/*
Inserisce nella tabella PROVA il risultato della selezione dalla relazione
LuogoFesta di tutte le righe aventi "Milano" come valore dell’attributo LuogoFesta.
*/


USE acme_societa;

/*CREAZIONE TABELLA*/

CREATE TABLE tabellaProva(
    id INT,
    LuogoFesta VARCHAR(45),
    PRIMARY KEY(id)
);



/*INSERIMENTO DATI PROVENIENTI DALLA SELEZIONE SULLA TABELLA FESTA*/

INSERT INTO tabellaProva(
    SELECT id, citta as LuogoFesta
      FROM festa
     WHERE citta = 'matera'
);



/*VERIFICA DEI DATI CARICATI IN TABELLA*/

SELECT *
FROM tabellaProva
LIMIT 5;

