USE acme_societa;

DROP PROCEDURE IF EXISTS ApplicaSconto;
DELIMITER $$
CREATE PROCEDURE ApplicaSconto(IN P_Sconto INT)
BEGIN 
	UPDATE Costume
    SET Costume.Costo = Costume.Costo - ( (P_Sconto * Costume.Costo) / 100 )
    WHERE Costume.Costo < 1000000; -- WHERE CLOUSE per aggirare il safe update
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS RimuoviSconto;
DELIMITER $$
CREATE PROCEDURE RimuoviSconto(IN P_Sconto INT)
BEGIN
	UPDATE Costume
    SET Costume.Costo = Costume.Costo + ( (P_Sconto * Costume.Costo) / 100 )
    WHERE Costume.Costo < 1000000; -- WHERE CLOUSE per aggirare il safe update
END
DELIMITER ;


DROP PROCEDURE IF EXISTS ApplicaSingoloSconto;
DELIMITER $$
CREATE PROCEDURE ApplicaSingoloSconto(IN P_Sconto INT, IN C_ID INT)
BEGIN
	UPDATE Costume
	SET Costume.Costo = Costume.Costo - ( ( P_Sconto * Costume.Costo ) / 100)
    WHERE Costume.ID = C_ID;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS RimuoviSingoloSconto;
DELIMITER $$
CREATE PROCEDURE RimuoviSingoloSconto(IN P_Sconto INT, IN C_ID INT)
BEGIN
	UPDATE Costume
	SET Costume.Costo = Costume.Costo + ( ( P_Sconto * Costume.Costo ) / 100)
    WHERE Costume.ID = C_ID;
END $$
DELIMITER ;