DROP SCHEMA IF EXISTS ACME_SOCIETA;
CREATE DATABASE
IF NOT EXISTS ACME_SOCIETA;
SET FOREIGN_KEY_CHECKS = 0;
/*SET event_scheduler = on;*/

USE ACME_SOCIETA;

DROP TABLE IF EXISTS Societa;
CREATE TABLE
IF NOT EXISTS Societa
(
	ID INT
        NOT NULL
        AUTO_INCREMENT,
	
    Nome VARCHAR(45)
        NOT NULL,
    
    Sede VARCHAR(45)
        NOT NULL,
    
    Citta VARCHAR(45)
        NOT NULL,

    PRIMARY KEY(ID)
);

DROP TABLE IF EXISTS Costume;
CREATE TABLE
IF NOT EXISTS Costume
(
	BarCode BIGINT
        NOT NULL,
    
    /*da riportare in word*/
    Cliente INT
        NOT NULL,
    /*da riportare in word*/
    Negozio INT
        NOT NULL,
    /*da riportare in word*/
    Societa INT
        NOT NULL,
    
    Tipo VARCHAR(45)
        NOT NULL,
    
    Taglia CHAR(4)
        NOT NULL,
    
    Nome VARCHAR(45)
        NOT NULL,
    
    Costo DECIMAL(5,2)
        NOT NULL,
    
    Gender CHAR(1)
        NOT NULL,
    
    CHECK(Gender ='M' OR Gender ='F'),
    CHECK(Taglia ='XSb' OR Taglia ='Sb' OR Taglia = 'Mb' OR Taglia = 'Lb' OR Taglia = 'XLb' OR Taglia = 'XXLb' OR Taglia = 'XSa' OR Taglia = 'Sa' OR Taglia = 'Ma' OR Taglia = 'La' OR Taglia = 'XLa' OR Taglia = 'XXLa'),
	
    
    PRIMARY KEY(BarCode),
    
    FOREIGN KEY(Cliente)
		REFERENCES Cliente(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
	
    FOREIGN KEY(Negozio)
    REFERENCES Negozio(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
	
    FOREIGN KEY (Societa)
    REFERENCES Societa(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);


DROP TABLE IF EXISTS Cliente;
CREATE TABLE
IF NOT EXISTS Cliente
(
	ID INT
        NOT NULL
        AUTO_INCREMENT,
    
    CodiceFiscale CHAR(16)
        NOT NULL
        UNIQUE,
    
    Nome VARCHAR(45)
        NOT NULL,
    
    Cognome VARCHAR(45)
        NOT NULL,
    
    /*(MAYBE) -> inserire check solo numeri
    Recapito BIGINT NOT NULL
        NOT NULL
        UNIQUE,
        CHECK (Recapito >   99999999 OR Gender < 9999999999),
        
        MODO PER VERIFICARE:
            - LUNGHEZZA MINIMA VARCHAR
            - SOLI NUMERI IN VARCHAR
        */

    Recapito VARCHAR(45)
        NOT NULL
        UNIQUE,
                            
    PRIMARY KEY(ID)
);

DROP TABLE IF EXISTS Festa;
CREATE TABLE
IF NOT EXISTS Festa
(
	ID INT
        NOT NULL
        AUTO_INCREMENT,
    
    /*to do: check data non prima di oggi (dall'inizio di quest'anno?)*/
    DataFesta DATE
        NOT NULL,
    
    Luogo VARCHAR(45)
        NOT NULL,

    Citta VARCHAR(45)
        NOT NULL,

    Via  VARCHAR(45)
        NOT NULL,

    Societa INT
        NOT NULL,
	
    PRIMARY KEY(ID),

    FOREIGN KEY(Societa)
		REFERENCES Societa(ID)
	    ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS Negozio;
CREATE TABLE
IF NOT EXISTS Negozio
(
	ID INT
        NOT NULL
        AUTO_INCREMENT,
    
    Nome VARCHAR(45)
        NOT NULL,
    
    Sede VARCHAR(45)
        NOT NULL,
    
    Citta VARCHAR(45)
        NOT NULL,
    
    PRIMARY KEY(ID)
);

DROP TABLE IF EXISTS Partecipa;
CREATE TABLE
IF NOT EXISTS Partecipa
(
	Cliente INT
		NOT NULL,
    
    Festa INT
        NOT NULL,
    
    FOREIGN KEY(Cliente)
		REFERENCES Cliente(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
	
    FOREIGN KEY (Festa)
    REFERENCES Festa(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);