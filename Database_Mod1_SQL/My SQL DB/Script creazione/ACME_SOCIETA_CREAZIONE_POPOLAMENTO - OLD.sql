DROP SCHEMA IF EXISTS ACME_SOCIETA;
CREATE DATABASE IF NOT EXISTS ACME_SOCIETA;
SET FOREIGN_KEY_CHECKS = 0;
/*SET GLOBAL event_scheduler = on;*/
USE ACME_SOCIETA;

DROP TABLE IF EXISTS Societa;
CREATE TABLE IF NOT EXISTS Societa
(
	ID INT NOT NULL AUTO_INCREMENT,
	Nome VARCHAR(45) NOT NULL, 
    Sede VARCHAR (45) NOT NULL,
    Citta VARCHAR(45) NOT NULL,
    PRIMARY KEY(ID)
);

DROP TABLE IF EXISTS Costume;
CREATE TABLE IF NOT EXISTS Costume(
	ID INT NOT NULL AUTO_INCREMENT,
    Cliente INT NOT NULL,
    Negozio INT NOT NULL,
    Societa INT NOT NULL,
    Tipo VARCHAR(45) NOT NULL,
    Taglia SMALLINT NOT NULL,
    Nome VARCHAR(45) NOT NULL,
    Costo varchar(10),
    Gender varchar(1),
    PRIMARY KEY(ID),
    FOREIGN KEY(Cliente)
		REFERENCES Cliente (ID)
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
CREATE TABLE IF NOT EXISTS Cliente(
	ID INT NOT NULL AUTO_INCREMENT,
    CF VARCHAR(16) NOT NULL,
    Nome VARCHAR(45) NOT NULL,
    Cognome VARCHAR(45) NOT NULL,
    Recapito VARCHAR(17) NOT NULL,
    PRIMARY KEY(ID)
    
);

DROP TABLE IF EXISTS Festa;
CREATE TABLE IF NOT EXISTS Festa(
	ID INT NOT NULL AUTO_INCREMENT,
    DataFesta DATE NOT NULL,
    Luogo VARCHAR(45) NOT NULL,
    Societa INT NOT NULL,
	PRIMARY KEY(ID),
    FOREIGN KEY(Societa)
		REFERENCES Societa (ID)
	ON UPDATE CASCADE
    ON DELETE CASCADE
);

DROP TABLE IF EXISTS Negozio;
CREATE TABLE IF NOT EXISTS Negozio(
	ID INT NOT NULL AUTO_INCREMENT,
    Sede VARCHAR(45) NOT NULL,
    Citta VARCHAR(45) NOT NULL,
    Nome VARCHAR(45) NOT NULL,
    PRIMARY KEY(ID)
);

DROP TABLE IF EXISTS Partecipa;
CREATE TABLE IF NOT EXISTS Partecipa(
	Cliente INT NOT NULL,
    Festa INT NOT NULL,
    FOREIGN KEY(Cliente)
		REFERENCES Cliente(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
	FOREIGN KEY (Festa)
		REFERENCES Festa(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

USE acme_societa;

/*POPOLAMENTO CLIENTE*/
INSERT INTO `Cliente` (`ID`,`CF`,`Nome`,`Cognome`,`Recapito`) VALUES (1,"PVKHCJ62V26Y926K","Iris","Lawson","(+39) 4927775541"),(2,"INMQPE49S31K642L","Claudia","Baird","(+39) 3458603517"),(3,"VJQIIG70V51U115H","Blythe","Paul","(+39) 4444660205"),(4,"GRPBYU60T45O176F","Alec","Powell","(+39) 4494941593"),(5,"ISSURS65Q78Z244T","Octavius","Mcknight","(+39) 8929143088"),(6,"QISGTO68C51A179R","Adrian","Zamora","(+39) 4825524880"),(7,"MANRVR04Z23A270Z","Emi","Diaz","(+39) 3604971008"),(8,"KEDSXA52F80P166M","Yen","Berger","(+39) 6307995954"),(9,"IUSNCB05K29Z415S","Emerson","Rosario","(+39) 1025017178"),(10,"FXGDAA54Y59A469N","Vernon","Sawyer","(+39) 2535021732");
INSERT INTO `Cliente` (`ID`,`CF`,`Nome`,`Cognome`,`Recapito`) VALUES (11,"DSSKGY48V27J509U","Teegan","Petersen","(+39) 9635384258"),(12,"VSCAGI06O44Z873R","Ivan","Shields","(+39) 6621097840"),(13,"LYLGEM60A59V831E","Brody","Blanchard","(+39) 8898725280"),(14,"VXCWJX69I75L644H","Melinda","Oliver","(+39) 2607816657"),(15,"FGPWSN47M90W981J","Phyllis","Evans","(+39) 9061904431"),(16,"HAAGOR42V02C235P","Garth","Joyce","(+39) 7477630299"),(17,"TTLPFJ15K65F065I","Paul","Cohen","(+39) 7628169049"),(18,"OVYVFR57A59I451O","William","Velez","(+39) 6117484828"),(19,"BDQIIX67P58V521C","Duncan","Griffith","(+39) 6871123368"),(20,"PGZUGW51O61X911L","Melodie","Bell","(+39) 1001638143");
INSERT INTO `Cliente` (`ID`,`CF`,`Nome`,`Cognome`,`Recapito`) VALUES (21,"WXZXAR86K45F476C","Hoyt","Mccullough","(+39) 4599761832"),(22,"FDYGYW61P21O757E","Seth","Nieves","(+39) 3279263628"),(23,"BCJCWC61B61R091A","Nolan","Atkinson","(+39) 8130412887"),(24,"YHRBOC76R99P808K","Amelia","Hanson","(+39) 7023627340"),(25,"HIMTYU59P13O182G","Samson","Love","(+39) 4560035058"),(26,"GRQLBF67F75O054J","Igor","Fisher","(+39) 0999777282"),(27,"FPBXCU38M58H234X","Rhea","Drake","(+39) 3718494671"),(28,"ONBESD55N60C168T","Bruce","Young","(+39) 9350851243"),(29,"YPQLGK34S83V884R","Aline","Beasley","(+39) 5848512475"),(30,"YHEBYK62D05N922M","Fuller","Britt","(+39) 2002764104");
INSERT INTO `Cliente` (`ID`,`CF`,`Nome`,`Cognome`,`Recapito`) VALUES (31,"OEAYDM38Z02W405I","Patricia","Gallegos","(+39) 9178763146"),(32,"UEOGFL40K41Z764I","Harlan","Davenport","(+39) 4980409914"),(33,"CKIBKK08T17A849Q","Xanthus","Torres","(+39) 9581065699"),(34,"TNBAVY82E55S344C","Erasmus","Copeland","(+39) 5512024104"),(35,"QFCDRL27X48U892S","Charde","Cole","(+39) 4676097874"),(36,"MHKFVI27T79F592Y","Richard","Campos","(+39) 7215205000"),(37,"ZUARFZ77J56D854N","Ciara","Rosa","(+39) 9097482176"),(38,"ASRLPC36M95G626I","Cooper","Tillman","(+39) 4698538763"),(39,"LMQGKH21V65P268H","Zenaida","Ross","(+39) 4326012533"),(40,"DUQBTV52G73Y446T","Irma","Ramsey","(+39) 2432993275");
INSERT INTO `Cliente` (`ID`,`CF`,`Nome`,`Cognome`,`Recapito`) VALUES (41,"PMPPHL39N86X010C","Brett","Reyes","(+39) 1004664909"),(42,"NMIZXY95Y74Q833X","Prescott","Barrett","(+39) 5364701184"),(43,"UTXCAQ12C34X646N","Yen","Peters","(+39) 9986462312"),(44,"NJMWGE38X09K708C","Irma","Carpenter","(+39) 6858104340"),(45,"YMLBCD33W37C886O","Hedwig","Dennis","(+39) 4692152655"),(46,"FHKJXL93Q60I359H","Iona","Oneill","(+39) 4279607494"),(47,"UXNROG92Q10Y355F","Tatum","Madden","(+39) 1051609215"),(48,"SUZAAA31A28H823K","Briar","Houston","(+39) 3153524653"),(49,"IXSWTR44W18E685O","Fallon","Beach","(+39) 3193973610"),(50,"ANTZQN46H83Z845B","Malcolm","Mann","(+39) 1963936867");
INSERT INTO `Cliente` (`ID`,`CF`,`Nome`,`Cognome`,`Recapito`) VALUES (51,"HYZZUJ81X47L420Q","Ashely","Crawford","(+39) 2353105805"),(52,"KESNZP79O99H572X","Inez","Talley","(+39) 7749474279"),(53,"EEPSKZ62R71V301G","Orlando","Mercado","(+39) 0440144860"),(54,"EWUSTR36Q04M655N","Ryder","Kelley","(+39) 5441085487"),(55,"JNUMHZ29E47X578M","Honorato","Hensley","(+39) 1812294636"),(56,"VYYKIQ08W82D987C","Molly","Underwood","(+39) 8691265218"),(57,"SMGJRO93U85J876M","Gannon","Barrera","(+39) 4425474983"),(58,"VQUYCV13R56P047L","Brendan","Nolan","(+39) 3457166475"),(59,"NCLZXP66B23H128Z","Pandora","Madden","(+39) 9122495322"),(60,"CWMURT68H08Y107O","Stella","Bass","(+39) 5634414612");
INSERT INTO `Cliente` (`ID`,`CF`,`Nome`,`Cognome`,`Recapito`) VALUES (61,"QWOIDC23N22C277A","Clementine","Coleman","(+39) 2238425506"),(62,"RMJCSX72K90O825V","Rina","Warner","(+39) 7756628513"),(63,"MMVNYF76H84F390B","Curran","Bush","(+39) 3788909118"),(64,"HQSDWH56B53Z418Z","Aileen","Mason","(+39) 4495278690"),(65,"XHJTRG84L16Y423O","Drake","Sweet","(+39) 1362669312"),(66,"MTROWU10M44K886O","Quincy","Meyer","(+39) 1212850167"),(67,"REMPCK62F50V636A","Hanae","Russo","(+39) 1489199379"),(68,"CBFZZW00X30V355E","Ivy","Fields","(+39) 7401371522"),(69,"KYTMWC20C68J161K","Odessa","Patton","(+39) 2259726485"),(70,"JHZWEG55C39O194X","Mason","Jefferson","(+39) 9203647480");
INSERT INTO `Cliente` (`ID`,`CF`,`Nome`,`Cognome`,`Recapito`) VALUES (71,"BDIQZO16H79W113C","Chastity","Jones","(+39) 2590282577"),(72,"JBJPJS58O38U171J","Jena","Cooley","(+39) 3714861267"),(73,"PXGKBG46U47H010G","Vielka","Brock","(+39) 8688697638"),(74,"JVQOYU96P82A372A","Ethan","Morton","(+39) 1191163995"),(75,"ABAUVD94A88R187L","Isadora","Kerr","(+39) 6634950411"),(76,"MEIPGD98Y81J213L","Courtney","Pennington","(+39) 6579979168"),(77,"ZIYYRF51R78V326P","Melanie","Kaufman","(+39) 3383509670"),(78,"UTMBMH80N56S196G","Victor","Burris","(+39) 6380737986"),(79,"XOCRCZ11Y11A488H","Griffith","Diaz","(+39) 1315471755"),(80,"GLRWSG33F65V007Z","Erasmus","Byrd","(+39) 4549222748");
INSERT INTO `Cliente` (`ID`,`CF`,`Nome`,`Cognome`,`Recapito`) VALUES (81,"EMJISG63H49S579Z","Brittany","Hayes","(+39) 9236649206"),(82,"PVDOVP63X37Y640P","Benjamin","Gilmore","(+39) 4509691905"),(83,"AZVMEM00O69T966R","Dakota","Elliott","(+39) 4384514803"),(84,"HIVASV63R06H001L","Kasper","Frank","(+39) 6673029653"),(85,"ILFEZL43H89U844A","Macon","Dalton","(+39) 9406236912"),(86,"YVGKNC32N26H071C","Tiger","Merrill","(+39) 5204049301"),(87,"PPONQM56J52T464C","Bernard","Larson","(+39) 6561436877"),(88,"LUCQAW68C96P557R","Lewis","Richards","(+39) 6246643637"),(89,"HMBWYB16M99K351Z","Wallace","Mejia","(+39) 2842943999"),(90,"DMXMTB87J93T081H","Hayden","Sheppard","(+39) 6924791992");
INSERT INTO `Cliente` (`ID`,`CF`,`Nome`,`Cognome`,`Recapito`) VALUES (91,"EUYEBW82O15U589Z","Brennan","Hancock","(+39) 0839865587"),(92,"ETGVOQ37C28B542Z","Rashad","Nunez","(+39) 2882022926"),(93,"FVJKSC05N72F202S","Arsenio","Jenkins","(+39) 7472798793"),(94,"HJJNFY67O21R482D","Hasad","Gross","(+39) 0237173496"),(95,"RMEHZB20V50N033O","Mira","Robbins","(+39) 2641810187"),(96,"GZOAAG01R95F756P","Cara","Cohen","(+39) 7512411418"),(97,"NWQCLS14J98W298A","Vaughan","Knowles","(+39) 0763692300"),(98,"TXNVEN42Q08Q957B","Glenna","Vance","(+39) 2234634220"),(99,"RKUGAU52G32A575Q","Barclay","Blackburn","(+39) 8775446194"),(100,"MXUTGY46B05P717V","Fuller","Lamb","(+39) 8523446189");

/*POPOLAMENTO COSTUME*/
INSERT INTO `Costume` (`ID`,`Cliente`,`Negozio`,`Societa`,`Tipo`,`Taglia`,`Nome`,`Costo`,`Gender`) VALUES (1,87,5,51,"Germane",25,"Drenthe","129,38","M"),(2,66,70,39,"Liberty",44,"ME","278,51","M"),(3,70,6,65,"Mollie",40,"Swiętokrzyskie","369,10","M"),(4,28,5,22,"Myra",32,"SP","233,85","M"),(5,69,93,53,"Quinn",45,"SJ","327,97","F"),(6,86,50,81,"Eden",45,"Sląskie","325,03","M"),(7,76,1,82,"Zelda",47,"EX","379,90","F"),(8,3,4,77,"Summer",46,"Arica y Parinacota","205,60","M"),(9,14,15,6,"Chantale",40,"IL","360,50","F"),(10,52,55,15,"Hadassah",44,"Biobío","163,36","M");
INSERT INTO `Costume` (`ID`,`Cliente`,`Negozio`,`Societa`,`Tipo`,`Taglia`,`Nome`,`Costo`,`Gender`) VALUES (11,15,70,64,"Quinn",35,"M","35,52","M"),(12,2,16,65,"Geraldine",33,"HB","244,68","M"),(13,49,54,28,"Kalia",28,"Connacht","413,07","M"),(14,97,38,51,"Bree",33,"Diyarbakır","104,71","M"),(15,20,74,89,"Kristen",39,"North Island","247,00","M"),(16,94,66,88,"Laura",33,"UP","350,20","F"),(17,73,57,53,"Audra",28,"KP","442,37","M"),(18,28,13,12,"Imelda",26,"NSW","135,27","F"),(19,73,17,79,"Dana",25,"Osda","364,06","M"),(20,54,83,26,"Karina",45,"Victoria","195,81","F");
INSERT INTO `Costume` (`ID`,`Cliente`,`Negozio`,`Societa`,`Tipo`,`Taglia`,`Nome`,`Costo`,`Gender`) VALUES (21,49,67,71,"Quynn",44,"N.","299,58","F"),(22,72,48,19,"Hilda",40,"Western Australia","78,64","F"),(23,99,37,39,"Chiquita",34,"EX","402,79","F"),(24,87,17,83,"Mira",42,"Burgenland","324,25","M"),(25,42,88,22,"Orla",28,"Hamburg","424,77","M"),(26,20,88,75,"Iris",41,"Cambridgeshire","145,98","F"),(27,31,37,52,"Paloma",28,"Connecticut","179,01","M"),(28,76,76,53,"Gillian",32,"Valparaíso","117,35","M"),(29,47,41,65,"Blaine",41,"Ontario","324,49","M"),(30,41,10,57,"Brooke",35,"MI","85,00","M");
INSERT INTO `Costume` (`ID`,`Cliente`,`Negozio`,`Societa`,`Tipo`,`Taglia`,`Nome`,`Costo`,`Gender`) VALUES (31,62,7,20,"Rama",40,"Alabama","458,51","M"),(32,44,42,30,"Riley",40,"PA","478,58","F"),(33,80,43,2,"Hanna",26,"ON","138,53","M"),(34,24,74,72,"Hilda",37,"Ontario","282,80","M"),(35,9,78,80,"Demetria",33,"NI","214,34","F"),(36,51,37,94,"Phyllis",44,"San José","387,64","F"),(37,5,97,85,"Ginger",30,"Manitoba","300,46","M"),(38,25,93,97,"Kathleen",47,"Berkshire","267,02","M"),(39,4,55,24,"Quon",36,"BR","330,01","M"),(40,52,89,66,"Illiana",27,"AQ","54,02","M");
INSERT INTO `Costume` (`ID`,`Cliente`,`Negozio`,`Societa`,`Tipo`,`Taglia`,`Nome`,`Costo`,`Gender`) VALUES (41,54,90,78,"Astra",32,"Vlaams-Brabant","340,48","M"),(42,66,33,30,"Sade",34,"Wielkopolskie","296,97","M"),(43,98,24,39,"Blaine",27,"LU","276,65","F"),(44,63,69,37,"Violet",40,"Queensland","311,96","F"),(45,11,90,4,"Dora",44,"Warmińsko-mazurskie","398,38","M"),(46,72,90,15,"Jolene",29,"KN","215,10","F"),(47,93,29,44,"Kelsey",48,"HH","477,82","M"),(48,21,29,46,"Morgan",39,"BE","30,40","F"),(49,90,68,3,"Kevyn",45,"Metropolitana de Santiago","302,15","M"),(50,81,42,36,"Denise",32,"AN","291,46","F");
INSERT INTO `Costume` (`ID`,`Cliente`,`Negozio`,`Societa`,`Tipo`,`Taglia`,`Nome`,`Costo`,`Gender`) VALUES (51,95,36,5,"Nomlanga",45,"Wie","179,81","M"),(52,60,61,26,"Hannah",36,"WV","213,54","F"),(53,35,55,4,"Lila",48,"Metropolitana de Santiago","323,40","F"),(54,62,100,48,"Kiayada",50,"SIC","334,18","F"),(55,89,44,32,"Madeson",31,"Vlaams-Brabant","65,98","M"),(56,78,48,50,"Yvonne",44,"VII","314,96","F"),(57,51,52,54,"Jenette",50,"ON","433,69","F"),(58,5,84,43,"Tatiana",34,"Yorkshire","430,94","F"),(59,54,46,50,"Lucy",32,"Metropolitana de Santiago","28,47","M"),(60,72,54,19,"Tara",26,"Östergötlands län","221,63","M");
INSERT INTO `Costume` (`ID`,`Cliente`,`Negozio`,`Societa`,`Tipo`,`Taglia`,`Nome`,`Costo`,`Gender`) VALUES (61,38,97,56,"Linda",30,"AB","266,69","F"),(62,49,38,80,"Fay",45,"Hamburg","434,03","F"),(63,71,87,22,"Priscilla",46,"CA","363,70","M"),(64,32,74,85,"Jeanette",30,"CAM","425,83","M"),(65,87,37,87,"Rachel",26,"BE","436,92","M"),(66,47,67,74,"Blossom",32,"Lombardia","475,76","M"),(67,1,14,9,"Sheila",32,"AB","139,68","F"),(68,77,93,21,"Jana",40,"Ontario","168,42","M"),(69,97,78,97,"Beatrice",37,"Metropolitana de Santiago","210,47","M"),(70,25,69,79,"Liberty",41,"Wie","303,12","F");
INSERT INTO `Costume` (`ID`,`Cliente`,`Negozio`,`Societa`,`Tipo`,`Taglia`,`Nome`,`Costo`,`Gender`) VALUES (71,88,96,6,"Rowan",36,"HI","365,25","M"),(72,98,18,4,"Anne",31,"Nord-Pas-de-Calais","410,92","M"),(73,44,14,99,"Regan",27,"Punjab","496,82","M"),(74,79,79,30,"Nadine",33,"Virginia","353,95","F"),(75,78,16,94,"Rowan",40,"QC","131,65","F"),(76,54,5,23,"Carla",41,"Flintshire","160,38","M"),(77,30,94,48,"Kelly",44,"Gävleborgs län","244,74","F"),(78,11,84,20,"Candice",39,"Noord Holland","359,20","M"),(79,98,33,85,"Olympia",40,"PR","122,09","M"),(80,7,33,32,"Kirsten",30,"Quebec","56,18","F");
INSERT INTO `Costume` (`ID`,`Cliente`,`Negozio`,`Societa`,`Tipo`,`Taglia`,`Nome`,`Costo`,`Gender`) VALUES (81,77,68,82,"Caryn",35,"Michigan","328,31","F"),(82,16,19,67,"Helen",29,"WB","455,48","F"),(83,40,98,59,"Briar",26,"NI","420,29","M"),(84,94,2,3,"Hedy",35,"LU","441,53","M"),(85,87,43,65,"Amelia",38,"Virginia","23,55","F"),(86,97,8,81,"Rhonda",36,"NE","95,64","F"),(87,84,52,54,"Nora",49,"Ontario","146,18","F"),(88,47,31,4,"Hiroko",40,"DE","431,47","F"),(89,11,93,34,"Melodie",50,"Maranhão","261,18","M"),(90,87,16,45,"Kerry",43,"LD","304,46","M");
INSERT INTO `Costume` (`ID`,`Cliente`,`Negozio`,`Societa`,`Tipo`,`Taglia`,`Nome`,`Costo`,`Gender`) VALUES (91,84,16,17,"Leilani",31,"Andhra Pradesh","35,33","M"),(92,66,45,78,"Adara",28,"Illinois","349,61","M"),(93,82,84,96,"Veda",35,"SP","313,87","F"),(94,34,89,56,"Audrey",29,"Ulster","332,32","F"),(95,99,71,92,"Shelley",39,"Lagos","304,20","M"),(96,1,11,81,"Kirestin",45,"BU","49,26","F"),(97,47,85,80,"Hedda",49,"Berlin","131,33","F"),(98,63,15,34,"Priscilla",44,"Kujawsko-pomorskie","138,22","F"),(99,14,6,9,"Nola",25,"North Island","188,32","F"),(100,28,36,61,"Cassidy",43,"Berlin","68,14","F");

/*POPOLAMENTO FESTA*/
INSERT INTO `Festa` (`ID`,`DataFesta`,`Luogo`,`Societa`) VALUES (1,"2019-01-19","Pescasseroli",97),(2,"2019-02-04","Frigento",70),(3,"2019-02-07","Airdrie",55),(4,"2018-11-30","Buckingham",58),(5,"2019-11-12","Sellia Marina",28),(6,"2019-07-24","Tiel",4),(7,"2019-04-27","Lasne-Chapelle-Saint-Lambert",52),(8,"2019-11-18","Lodelinsart",98),(9,"2018-02-17","Pilibhit",46),(10,"2019-01-26","Folkestone",93);
INSERT INTO `Festa` (`ID`,`DataFesta`,`Luogo`,`Societa`) VALUES (11,"2019-07-25","Val Fraschione al Monte",7),(12,"2018-07-07","Port Blair",63),(13,"2018-03-12","Wagga Wagga",27),(14,"2019-08-31","Morolo",5),(15,"2018-05-23","Tübingen",41),(16,"2019-11-10","Abingdon",92),(17,"2018-08-20","Zelem",84),(18,"2019-07-22","Calmar",85),(19,"2018-11-18","Romeral",99),(20,"2018-01-25","Okpoko",43);
INSERT INTO `Festa` (`ID`,`DataFesta`,`Luogo`,`Societa`) VALUES (21,"2019-02-16","Benalla",17),(22,"2018-12-15","Chastre",13),(23,"2018-10-29","San Gregorio nelle Alpi",17),(24,"2019-03-24","Scalloway",98),(25,"2019-11-23","Saarlouis",39),(26,"2019-10-24","Liberchies",13),(27,"2018-08-01","Opgrimbie",81),(28,"2018-11-23","Moignelee",62),(29,"2019-06-04","Tire",74),(30,"2018-09-23","Tacoma",24);
INSERT INTO `Festa` (`ID`,`DataFesta`,`Luogo`,`Societa`) VALUES (31,"2019-07-03","Castiglione di Sicilia",96),(32,"2019-07-07","Bordeaux",14),(33,"2018-07-02","Béziers",97),(34,"2017-12-16","Motta Visconti",54),(35,"2019-01-13","Fahler",35),(36,"2018-02-20","Armstrong",22),(37,"2018-03-19","Palmerston",37),(38,"2018-08-28","Moignelee",32),(39,"2019-01-25","Carleton",8),(40,"2018-01-14","Houston",98);
INSERT INTO `Festa` (`ID`,`DataFesta`,`Luogo`,`Societa`) VALUES (41,"2018-07-22","Femminamorta",18),(42,"2018-08-09","Chełm",16),(43,"2019-08-27","Nossegem",28),(44,"2018-01-20","Sint-Gillis",66),(45,"2018-07-15","Stranraer",69),(46,"2018-06-13","Rixensart",90),(47,"2018-08-13","Kaiserslauter",5),(48,"2018-11-02","Thirimont",21),(49,"2019-05-17","Fort Providence",48),(50,"2019-02-26","L'Hospitalet de Llobregat",2);
INSERT INTO `Festa` (`ID`,`DataFesta`,`Luogo`,`Societa`) VALUES (51,"2019-06-26","Frasassi",79),(52,"2018-05-17","Louisville",56),(53,"2019-01-23","Amaro",91),(54,"2019-08-11","Orta San Giulio",95),(55,"2019-08-06","Paranaguá",20),(56,"2019-10-03","Acciano",11),(57,"2018-02-25","Panquehue",42),(58,"2019-11-18","Mobile",86),(59,"2019-06-27","Saint-Étienne-du-Rouvray",93),(60,"2019-05-06","Kuringen",58);
INSERT INTO `Festa` (`ID`,`DataFesta`,`Luogo`,`Societa`) VALUES (61,"2018-07-30","Lancialafava",74),(62,"2019-03-01","Sint-Amandsberg",57),(63,"2019-09-20","Morgex",65),(64,"2019-11-07","Sangerhausen",16),(65,"2017-11-30","Polatlı",50),(66,"2019-11-01","Neder-Over-Heembeek",22),(67,"2019-11-28","Waret-l'Evoque",79),(68,"2018-10-20","Garbsen",98),(69,"2018-04-17","Neu-Ulm",58),(70,"2019-01-22","Presles",55);
INSERT INTO `Festa` (`ID`,`DataFesta`,`Luogo`,`Societa`) VALUES (71,"2019-07-25","Ficulle",29),(72,"2019-05-19","Zirl",35),(73,"2019-02-05","Kooigem",64),(74,"2018-11-04","Kettering",41),(75,"2019-09-13","Ferrere",22),(76,"2019-09-07","Sobral",100),(77,"2019-01-11","Doetinchem",76),(78,"2019-01-26","Hody",32),(79,"2019-07-24","Tourinnes-Saint-Lambert",14),(80,"2018-07-25","Presteigne",43);
INSERT INTO `Festa` (`ID`,`DataFesta`,`Luogo`,`Societa`) VALUES (81,"2019-02-22","Pescia",50),(82,"2018-12-26","Salamanca",64),(83,"2018-11-15","Dingwall",28),(84,"2018-09-27","Wanneroo",54),(85,"2018-09-01","Westerlo",80),(86,"2018-06-19","Serralunga d'Alba",85),(87,"2019-03-26","Hapur",44),(88,"2017-12-11","Beauvechain",97),(89,"2018-10-15","Oostkerke",9),(90,"2018-01-07","Wells",60);
INSERT INTO `Festa` (`ID`,`DataFesta`,`Luogo`,`Societa`) VALUES (91,"2019-09-03","Campodimele",50),(92,"2018-12-11","Riesa",57),(93,"2018-11-20","Cercemaggiore",17),(94,"2018-02-23","Nagaon",82),(95,"2018-05-24","Champlain",21),(96,"2019-10-18","Lahore",37),(97,"2019-04-05","Massenhoven",47),(98,"2018-01-12","Catanzaro",30),(99,"2018-12-08","Moliterno",23),(100,"2019-06-25","Castellina in Chianti",94);

/*POPOLAMENTO NEGOZIO*/
INSERT INTO `Negozio` (`ID`,`Sede`,`Citta`,`Nome`) VALUES (1,"P.O. Box 215, 1045 Quisque St.","Linlithgow","Ut Limited"),(2,"P.O. Box 558, 5860 Feugiat Street","Preston","Tellus LLC"),(3,"7860 Velit Avenue","Wilmington","Eget Dictum Placerat Corporation"),(4,"867-4559 Cursus Av.","Milazzo","Molestie Tortor Nibh Consulting"),(5,"Ap #736-4966 Convallis Street","Merthyr Tydfil","Tempor Foundation"),(6,"251-4313 Proin Rd.","Topeka","Aliquam Eros Turpis Associates"),(7,"Ap #377-9034 Et Avenue","South Bend","Sociosqu Ad Incorporated"),(8,"5064 Erat Av.","Elx","Luctus Company"),(9,"P.O. Box 900, 5911 Feugiat. Rd.","Guadalupe","Non Lorem Vitae LLC"),(10,"638-6068 Mauris Street","Morpeth","Mauris Company");
INSERT INTO `Negozio` (`ID`,`Sede`,`Citta`,`Nome`) VALUES (11,"Ap #763-1773 Est, Avenue","Whitehaven","Donec Tempus Lorem PC"),(12,"Ap #279-1312 Commodo Rd.","Goulburn","Ridiculus Mus Consulting"),(13,"951-3395 Laoreet Rd.","Barrow-in-Furness","Vitae Odio Sagittis Ltd"),(14,"P.O. Box 347, 9071 Dolor Street","Dunoon","Sed Neque Institute"),(15,"348-1672 Et Rd.","Bordeaux","Donec Inc."),(16,"5607 Leo. St.","Clauzetto","Dui LLC"),(17,"P.O. Box 439, 5952 Tellus St.","Annapolis Royal","Phasellus Dapibus Consulting"),(18,"412-9089 Nisl. Ave","Chelmsford","Sed Foundation"),(19,"3654 Iaculis Road","Calestano","Ligula Tortor Dictum Industries"),(20,"Ap #645-8347 Nec Avenue","Leffinge","Vel Company");
INSERT INTO `Negozio` (`ID`,`Sede`,`Citta`,`Nome`) VALUES (21,"493-2938 In Av.","Saint-Remy-Geest","Adipiscing LLP"),(22,"3388 Fusce Ave","Bowling Green","Urna Corporation"),(23,"360-7990 Natoque Street","Leugnies","Enim Non Nisi LLC"),(24,"2638 Mus. St.","Solapur","Vel Est Tempor Incorporated"),(25,"Ap #130-5721 Sapien. Street","Amlwch","Mauris Inc."),(26,"Ap #902-2040 Non Road","Landau","Donec Consulting"),(27,"Ap #502-6887 Viverra. St.","Salt Lake City","Fermentum Fermentum Arcu Industries"),(28,"1036 Aliquet, Rd.","Sambreville","Quam Dignissim Pharetra Limited"),(29,"P.O. Box 431, 7550 Nullam Avenue","Bruck an der Mur","Sagittis Inc."),(30,"6350 Lorem Rd.","Mysore","Lacinia Sed Congue Corp.");
INSERT INTO `Negozio` (`ID`,`Sede`,`Citta`,`Nome`) VALUES (31,"P.O. Box 716, 7925 Ut Road","Lapscheure","Mattis Integer Eu Inc."),(32,"Ap #893-342 Parturient Rd.","Kitimat","Eu Company"),(33,"Ap #806-9924 Sed Street","Robelmont","Luctus Et Ultrices Incorporated"),(34,"537-2994 Consequat St.","North Battleford","Quisque Corp."),(35,"Ap #484-1227 Et Rd.","Mandi Bahauddin","Dictum Ultricies Institute"),(36,"835-1207 Quam Rd.","San Javier","Tincidunt Company"),(37,"Ap #596-8976 Tristique Rd.","Puyehue","Integer Vitae Nibh LLP"),(38,"P.O. Box 400, 4672 Nunc Ave","Gdańsk","Orci In Consequat LLC"),(39,"Ap #742-9506 Orci. Street","Feldkirchen in Kärnten","Velit Eget Corporation"),(40,"Ap #848-2161 Eu St.","Baton Rouge","Mauris Elit LLC");
INSERT INTO `Negozio` (`ID`,`Sede`,`Citta`,`Nome`) VALUES (41,"533-5979 Nibh. Av.","Forfar","Varius Nam Porttitor LLP"),(42,"P.O. Box 388, 5738 Ante. St.","La Serena","Tempor Bibendum Donec Incorporated"),(43,"145-518 Elementum, Road","Ville de Maniwaki","Convallis Convallis Foundation"),(44,"P.O. Box 171, 6090 Conubia Road","Neusiedl am See","Arcu Sed Eu Corp."),(45,"P.O. Box 482, 207 Consequat Ave","Nurallao","Curabitur LLP"),(46,"Ap #119-3811 Suspendisse Road","San Juan de Dios","Nunc Corporation"),(47,"P.O. Box 532, 4023 Velit. Street","Namen","Aenean Egestas Institute"),(48,"P.O. Box 869, 8595 Ante. Rd.","Notre-Dame-de-la-Salette","Posuere Corporation"),(49,"838-8440 Blandit Av.","Phoenix","Vel Faucibus Id Limited"),(50,"7827 Sed Rd.","Lincoln","A Associates");
INSERT INTO `Negozio` (`ID`,`Sede`,`Citta`,`Nome`) VALUES (51,"Ap #618-1644 Neque. Ave","Coldstream","Pharetra Nam Ltd"),(52,"2809 Metus. St.","Ilesa","Non Company"),(53,"P.O. Box 888, 5378 Mattis Av.","Rio Marina","Vitae Limited"),(54,"Ap #843-6948 Ac, St.","Marchtrenk","Turpis In Incorporated"),(55,"927-3413 Nonummy Street","Joliet","Aliquet Vel Vulputate Institute"),(56,"Ap #138-4201 Vulputate, Street","Noville","Vivamus Sit Industries"),(57,"Ap #741-9684 Auctor, St.","Sapele","Massa Lobortis Ltd"),(58,"Ap #291-1939 Vitae Avenue","Osorno","Purus Duis Elementum Consulting"),(59,"498-4583 Nulla. Road","Champion","Nulla Incorporated"),(60,"Ap #878-9453 Sagittis Avenue","Vlimmeren","Donec Consectetuer Foundation");
INSERT INTO `Negozio` (`ID`,`Sede`,`Citta`,`Nome`) VALUES (61,"Ap #929-4525 Integer Road","Acquasanta Terme","Augue Porttitor Ltd"),(62,"P.O. Box 281, 4156 Cras St.","Monte Vidon Corrado","Feugiat Non Lobortis Consulting"),(63,"P.O. Box 964, 4827 Pede. Road","Wedel","Nonummy Ultricies Ornare Incorporated"),(64,"3659 Sem Avenue","Codegua","Ad Litora Company"),(65,"P.O. Box 880, 2854 At, St.","Lodine","Eros Limited"),(66,"663-4167 Aliquam Street","Bokaro Steel City","Sodales Elit Incorporated"),(67,"6556 Mauris Rd.","Canterbury","Cras Company"),(68,"412-970 Mauris St.","Warburg","Justo Foundation"),(69,"340-574 Nec St.","Annapolis County","Pede Consulting"),(70,"9015 Cursus, Rd.","Rycroft","Sed Incorporated");
INSERT INTO `Negozio` (`ID`,`Sede`,`Citta`,`Nome`) VALUES (71,"9565 Accumsan St.","Fraser Lake","Augue Eu Tempor LLP"),(72,"P.O. Box 593, 6721 Ridiculus Rd.","Rotello","Odio Industries"),(73,"532-2480 Nec Avenue","Saint-GŽry","Adipiscing Non Foundation"),(74,"428-6165 Phasellus Road","Södertälje","Felis Eget Institute"),(75,"Ap #219-5742 At, Rd.","Hamme","Montes Nascetur Ridiculus Foundation"),(76,"946-3972 Dolor. St.","Annapolis Royal","Nullam Enim Ltd"),(77,"P.O. Box 209, 6479 Parturient Street","Kirriemuir","Erat Eget Ipsum Ltd"),(78,"975-4795 Volutpat. St.","Alajuelita","Arcu Institute"),(79,"P.O. Box 160, 1944 Aliquam Avenue","Diego de Almagro","Eget Company"),(80,"996-6092 Gravida. Road","Sivry","Dignissim Magna LLC");
INSERT INTO `Negozio` (`ID`,`Sede`,`Citta`,`Nome`) VALUES (81,"P.O. Box 541, 4010 Sagittis St.","Sint-Denijs-Westrem","Aliquam Gravida Mauris Inc."),(82,"Ap #937-6126 At St.","Gignod","Auctor Industries"),(83,"618-3414 Iaculis Rd.","Wood Buffalo","Et Ultrices Posuere LLC"),(84,"2825 Gravida Rd.","Tacoma","Urna Nunc Quis Ltd"),(85,"659-5773 Vitae Ave","Nocera Umbra","Congue In Institute"),(86,"712-7506 Rhoncus Avenue","Duque de Caxias","Non Quam Pellentesque Inc."),(87,"Ap #455-1943 Sem Av.","Chapecó","Aenean Massa Integer Limited"),(88,"9375 Aenean Road","Campbelltown","Aliquam Auctor Velit Limited"),(89,"P.O. Box 245, 7131 Non Street","Gerpinnes","Bibendum Ullamcorper Industries"),(90,"P.O. Box 226, 6861 Nullam Road","Marentino","Dolor Nonummy Industries");
INSERT INTO `Negozio` (`ID`,`Sede`,`Citta`,`Nome`) VALUES (91,"715-1404 Nec Avenue","Andenne","A Magna Lorem Corp."),(92,"P.O. Box 879, 8933 Eget Rd.","Bernburg","Duis Dignissim Corporation"),(93,"P.O. Box 381, 4574 Facilisis Rd.","Campofelice di Fitalia","Amet Consectetuer Adipiscing Corp."),(94,"Ap #247-6580 Ipsum Av.","Ucluelet","Euismod In Corp."),(95,"1906 Interdum. Street","Swan Hills","Lacinia Sed Congue PC"),(96,"466-9860 Vulputate St.","B.S.D.","Amet Dapibus LLC"),(97,"420-639 Vel Road","La Florida","Adipiscing Elit Consulting"),(98,"414-3269 Vel, Rd.","Pforzheim","Non Hendrerit Id PC"),(99,"Ap #589-6525 Sit Ave","Manukau","Cursus Diam At Corp."),(100,"535-2437 Quam. Rd.","Oromocto","Pharetra Nam Ac Institute");

/*POPOLAMENTO SOCIETA*/
INSERT INTO `Societa` (`ID`,`Nome`,`Sede`,`Citta`) VALUES (1,"Odio Semper Cursus Corporation","Ap #988-8135 Dolor Avenue","Girifalco"),(2,"Velit Quisque LLP","P.O. Box 825, 5120 Elit, Road","Sala Baganza"),(3,"Eget Varius Limited","Ap #293-889 Facilisis. Street","Raj Nandgaon"),(4,"Accumsan Limited","9225 Nunc. Ave","Montes Claros"),(5,"Luctus Sit Amet Institute","P.O. Box 838, 2594 Et, St.","Puntarenas"),(6,"Euismod Est Arcu Institute","699-6412 Malesuada. Av.","Cuceglio"),(7,"Cum LLP","Ap #145-5467 Suspendisse Rd.","Thurso"),(8,"Ac Inc.","7915 Vulputate, Rd.","Río Negro"),(9,"Condimentum Donec Ltd","240-7643 Diam. Rd.","Würzburg"),(10,"Quis Accumsan Convallis Corp.","7671 Vel Rd.","Sambuca Pistoiese");
INSERT INTO `Societa` (`ID`,`Nome`,`Sede`,`Citta`) VALUES (11,"Lectus PC","4760 Sed Street","Bolzano/Bozen"),(12,"Rutrum Fusce Institute","P.O. Box 239, 5515 Tellus. Rd.","Waasmunster"),(13,"Risus Odio Auctor Corp.","Ap #480-7860 Eget Ave","Napoli"),(14,"Mi Limited","Ap #457-1141 Enim. St.","Berwick-upon-Tweed"),(15,"Ac Company","230-8339 Dis St.","Adelaide"),(16,"Rutrum Fusce Dolor Inc.","9028 A, Street","Halifax"),(17,"Est PC","P.O. Box 595, 1808 Lacus. Street","Poole"),(18,"Sit Amet Ltd","P.O. Box 239, 1046 Lectus, Street","Sart-Dames-Avelines"),(19,"Gravida Incorporated","4920 Auctor Rd.","Albi"),(20,"Lorem Luctus Inc.","2361 Sapien, Rd.","Picture Butte");
INSERT INTO `Societa` (`ID`,`Nome`,`Sede`,`Citta`) VALUES (21,"Mauris Nulla Company","Ap #920-621 Eget Rd.","Antwerpen"),(22,"Sit Amet Industries","519-3431 Nulla. St.","Lesve"),(23,"Quam Vel Sapien LLC","Ap #154-189 Nullam St.","Gibsons"),(24,"Ac Industries","760-9573 Turpis. Av.","Mont"),(25,"Duis A Mi Institute","Ap #206-2215 Odio Rd.","Hudiksvall"),(26,"Massa Integer Vitae LLP","657-8750 Integer Av.","Piracicaba"),(27,"Pellentesque Ltd","Ap #375-4212 Aliquet Rd.","Hamilton"),(28,"Vestibulum Corp.","257-4858 Ullamcorper Street","Bajardo"),(29,"Quis Company","Ap #978-2820 Gravida Avenue","As"),(30,"Sed PC","6061 Mi Av.","Wangaratta");
INSERT INTO `Societa` (`ID`,`Nome`,`Sede`,`Citta`) VALUES (31,"Non Associates","P.O. Box 967, 9783 Non, Ave","Gulfport"),(32,"Fermentum Incorporated","669-6438 Turpis. Road","Koolkerke"),(33,"Enim Gravida Sit Institute","962-4796 Sed Rd.","San Donato di Ninea"),(34,"Imperdiet Ornare Industries","Ap #984-1812 At Ave","Rancagua"),(35,"Aliquet Inc.","Ap #660-2916 Lacinia Ave","Luton"),(36,"Netus LLP","747 Dolor. Road","Mondolfo"),(37,"Augue Malesuada Inc.","5435 Mauris St.","Barghe"),(38,"Ipsum Non Institute","7803 Tincidunt Ave","Ambresin"),(39,"Quis PC","5203 Adipiscing Av.","Freiberg"),(40,"Rutrum LLC","1471 Commodo Rd.","Dessel");
INSERT INTO `Societa` (`ID`,`Nome`,`Sede`,`Citta`) VALUES (41,"Odio Phasellus Consulting","Ap #469-1997 Non St.","Viranşehir"),(42,"Nascetur Ridiculus Mus Industries","Ap #322-2744 Phasellus Av.","The Hague"),(43,"Nec Imperdiet LLP","P.O. Box 949, 7302 Suspendisse Ave","Thunder Bay"),(44,"Ac Nulla In Corporation","Ap #948-1901 Varius Avenue","Melazzo"),(45,"Lectus Rutrum Associates","145 Suspendisse Av.","Queilén"),(46,"Sed Pede Foundation","5486 Pellentesque. Road","TrognŽe"),(47,"Dapibus PC","698-9179 Vitae Avenue","Colledimacine"),(48,"Vestibulum Corporation","P.O. Box 717, 8286 Id Ave","Bienne-lez-Happart"),(49,"Sed Libero Corp.","Ap #527-8530 Facilisis St.","Tiegem"),(50,"Arcu Sed Corp.","P.O. Box 227, 5569 Convallis Av.","Grandrieu");
INSERT INTO `Societa` (`ID`,`Nome`,`Sede`,`Citta`) VALUES (51,"Enim Sed Nulla LLP","987-8638 Mauris Ave","Gargazzone/Gargazon"),(52,"Egestas Ligula Incorporated","6725 Imperdiet Avenue","Portland"),(53,"Erat Eget Inc.","Ap #321-2811 Leo. Ave","Sneek"),(54,"Non Inc.","P.O. Box 141, 4527 Rhoncus. Street","Barmouth"),(55,"Mauris Magna PC","1409 Accumsan Rd.","Cincinnati"),(56,"Est Corp.","Ap #381-5480 Lacinia. Ave","South Portland"),(57,"Tempus LLP","Ap #904-5308 Pellentesque Ave","Cottbus"),(58,"At LLC","Ap #284-2283 Vel Avenue","De Klinge"),(59,"Mi Fringilla Mi Foundation","6186 Faucibus St.","Wells"),(60,"Maecenas Limited","6866 Amet Av.","Kędzierzyn-Koźle");
INSERT INTO `Societa` (`ID`,`Nome`,`Sede`,`Citta`) VALUES (61,"Tristique Pharetra Limited","9206 Imperdiet Street","Retie"),(62,"Sodales Company","Ap #724-3894 Sodales Street","Longano"),(63,"Risus Donec Incorporated","Ap #615-5435 Non Avenue","Woodlands County"),(64,"Dictum PC","3139 Cursus, Ave","Gisborne"),(65,"Ante Company","9566 Ligula St.","Poppel"),(66,"Mauris Vestibulum Institute","Ap #521-2722 Ut Av.","Lachine"),(67,"Eu Corporation","Ap #251-8770 Non Avenue","Fort St. John"),(68,"Penatibus Et Magnis Company","Ap #610-9895 Integer Av.","Asbestos"),(69,"Consectetuer Adipiscing Associates","4863 Curabitur Rd.","Darbhanga"),(70,"Ante Blandit Viverra Company","9073 Ligula Rd.","Goulburn");
INSERT INTO `Societa` (`ID`,`Nome`,`Sede`,`Citta`) VALUES (71,"Ipsum Suspendisse Ltd","131-6709 Libero St.","Putaendo"),(72,"Integer Vulputate Risus Institute","2670 Tellus Rd.","Burgos"),(73,"Consectetuer Adipiscing Corp.","8893 Lobortis Avenue","Fayetteville"),(74,"Non Egestas Inc.","560-2884 Velit Rd.","Kirkland"),(75,"Malesuada Malesuada Integer Corporation","639-2433 A Avenue","Leeds"),(76,"Sed Eu Corp.","7357 Phasellus Avenue","Daiano"),(77,"Odio Sagittis Semper LLP","P.O. Box 879, 6519 Primis Rd.","Firenze"),(78,"Magna Lorem Ipsum Company","4210 Elit Ave","Augsburg"),(79,"Nam Ac Consulting","9038 Sed Street","Papasidero"),(80,"Interdum Ligula Corp.","Ap #956-5234 Proin Street","Avelgem");
INSERT INTO `Societa` (`ID`,`Nome`,`Sede`,`Citta`) VALUES (81,"Ipsum Nunc Incorporated","P.O. Box 227, 9572 Aliquam St.","Pereto"),(82,"Duis LLC","7966 A, Av.","Serik"),(83,"Etiam Imperdiet Dictum Corp.","P.O. Box 308, 2563 Etiam St.","Sudbury"),(84,"Massa Lobortis Inc.","Ap #692-8527 Magna Ave","Przemyśl"),(85,"Auctor Foundation","300-1713 Imperdiet Street","San Giorgio Albanese"),(86,"Tempor Bibendum Donec Ltd","Ap #733-7206 Molestie St.","Bünyan"),(87,"Aenean Sed Pede LLC","776-3023 Morbi Ave","Oostende"),(88,"At Ltd","940-6995 Taciti Avenue","Smithers"),(89,"Commodo Auctor LLP","2206 Eleifend St.","Ceuta"),(90,"Sit Amet Consulting","926-7510 Molestie St.","Sinaai-Waas");
INSERT INTO `Societa` (`ID`,`Nome`,`Sede`,`Citta`) VALUES (91,"Semper Cursus Limited","618-5173 Nec, Rd.","Sint-Andries"),(92,"Non Industries","P.O. Box 457, 176 Libero Avenue","Norman Wells"),(93,"Nostra Per LLP","7670 Diam Road","Canoas"),(94,"Cursus A Incorporated","Ap #498-821 Proin Rd.","North Saanich"),(95,"Vestibulum Massa Rutrum Industries","P.O. Box 551, 4927 Lorem St.","Argyle"),(96,"In Ornare Sagittis Corporation","P.O. Box 841, 9183 Cras St.","Aklavik"),(97,"Bibendum Associates","2010 Vulputate Av.","Castel di Tora"),(98,"Ipsum Company","P.O. Box 293, 6410 Lectus Ave","Friedberg"),(99,"Malesuada Augue Ut Inc.","P.O. Box 411, 3502 Ipsum St.","Helena"),(100,"Vestibulum Industries","P.O. Box 303, 9868 Nec St.","Darıca");

/*POPOLAMENTO PARTECIPA*/
INSERT INTO `Partecipa` (`Cliente`,`Festa`) VALUES (70,28),(10,37),(76,91),(69,60),(63,61),(24,92),(89,4),(84,74),(18,59),(74,46);
INSERT INTO `Partecipa` (`Cliente`,`Festa`) VALUES (72,66),(6,58),(46,91),(8,75),(40,78),(20,9),(87,35),(56,60),(60,8),(84,61);
INSERT INTO `Partecipa` (`Cliente`,`Festa`) VALUES (35,55),(97,41),(82,6),(77,45),(54,57),(7,97),(14,49),(7,74),(46,15),(21,89);
INSERT INTO `Partecipa` (`Cliente`,`Festa`) VALUES (63,37),(6,63),(64,27),(100,40),(74,89),(47,95),(94,94),(59,31),(25,37),(22,39);
INSERT INTO `Partecipa` (`Cliente`,`Festa`) VALUES (30,64),(37,95),(42,29),(50,100),(98,19),(82,56),(89,65),(46,72),(74,100),(11,67);
INSERT INTO `Partecipa` (`Cliente`,`Festa`) VALUES (34,73),(100,21),(15,32),(91,13),(80,24),(21,59),(75,56),(49,4),(3,5),(18,23);
INSERT INTO `Partecipa` (`Cliente`,`Festa`) VALUES (84,97),(77,15),(94,24),(36,31),(65,49),(82,22),(12,25),(23,85),(74,57),(45,41);
INSERT INTO `Partecipa` (`Cliente`,`Festa`) VALUES (52,15),(100,60),(43,19),(1,56),(72,7),(64,95),(40,10),(94,9),(77,53),(70,60);
INSERT INTO `Partecipa` (`Cliente`,`Festa`) VALUES (13,62),(79,73),(21,54),(16,5),(94,52),(96,96),(91,22),(49,89),(38,68),(72,30);
INSERT INTO `Partecipa` (`Cliente`,`Festa`) VALUES (12,100),(11,71),(47,22),(41,19),(62,16),(78,62),(57,5),(65,26),(89,34),(91,75);




























