USE acme_societa;

/**
*	CREA UNA VISTA CHE PRENDE I COSTUMI ECONOMICI PER IL GENDER SELEZIONATO NELL'INVOCAZIONE DELLA PROCEDURA
*/

DROP VIEW IF EXISTS CostumiEconomici;

CREATE VIEW CostumiEconomici AS
	SELECT Tipo, Nome, Taglia, Costo, Gender
	FROM costume
    WHERE costo <= 300;
    
    
DROP PROCEDURE IF EXISTS `costumi_economici_gender`;
DELIMITER //
CREATE PROCEDURE `costumi_economici_gender` (IN gender_user CHAR)
BEGIN
	SELECT Tipo, Nome, Taglia, Costo
	FROM acme_societa.CostumiEconomici
    WHERE gender = gender_user
    ORDER BY costo ASC;
END //

CALL costumi_economici_gender("m");