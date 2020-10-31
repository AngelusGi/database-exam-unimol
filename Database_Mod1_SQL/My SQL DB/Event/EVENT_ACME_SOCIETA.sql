USE acme_societa;

/*Ogni mese controllo se è Maggio->Giugno o Dicembre per applicare degli sconti sui costumi*/

/* PER ANGELO :  NEL TUO EVENT PER CONTROLLARE SE E' IL GIORNO PRIMA DI CARNEVALE 
				 GENERA UN TRIGGER DI "INSTEAD OF" PER SOSTITUIRE IL MIO ApplicaSconto 
				 CON IL TUO "PunisciStronzi" */
                 

/*DESCRIZIOE EVENT : Controlla ogni mese se il mese corrente è Maggio/dicembre e chiama la procedura per Applicare gli sconti*/

DROP EVENT IF EXISTS IniziaSconti;
DELIMITER $$
CREATE EVENT IniziaSconti
	ON SCHEDULE EVERY 1 MONTH DO
BEGIN
	
    SET @C_Mese = MONTH(current_date());
    IF @C_Mese = 5 OR @C_Mese = 12 THEN 
    		CALL ApplicaSconti(30);
	END IF;
END $$

/*STARTS '2017-03-31 23:55:00' (NON SO ANCORA SE CI VA O MENO)*/

/*DESCRIZIOE EVENT : Controlla se il mese corrente è Luglio/Gennaio per chiamare la procedure che rimuove gli sconti*/

DROP EVENT IF EXISTS TerminaSconti;
DELIMITER $$
CREATE EVENT IF NOT EXISTS TerminaSconti
	ON SCHEDULE EVERY 1 MONTH DO
BEGIN 
	SET @C_Mese = MONTH(current_date());
    IF @C_Mese = 7 OR @C_Mese = 1 THEN
		CALL RimuoviSconti(30);
	END IF;
END $$ 
DELIMITER ;