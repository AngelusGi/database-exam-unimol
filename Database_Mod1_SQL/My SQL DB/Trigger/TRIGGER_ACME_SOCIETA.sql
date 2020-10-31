USE acme_societa;


/*CI STO ANCORA LAVORANDO*/

/* DESCRIZIONE TRIGGER : Controlla se il prezzo dei costumi è maggiore di una soglia prestabilita e di conseguenza applica la percentuale di sconto per quel costume*/

DROP TRIGGER IF EXISTS ControllaPrezzo_in;
DELIMITER $$
CREATE TRIGGER ControllaPrezzo_in BEFORE UPDATE ON Costume
FOR EACH ROW
BEGIN
	IF Costume.Costo > 400 THEN
		SET @P_Sconto = 50;
        CALL ApplicaSingoloSconto(P_Sconto, Costume.ID);			
	END IF;
END $$
DELIMITER ;

/* DESCRIZIONE TRIGGER : Controlla se il prezzo dei costumi è maggiore di una soglia
						 prestabilita e di conseguenza rimuove la percentuale di sconto
                         per quel costume*/

DROP TRIGGER IF EXISTS ControllaPrezzo_out;
DELIMITER $$
CREATE TRIGGER ControllaPrezzo_out BEFORE UPDATE ON costume
FOR EACH ROW
BEGIN
	IF Costume.Costo < 200 THEN
		SET @P_Sconto = 50;
		CALL RimuoviSingoloSconto(@P_Sconto,Costume.ID);
	END IF;
END $$
DELIMITER ;
