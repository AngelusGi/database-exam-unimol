USE acme_societa;

/**
*	CREA UNA VISTA CHE PRENDE I COSTUMI CHE CORRISPONDO AI PARAMETRI PRESI IN INPUT DALLA PROCEDURA AD ESSA COLLEGATA:
*	OVVERO SESSO, TAGLIA E <=COSTO 
*/

DROP VIEW IF EXISTS `CostumiEconomiciAll`;

CREATE VIEW `CostumiEconomiciAll` AS
	SELECT Tipo, Nome, Taglia, Costo, Gender
	FROM costume;
    
    
DROP PROCEDURE IF EXISTS `costumi_economici_user`;
DELIMITER //
CREATE PROCEDURE `costumi_economici_user` (IN gender_user CHAR, IN taglia_user VARCHAR(4), IN costo_user decimal(5,2))
BEGIN
	SELECT Tipo, Nome, Taglia, Costo
	FROM acme_societa.CostumiEconomiciAll
    WHERE gender = gender_user AND taglia LIKE taglia_user AND costo <= costo_user
    ORDER BY costo ASC;
END //


CALL costumi_economici_user('m', "%s%", 400.00);
