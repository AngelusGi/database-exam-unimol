DROP SCHEMA IF EXISTS ACME_SOCIETA;
CREATE DATABASE IF NOT EXISTS ACME_SOCIETA;
SET FOREIGN_KEY_CHECKS = 0;
#SET GLOBAL event_scheduler = on;

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
    
    CHECK(DataFesta),

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

USE acme_societa;

/*POPOLAMENTO CLIENTE*/
INSERT INTO `cliente` (`ID`,`CodiceFiscale`,`nome`,`cognome`,`recapito`)
    VALUES
(1,"GKILXF38V09I421A","Lucio","Ruggeri","lobortis@orci.org"),
(2,"TGBDPI33N41Z738R","Erika","Basile","tempor@Integervulputate.edu"),
(3,"XZTDGW01O21A258M","Gianpiero","Amato","ipsum.dolor.sit@vestibulumMauris.co.uk"),
(4,"NDTRGV46H87H169P","Martina","Pagano","nec.mollis.vitae@necleoMorbi.ca"),
(5,"YFUXKC87E39H535W","Alessia","Poli","Vivamus.non.lorem@ultricesVivamus.com"),
(6,"CLMZIP21I41M826Y","Angela","Gargiulo","Phasellus.ornare.Fusce@Aenean.ca"),
(7,"HDKUXH03K38Q808V","Stefano","Villani","libero.Proin@erat.net"),
(8,"MOJDNH27P02B638V","Lorenzo","Vitali","Ut.nec.urna@lorem.net"),
(9,"YEBKTF74Q95X663C","Jessica","Pellegrini","et.rutrum@arcuac.edu"),
(10,"FHRZVT19R94J737C","Diego","Caruso","ullamcorper@placerategetvenenatis.co.uk"),
(11,"PLXPGB81P12X143B","Alberto","Mele","ac@Nullamsuscipit.co.uk"),
(12,"MPQYMK60B70R591M","Stefano","Pozzi","tempus.lorem.fringilla@risusa.co.uk"),
(13,"YBOSCJ39N49T640R","Tommaso","Ferraro","tempus.non@Namnullamagna.co.uk"),
(14,"MJOMPQ89Q29X845B","Irene","Montanari","nisl.Maecenas.malesuada@dolor.net"),
(15,"RSDLVO64Q65Q106U","Emma","Piras","volutpat.nunc@nullaDonec.org"),
(16,"MMTEKP85F01F577M","Matilde","Costa","In.condimentum.Donec@dolorelit.com"),
(17,"PSXAWX22G87T491C","Valerio","Ricciardi","lorem.ipsum@cursusNunc.org"),
(18,"XLRJPG03X31A233H","Serena","Lorusso","vel@enim.co.uk"),
(19,"EHIOUL17V55I911N","Daniele","Carbone","ullamcorper.euismod@Quisqueliberolacus.com"),
(20,"WWTMRM27M58Y608J","Simona","Proietti","lacinia.at@varius.com"),
(21,"GIPZRR76X13T195X","Federica","Pellegrini","id.nunc.interdum@pedeCumsociis.ca"),
(22,"KWCQUW67D80K533P","Eleonora","Pellegrino","tristique.neque.venenatis@nec.net"),
(23,"AMLSLC84K44X274Y","Nicolò","Rossi","Integer.vitae@vel.org"),
(24,"DNSSHT90K90P144U","Pietro","Guidi","mauris@urnaVivamus.edu"),
(25,"SPLPYG98T27Y433Q","Nicola","Colombo","amet@magnaPraesentinterdum.co.uk"),
(26,"DRILQH04W45L211R","Giulia","Messina","libero.Integer@Nullatempor.edu"),
(27,"AECXSA15V41N691T","Christian","Grassi","mauris@loremfringillaornare.net"),
(28,"IKZUZB18U40U189E","Alberto","Giuliani","nec@dui.co.uk"),
(29,"ZNXDKN34Z07T381D","Alessia","Serra","dolor.egestas@nec.ca"),
(30,"DJGWZM49D55Z710B","Federico","Marchetti","auctor.quis@Suspendisse.co.uk"),
(31,"YOIIGX87J29P192O","Arianna","Ferro","nec.enim.Nunc@faucibus.ca"),
(32,"OWDTJG09A91Q159A","Alice","Poli","feugiat@acfermentum.edu"),
(33,"LYENWE98W98J114F","Dario","Romano","fringilla@nisidictumaugue.com"),
(34,"FXMPHD92S64S060S","Simona","Gargiulo","elit@Morbi.com"),
(35,"MYBTAP77X27U327C","Domenico","Sorrentino","ac.feugiat@egestaslacinia.ca"),
(36,"NJNEQK55V39C394F","Alessia","Mariani","Duis.elementum.dui@risus.org"),
(37,"IYIZTK70U54Q847R","Jacopo","Caputo","adipiscing.Mauris@lacus.co.uk"),
(38,"CQNARG55A46Y541Q","Maria","Ferrara","sit.amet@lobortisultrices.edu"),
(39,"RDGKVX38S30F738R","Edoardo","Barone","tellus.Phasellus@Praesentinterdumligula.org"),
(40,"AUDZNN23W22G416I","Anna","Mazza","vestibulum.nec@ornarelectus.ca"),
(41,"FBDAJC89Z43T474D","Luigi","De Rosa","dictum.eleifend@egestas.co.uk"),
(42,"IZIVVO61Z52Q841V","Francesca","Marino","nulla.Integer.urna@Etiamvestibulum.edu"),
(43,"DLZGLR76O03P509C","Christian","Bellini","Nullam.ut.nisi@nonummyut.org"),
(44,"GSIUJD88I42Z123U","Sofia","Bruno","ultrices.a@laoreet.edu"),
(45,"KHTCKG81G20A586H","Matteo","Lombardo","nulla@vitaeerat.edu"),
(46,"TIMRCV26K08T462I","Filippo","Ferri","aliquam.eu@enimsit.edu"),
(47,"FXGTGF65G37F572I","Erika","Pellegrini","ipsum.nunc@fringillaest.org"),
(48,"YIJKFV11A96S199T","Monica","De Santis","urna.Vivamus.molestie@facilisisnon.net"),
(49,"GRXFMS58E36C062M","Giulia","Piazza","cubilia@ligulaDonec.edu"),
(50,"YKWZVT68S31B369H","Giuseppe","Perrone","nunc.sit.amet@ut.net"),
(51,"VDJLAW27P19L878H","Ginevra","Monti","ipsum.Curabitur.consequat@Nuncullamcorper.it"),
(52,"YUXFSH37N11Z532F","Enrico","Orlando","amet.lorem.semper@amalesuadaid.org"),
(53,"OPZFLG41M63K133X","Noemi","Moro","porttitor.eros.nec@orci.edu"),
(54,"WYNYXO63Q17T835Z","Giorgio","Morelli","pede.malesuada@Curabiturconsequatlectus.co.uk"),
(55,"BBONWH43Q29U158G","Antonio","Bernardi","iaculis.lacus@aliquetsem.ca"),
(56,"RBBDAF08C36J014X","Monica","Palmieri","lobortis.risus@ligulaelit.ca"),
(57,"ICBFQP90I68U365D","Martina","Mariani","amet@montesnasceturridiculus.co.uk"),
(58,"YCBLRH38Y68I155Z","Sofia","Piras","lectus@ipsumdolorsit.org"),
(59,"EFIDCK46S57C690L","Mirko","Giuliani","fermentum@Aendean.com"),
(60,"CVPXVN42R53Q509U","Nicola","Proietti","odio.a.purus@facilisisnon.org"),
(61,"RNUPCD90U03N389P","Emma","Bernardi","ac.mattis.velit@diamPellentesquehabitant.ca"),
(62,"YIHTMU32J10D303K","Ginevra","Conte","ridiculus@ornareegestasligula.net"),
(63,"HVJKTL99D20W963C","Elena","Orlando","dictum.eu.placerat@vel.ca"),
(64,"MIDYNW26B43V363M","Diego","Ruggiero","arcu.Nunc@egetnisi.com"),
(65,"XRMEWH05A63W535O","Jessica","Orlando","ante@facilisisegetipsum.com"),
(66,"NMPSTM10J17E970Z","Claudio","Bernardi","Cras.sed@ullamcorpereu.edu"),
(67,"SWOKVX43W38Y293I","Giada","Cavallo","sapien.Afenean.massa@utpharetrased.org"),
(68,"DDUZAQ59Z72K895T","Angelo","Sanna","nec.eleifend@laoreetliberoet.org"),
(69,"CFVSRP00T35G432P","Vincenzo","Esposito","consequat.auctor@antedictumcursus.edu"),
(70,"FZQMLI24M32D461C","Giorgia","Pellegrini","Nunc.laoreet.lectus@sociisnatoque.ca"),
(71,"XYFEFD73W67S065G","Camilla","Cirillo","dignissim@loremvitaeodio.co.uk"),
(72,"IWQBDS57L55W736K","Filippo","Leone","nec@tincidunt.co.uk"),
(73,"NZFZPE80E21Q798H","Tommaso","Valente","rutrum.non@Nullaegetmetus.ca"),
(74,"SQNBSH41Y75U944U","Domenico","Olivieri","Phasellus.dapibusQuam@aliquetvelvulputate.edu"),
(75,"QWOBUJ08Z18R399X","Andrea","Arena","Etiam@tortor.net"),
(76,"BVSKFP75H07N556J","Claudia","Ceccarelli","mi.lorem@anuncIn.ca"),
(77,"UAECEW76N91Y432K","Giacomo","Farina","neque@parturientmontesnascetur.com"),
(78,"NTKWMW15J02Z338D","Giulia","Ferrari","malesuada.fames.ac@lectus.com"),
(79,"SPPLPH91K65N235H","Manuela","Santini","mauris.Morbi.non@tristiquesenectus.com"),
(80,"DXYUMZ77S64B916Y","Michele","Grimaldi","quam.dignissim@Morbiaccumsanlaoreet.ca"),
(81,"TODAZT32N18Z513Y","Alessandra","Guidi","mauris.Suspendisse@sodalesnisi.org"),
(82,"TQHKYP13O85Q641V","Salvatore","Serra","a@elitdictum.edu"),
(83,"ILXTJL01B14S891M","Eleonora","Monti","lacinia.mattis@at.ca"),
(84,"USBZCR63C45Z846O","Mattia","Testa","tempor.augue@lorem.co.uk"),
(85,"QUVLOJ12P95S086Q","Emanuele","De Angelis","ac.ipsum@nibhAliquamornare.co.uk"),
(86,"WMCPOS91V53T215M","Veronica","Villa","viverra.Donec@malesuadavel.co.uk"),
(87,"JZYCQU78T25F205U","Giorgia","Marchi","primis.in.faucibus@Proinegetodio.net"),
(88,"RXVCBL96I10W331G","Angela","Palmieri","Cras@semperetlacinia.net"),
(89,"HYJDHU90G62T661J","Nicola","De Luca","Duis.cursus.diam@dapibus.ca"),
(90,"ZQWZRA32M64K227W","Jacopo","Fiore","pede.Suspendisse.dui@duinec.org"),
(91,"ZZAVRN66K44Y581I","Valeria","Mariani","posuere@metus.com"),
(92,"XWYWCB10B73A000F","Marco","Santoro","arcu@quisurna.ca"),
(93,"PRAATF54U25S969S","Marco","Catalano","aliquet@Aliquam.org"),
(94,"GLLROW58R64L891H","Gianluca","Ferrari","amet.ornare.lectus@pede.org"),
(95,"ZDWDCV20K89J797N","Anna","Olivieri","libero.Donec.consectetuer@sedpedeCum.org"),
(96,"LIRERI61M57R862Y","Salvatore","Pepe","faucibus.ut.nulla@libero.net"),
(97,"LOQKYO09D09K165S","Viola","Rinaldi","eget@euismod.org"),
(98,"IJVSWO53X53Y789C","Noemi","Orlando","amet.diam@magnaa.org"),
(99,"HGPQTX06V16S014O","Veronica","Moro","Donec@risusodio.net"),
(100,"LNODFF56Z29L011N","Federico","Montanari","Donec.nibh.Quisque@dignissimlacusAliquam.com");


/*POPOLAMENTO COSTUME*/
INSERT INTO `costume` (`BarCode`,`cliente`,`negozio`,`societa`,`tipo`,`taglia`,`nome`,`costo`,`gender`)
    VALUES
("9978476972344",9,4,42,"AnticaGrecia","XXLb","Scott","128.67","F"),
("5338864656755",21,90,28,"Animali","Sa","Carrillo","596.57","F"),
("2725918224295",56,95,31,"Lusso","XLb","Torres","476.82","F"),
("6764775214239",74,42,22,"Cofanetti","XXLa","Holder","843.17","M"),
("6536398687253",55,81,97,"Cavalieri","XXLb","Spears","238.18","M"),
("3982895759318",12,74,26,"Cabaret","Sa","Mckee","739.87","F"),
("9866685771958",57,95,78,"Anni80","Sa","Farmer","856.53","F"),
("3128567886784",50,85,76,"Unicorno","XSa","Mckee","14.80","F"),
("3496591524619",26,7,37,"Anni70","XSb","Rocha","731.90","M"),
("4677177186741",90,16,47,"Cavalieri","XLa","Hubbard","404.16","F"),
("4425756594996",89,87,8,"Shock","XSb","Clay","658.41","F"),
("8544758418654",63,98,67,"Anni80","Sa","Hughes","512.17","F"),
("9818811492563",72,53,20,"Unicorno","XXLa","Riggs","424.77","M"),
("7948214886873",86,59,72,"Disney","XXLa","Benton","285.18","F"),
("3488319723223",8,89,15,"Ballerine","XSa","Patterson","633.47","M"),
("4676246738417",95,14,92,"Disney","Sa","Moore","424.69","M"),
("8245627588399",22,81,81,"Antichi","Sa","Holt","480.10","F"),
("1519412137866",59,73,79,"Fantasy","La","Campbell","233.96","F"),
("6588993243292",67,29,31,"Storici","XLa","Byrd","870.94","F"),
("5919565181784",20,6,39,"Storici","XLa","Bernard","677.18","F"),
("8176381631131",71,46,46,"AnticoEgitto","Sb","Miranda","5.32","F"),
("4124573554587",46,96,85,"Anni80","Mb","Lambert","721.14","M"),
("4332448344663",81,46,8,"Unicorno","XSb","Callahan","62.55","M"),
("3457759437559",34,8,98,"Lusso","XXLb","Craig","298.56","M"),
("2315654562149",12,95,57,"Zombie","XLa","Leon","889.80","F"),
("7311635628746",5,70,44,"Chica","Mb","Kent","771.72","M"),
("7552774962597",72,76,8,"Zucche","Ma","Cummings","392.01","M"),
("1619861292933",9,50,48,"Comics","XLb","Britt","33.15","F"),
("5285717516494",53,97,36,"Storici","XSb","Brady","876.73","M"),
("7695849882771",4,11,17,"BlackAndWhite","XLa","Woods","455.12","F"),
("4326611553691",61,22,61,"Chic","Sa","Salas","136.12","M"),
("5319217371631",92,17,82,"Mestieri","Sa","Bates","267.83","M"),
("2565963718215",56,49,46,"Economici","XLb","Landry","424.04","M"),
("3493648874126",21,56,21,"Clowns","Sa","Ross","12.32","M"),
("1396183655533",9,53,18,"Clowns","La","Melton","825.43","F"),
("1244394399424",13,69,82,"Anni60","XLb","Shepherd","186.79","M"),
("7843724771988",84,2,60,"Shock","XLa","Graham","459.26","F"),
("9111925827261",16,63,63,"Diavoli","XSb","Kramer","644.94","M"),
("5926672328388",56,89,43,"Cowboys","Sa","Gentry","715.02","M"),
("4829884585185",20,52,79,"Unicorno","XXLa","Wright","804.05","F"),
("5898515868359",97,79,36,"Anni50","La","Vazquez","289.99","F"),
("5472858372153",11,87,17,"Anni60","XSb","Downs","593.25","F"),
("1524738695949",32,53,23,"Cofanetti","Mb","Cooley","179.35","F"),
("2726476788532",41,20,92,"Shock","Ma","Melton","110.00","M"),
("5492282551173",82,80,24,"Gonfiabili","XLa","Lara","660.57","M"),
("9794515313345",35,13,3,"Cowboys","XLb","Talley","719.86","F"),
("5249822962265",89,20,80,"Cowboys","XSb","Lee","385.46","M"),
("8157236964133",81,74,59,"Anni60","Sa","Solomon","466.82","M"),
("7475246883456",97,62,66,"Cofanetti","XSb","Patton","361.45","F"),
("6648296437411",6,85,54,"Gangsters","Sa","Fox","276.67","F"),
("7166234321392",55,77,33,"Cabaret","XLb","Suarez","662.54","F"),
("9678393492214",65,21,2,"Unicorno","La","Morrison","406.99","F"),
("6317191592888",15,100,80,"Anni70","Ma","Griffith","695.28","M"),
("1125438641581",17,18,23,"Fantasy","XSa","Chambers","791.00","F"),
("4566571933835",45,50,22,"Comics","XSa","Cote","412.34","M"),
("8788371617699",38,74,51,"Gangsters","XXLa","Pratt","800.10","M"),
("3613528795292",29,47,29,"Prigioneri","XXLa","Schwartz","426.52","M"),
("8327989456988",53,85,86,"Bavarese","La","Boyer","258.08","M"),
("9492496314972",73,92,56,"Animali","XLb","Rosario","74.71","F"),
("4239262362456",63,26,21,"Zucche","XSb","Schneider","267.86","F"),
("2733151142379",100,45,51,"Disco","XLa","Hull","178.65","M"),
("6927621869393",58,53,98,"Circo","XSa","Wade","638.08","M"),
("7576881754194",44,49,24,"Comics","XXLb","Richmond","737.56","M"),
("8384377654478",77,28,76,"Diavoli","XLb","Walton","54.20","M"),
("8151278678149",61,26,85,"Gonfiabili","XXLa","Benton","51.65","F"),
("6757171187388",4,48,69,"Anni80","Ma","Miller","314.40","M"),
("5944916995151",61,48,22,"Anni80","Sa","Barnett","831.49","M"),
("2117625826422",33,33,57,"Shock","XLb","Sherman","14.68","F"),
("4747138231971",52,74,16,"Disney","Mb","Mack","130.29","F"),
("8275971532784",35,37,69,"DíaDeLosMuertos","Ma","Dominguez","38.91","M"),
("5915225322233",60,20,98,"Zucche","XLa","Livingston","57.20","M"),
("3358756197936",93,9,26,"Pirati","Mb","Barnes","310.36","F"),
("7191898543447",26,78,22,"AnticoEgitto","XLa","Hooper","730.57","F"),
("8588135276635",30,73,18,"BlackAndWhite","Sb","Santana","430.53","M"),
("5361578773221",93,62,64,"Shock","Lb","Harrington","893.75","F"),
("5386339912423",13,45,99,"Fantasy","XLb","Chan","151.95","F"),
("2657169997114",22,100,52,"Bebe","XSb","Spence","108.06","M"),
("7743948733111",33,53,87,"Comics","Lb","Sargent","711.99","F"),
("5478333769973",80,24,71,"AnticoEgitto","XSb","Bradley","307.27","M"),
("2628132632938",6,28,18,"Zombie","XLb","Foreman","547.19","F"),
("5643182889377",3,87,82,"Pirati","XXLa","Mercer","2.56","F"),
("7435533153355",71,80,19,"Disney","Sb","Cochran","96.92","F"),
("4327529672336",70,54,96,"Diavoli","Ma","Lancaster","423.46","F"),
("9258297797786",34,5,62,"Anni80","La","Compton","424.60","F"),
("3678669376468",34,42,86,"Disney","Lb","Franco","475.80","M"),
("5289338435295",33,93,87,"Zucche","Ma","Osborn","772.86","M"),
("5297299553163",16,4,61,"Shock","Sb","Cardenas","749.37","F"),
("2788311777256",37,52,19,"Vichinghi","XXLb","Carr","60.03","M"),
("5824835266552",3,90,10,"BlackAndWhite","XLa","Branch","447.64","M"),
("9344732415745",78,6,19,"Disco","XXLb","Erickson","412.70","M"),
("3216324137191",35,88,38,"Lusso","Mb","Sawyer","785.41","F"),
("7288346525489",38,59,9,"Antichi","XLa","Pace","141.51","M"),
("2351966819532",66,57,98,"Anni20","Mb","Rojas","795.03","M"),
("5786374967918",4,31,81,"Gangsters","Sa","Morin","101.07","F"),
("4971527831448",77,19,10,"Cabaret","XSa","Hayes","432.83","F"),
("6152512667494",26,82,73,"Ballerine","Ma","Castaneda","34.95","M"),
("5169726288765",15,28,49,"Mondo","Lb","Nunez","563.27","M"),
("5269469976644",28,27,81,"Fantasy","XXLb","MyLittlePony","100.74","M"),
("9447687826882",21,29,29,"Unicorno","XSa","Cervantes","577.99","F"),
("2368163351644",100,23,68,"Antichi","XXLa","Beck","456.54","M");

/*POPOLAMENTO FESTA*/
INSERT INTO `Festa` (`ID`,`DataFesta`,`Luogo`,`Citta`,`Via`,`societa`)
    VALUES
(1,"2018-11-26 09:05:01","Amnesia","Coutisse","Ap #557-5439 Massa. St.",45),
(2,"2019-08-05 23:52:19","Roxy","Tarbes","P.O. Box 801, 7970 Eleifend Ave",24),
(3,"2019-04-17 07:36:58","Sala Apolo","Sant'Angelo in Pontano","Ap #804-5395 Suspendisse Road",35),
(4,"2019-04-11 11:45:48","Insanity","Baden-Baden","547 Ornare, St.",35),
(5,"2018-05-29 23:03:08","Ministry of Sound","Rechnitz","P.O. Box 894, 465 Pellentesque Rd.",95),
(6,"2018-01-09 14:06:03","Pacha Ibiza","Latera","120-7511 Gravida Rd.",96),
(7,"2019-06-19 06:02:39","Amnesia","St. Thomas","Ap #615-6957 Vitae Rd.",98),
(8,"2019-11-24 01:16:53","Insanity","Zedelgem","5606 Suspendisse Street",94),
(9,"2019-02-09 16:36:08","Amnesia","San Lorenzo","977-6528 Natoque Street",7),
(10,"2018-05-28 23:39:15","DC10","Bursa","522-5830 Aliquam St.",84),
(11,"2017-12-08 13:38:32","Zouk","Rocca d'Arce","576-6022 Nullam Road",10),
(12,"2019-05-07 21:21:58","Hakkasan","Mont-de-Marsan","4657 Cursus Road",35),
(13,"2019-10-24 07:43:19","Ministry of Sound","Deline","514-2698 Vivamus Street",65),
(14,"2019-07-16 12:58:00","Marquee","Chiusanico","4775 Nunc St.",60),
(15,"2019-05-02 15:52:42","Echostage","Ludwigsfelde","4329 Tortor. Street",59),
(16,"2019-05-16 00:41:52","Zouk","Portland","P.O. Box 909, 4653 Curabitur Rd.",71),
(17,"2017-12-24 08:35:52","Pacha Ibiza","Staßfurt","Ap #825-950 Porttitor Ave",90),
(18,"2018-06-14 20:46:39","Colosseum","Matera","Ap #523-958 Ut Road",8),
(19,"2019-05-29 09:40:21","Shimmy Beach Club","Beaconsfield","Ap #714-677 Suspendisse Ave",23),
(20,"2018-03-10 16:07:58","Pacha Ibiza","Kelowna","P.O. Box 645, 1848 Nec, Road",80),
(21,"2018-01-16 11:25:39","Omnia","Erpe","Ap #561-7302 Posuere Road",11),
(22,"2019-11-12 23:00:05","Hakkasan","Concepción","674-114 Aliquet. Road",21),
(23,"2018-03-23 20:41:30","Ministry of Sound","Rance","770-216 Tincidunt Avenue",97),
(24,"2018-05-14 22:37:35","Valley","Langley","758-3905 Imperdiet Avenue",44),
(25,"2019-11-27 07:01:21","Zouk","Wolfenbüttel","P.O. Box 263, 2079 Eleifend Rd.",16),
(26,"2019-09-12 19:39:16","E11even","East Kilbride","Ap #791-5334 Nonummy Avenue",28),
(27,"2018-04-07 14:10:46","Avalon","Ebenthal in Kärnten","P.O. Box 514, 924 Sed St.",9),
(28,"2019-04-21 15:41:47","Zouk","Sant'Urbano","9848 Massa. Ave",52),
(29,"2018-04-04 04:50:10","Sala Apolo","Spalbeek","845-261 Fermentum Rd.",1),
(30,"2019-01-09 23:10:58","E11even","Cajazeiras","424-5955 Molestie Ave",90),
(31,"2019-07-02 06:36:38","Amnesia","Abingdon","3122 Sit Av.",29),
(32,"2019-01-01 09:20:13","Sala Apolo","North Vancouver","545-606 Eu Rd.",40),
(33,"2018-02-13 00:02:45","Cavalli Club","Bidar","P.O. Box 219, 436 Cras Ave",35),
(34,"2019-09-30 21:27:55","Cavalli Club","Montrose","P.O. Box 314, 3457 Vehicula Rd.",85),
(35,"2018-05-08 06:49:07","Shimmy Beach Club","Frutillar","4406 Volutpat. Street",93),
(36,"2019-02-23 00:30:37","Ministry of Sound","Zedelgem","Ap #906-588 Lobortis. St.",80),
(37,"2019-02-18 05:28:07","Altromondo","Viggianello","Ap #351-5252 Sociis Ave",9),
(38,"2018-10-03 14:55:41","Amnesia","Delmenhorst","P.O. Box 539, 5135 Nam Ave",100),
(39,"2018-08-19 15:38:13","Roxy","Notre-Dame-de-la-Salette","P.O. Box 891, 7950 Nascetur Av.",48),
(40,"2019-09-07 13:40:05","DC10","Maubeuge","395-7565 Lectus Rd.",26),
(41,"2019-07-15 17:33:09","Valley","Vichte","Ap #162-7041 Ipsum. Av.",26),
(42,"2018-02-26 21:06:54","Sala Apolo","Felixstowe","879-4019 Malesuada St.",16),
(43,"2019-06-01 13:46:38","Pacha Ibiza","Orhangazi","169-8055 Luctus Av.",14),
(44,"2019-08-12 14:52:23","Ministry of Sound","Bloxham","Ap #431-7200 Fermentum Avenue",100),
(45,"2018-06-01 20:27:11","Roxy","Nanaimo","9334 Sit Rd.",85),
(46,"2019-06-27 10:53:09","Zouk","Hollange","P.O. Box 408, 720 Felis. Avenue",20),
(47,"2018-07-29 20:20:19","Zouk","Elversele","P.O. Box 797, 1374 Nulla St.",23),
(48,"2019-08-23 11:52:29","Shimmy Beach Club","Surbo","641-8352 Felis. St.",60),
(49,"2018-02-14 15:49:40","Avalon","Wilmont","Ap #607-2251 Quis, Street",53),
(50,"2018-09-30 16:45:03","DC10","Poggiorsini","Ap #325-3108 Nulla St.",9),
(51,"2018-08-06 17:41:16","Studio 338","Armstrong","7793 Velit. Road",39),
(52,"2019-10-06 03:14:00","Colosseum","Paradise","6934 Odio Rd.",95),
(53,"2019-04-14 10:10:23","Avalon","Barchi","P.O. Box 585, 1107 Tristique Ave",17),
(54,"2018-04-03 07:55:01","Echostage","Porirua","Ap #621-8732 Dolor, Rd.",56),
(55,"2018-04-02 09:02:40","Baia Imperiale","Kamalia","260-1334 Lobortis Av.",16),
(56,"2019-10-17 07:35:25","Sala Apolo","Kızılcahamam","P.O. Box 336, 2948 Suspendisse Street",98),
(57,"2019-01-22 03:15:19","Valley","Meerhout","996-5891 Imperdiet Street",27),
(58,"2018-07-15 04:39:52","Hakkasan","Tywyn","Ap #157-8571 Velit. Ave",86),
(59,"2019-07-11 02:59:25","Sala Apolo","Timaru","532-4893 Proin St.",17),
(60,"2018-07-17 02:35:22","Roxy","Court-Saint-Etienne","738-1909 Vivamus Rd.",24),
(61,"2019-04-24 18:42:28","Omnia","Wolfville","P.O. Box 859, 390 Pharetra Rd.",2),
(62,"2019-01-03 15:32:38","Roxy","Halanzy","P.O. Box 933, 5851 Pede. St.",11),
(63,"2018-11-25 13:24:09","Ministry of Sound","Srinagar","Ap #638-982 Ipsum St.",18),
(64,"2018-05-02 09:17:47","Marquee","Emines","P.O. Box 452, 4468 Augue Road",53),
(65,"2018-01-09 10:31:14","Echostage","Socchieve","3932 Nisl Rd.",65),
(66,"2019-03-15 13:24:23","Pacha Ibiza","Orhangazi","P.O. Box 963, 3335 Sed Street",22),
(67,"2019-06-29 03:20:01","Insanity","San Diego","129-1668 Natoque Road",96),
(68,"2019-06-04 17:32:02","Amnesia","Massemen","4302 Vitae, Rd.",16),
(69,"2019-02-27 19:54:11","Echostage","Québec City","145-3351 Aliquet Rd.",34),
(70,"2018-03-26 15:43:59","Pacha Ibiza","Gressoney-Saint-Jean","Ap #638-9872 Risus. St.",38),
(71,"2019-10-01 22:44:01","Baia Imperiale","Quimper","Ap #907-9946 Sem Avenue",40),
(72,"2019-01-09 13:56:59","Omnia","Rovereto","3985 Consequat Street",61),
(73,"2018-08-18 02:59:00","E11even","Joncret","7904 Aliquam Ave",84),
(74,"2018-09-21 04:09:35","Amnesia","Lorient","Ap #457-5966 Ante. St.",59),
(75,"2019-03-18 19:37:43","Insanity","Pöttsching","5518 Vitae Road",99),
(76,"2018-07-14 23:58:53","Insanity","Bhatpara","P.O. Box 129, 7546 Vitae Av.",70),
(77,"2018-11-30 03:37:28","Baia Imperiale","Thane","454-3970 Dapibus Rd.",65),
(78,"2018-06-17 19:51:24","Echostage","Beaufays","735-2638 Fringilla Rd.",67),
(79,"2019-05-24 07:44:43","DC10","Waver","1373 Cursus Ave",22),
(80,"2019-03-30 11:58:12","Marquee","Bonn","467-1203 Dui. Rd.",29),
(81,"2019-06-24 11:34:37","DC10","Jamnagar","P.O. Box 489, 6154 At Rd.",37),
(82,"2017-12-15 22:01:18","Sala Apolo","Dipignano","561-1531 Orci. Road",62),
(83,"2019-03-14 14:14:01","Opium","Kızılcahamam","567-1216 Semper Avenue",77),
(84,"2019-02-28 15:58:25","Marquee","Blois","Ap #958-5049 Dolor. Rd.",44),
(85,"2019-05-29 19:12:02","Studio 338","Kaneohe","798-6623 Consectetuer Road",41),
(86,"2019-10-10 20:24:01","Sala Apolo","Laguna Blanca","P.O. Box 813, 1448 Nulla Av.",76),
(87,"2019-01-20 04:09:17","Valley","Visso","P.O. Box 443, 4420 Sem, Avenue",99),
(88,"2018-10-29 12:08:08","Roxy","Bridgwater","2930 Malesuada Av.",36),
(89,"2018-03-17 13:10:28","Valley","Wellingborough","Ap #643-4621 Elit, Street",85),
(90,"2018-11-05 06:26:58","Hakkasan","Sivry-Rance","P.O. Box 819, 5716 Velit Ave",87),
(91,"2019-10-19 18:49:14","Hakkasan","Spaniard's Bay","2117 Nulla. Av.",70),
(92,"2018-02-18 01:56:26","Marquee","Montelupo Fiorentino","6736 In St.",79),
(93,"2018-06-14 04:26:28","Cavalli Club","Develi","770-6509 Duis St.",51),
(94,"2018-07-18 08:15:09","Omnia","Pratovecchio","Ap #659-7462 Ligula Ave",30),
(95,"2018-03-06 05:12:50","Ministry of Sound","Neder-Over-Heembeek","Ap #158-4441 Nulla Rd.",72),
(96,"2019-09-27 18:23:55","Ministry of Sound","Balfour","753-1670 Orci Rd.",82),
(97,"2019-10-13 06:18:46","E11even","Collines-de-l'Outaouais","4866 Ultricies St.",5),
(98,"2018-04-29 05:58:40","Colosseum","Whitehorse","925-1024 Senectus Road",64),
(99,"2019-06-07 14:25:30","Hakkasan","Wolkrange","Ap #421-7911 Natoque Avenue",89),
(100,"2018-06-14 23:32:16","Valley","Rotorua","P.O. Box 103, 5729 Malesuada Rd.",98);


/*POPOLAMENTO NEGOZIO*/
INSERT INTO `negozio` (`id`,`nome`,`sede`,`citta`) 
    VALUES(1,"Est Arcu Ac Consulting","480-558 Purus. Av.","Flamierge"),(2,"Sapien Nunc LLP","117-7574 Neque Ave","Cisterna di Latina"),(3,"Mattis Cras Eget Associates","Ap #921-7192 Congue Rd.","Lafayette"),(4,"Aliquam Corporation","P.O. Box 617, 6559 Senectus Rd.","Dufftown"),(5,"Elit Industries","P.O. Box 674, 3621 Gravida Avenue","Marbais"),(6,"Nulla Associates","P.O. Box 474, 4963 Libero Rd.","Dibrugarh"),(7,"Convallis Ligula Donec Inc.","7215 Interdum Rd.","Houtvenne"),(8,"Feugiat Non Consulting","Ap #573-3377 Mauris Ave","Villingen-Schwennin"),(9,"Dui Consulting","P.O. Box 604, 303 Lacus. St.","Dalbeattie"),(10,"Cum Sociis Natoque PC","Ap #384-7814 Quisque St.","Empedrado"),(11,"Massa Rutrum Institute","478-1930 Ut Rd.","San Pablo"),(12,"Egestas Inc.","Ap #712-3907 Odio Street","Pastena"),(13,"Fusce Aliquam Inc.","117-3058 Varius. Street","Huntley"),(14,"Nam Interdum Consulting","5681 Suspendisse Rd.","Mollem"),(15,"Neque Corp.","2747 Pellentesque Rd.","Suruç"),(16,"Sem Consequat Limited","P.O. Box 982, 1677 Ut Road","Portigliola"),(17,"Dictum Eu Eleifend LLP","549-7491 Curabitur Street","Biggleswade"),(18,"Arcu Associates","Ap #119-2429 Hendrerit St.","Rajahmundry"),(19,"Eget Volutpat Ornare Ltd","Ap #848-8515 Integer Rd.","Sterrebeek"),(20,"Urna Ut Tincidunt Corporation","9367 Sagittis Rd.","Bodmin"),(21,"Tempus Eu Inc.","749-5910 Semper Rd.","Bath"),(22,"Quam Institute","P.O. Box 736, 266 Consequat St.","Cerchio"),(23,"Mus Proin Vel Corporation","Ap #975-5557 In Street","Scarborough"),(24,"Et Pede Associates","966-3831 Lacinia Ave","Barnstaple"),(25,"At Pretium Associates","P.O. Box 675, 2184 Metus. Av.","MabomprŽ"),(26,"Et Limited","Ap #614-4947 Eu St.","Calgary"),(27,"Felis LLP","1516 Aliquet, Rd.","Tavier"),(28,"Nunc Interdum Associates","621-9480 Ipsum. Rd.","Strausberg"),(29,"Proin LLP","P.O. Box 921, 444 Lorem, Avenue","Itterbeek"),(30,"Sed Pede Cum LLC","6234 Orci. St.","Alajuela"),(31,"Sagittis Lobortis Limited","Ap #243-577 Nam Road","Maria"),(32,"Bibendum Sed Industries","P.O. Box 693, 3251 Odio Ave","Nuragus"),(33,"Dictum Limited","1418 Scelerisque Road","Zwijndrecht"),(34,"Pharetra Nam Ac LLP","Ap #802-948 Integer Avenue","Owen Sound"),(35,"Integer Aliquam Incorporated","Ap #487-3700 Purus. St.","Scarborough"),(36,"Sem Semper Erat Consulting","567-724 Nunc St.","Thirimont"),(37,"Et Malesuada LLP","Ap #948-2884 Montes, Ave","Zwijnaarde"),(38,"Non Lorem Company","774-7476 Ante Street","Vitrolles"),(39,"Odio Tristique Industries","Ap #822-9541 Id Rd.","Kurnool"),(40,"Consequat PC","Ap #341-8308 Feugiat. Rd.","Dundee"),(41,"Nunc Limited","Ap #101-1922 Nec Avenue","Holywell"),(42,"Quam Elementum Consulting","4485 Fringilla Rd.","Bowling Green"),(43,"Tristique Pellentesque Incorporated","938-4935 Id Street","Spermalie"),(44,"Odio Auctor Inc.","5170 Ut Street","Northallerton"),(45,"Nulla Aliquet Institute","8373 Non St.","Moffat"),(46,"Eros Proin Ultrices LLC","456-2512 Nulla Avenue","Joliet"),(47,"Pede Sagittis Augue Ltd","1770 Tellus Rd.","Gaasbeek"),(48,"Justo Proin Consulting","7718 Sit Rd.","Alhué"),(49,"Neque Sed Eget LLP","358-661 Hendrerit Road","Hazaribag"),(50,"Sed Tortor Integer Foundation","5409 Ornare. St.","Wolfurt"),(51,"Vitae Erat Vivamus Industries","338-7022 Mollis Street","Farrukhabad-cum-Fatehgarh"),(52,"Dis Parturient PC","P.O. Box 109, 6534 Vestibulum Road","Zwevegem"),(53,"Consequat Nec PC","P.O. Box 998, 3644 Nec Ave","Multan"),(54,"Ipsum Donec Sollicitudin Institute","Ap #490-9939 Vulputate Av.","Stockport"),(55,"Integer Vitae Nibh Corp.","Ap #244-632 Non, Ave","Funtua"),(56,"Neque Nullam Incorporated","P.O. Box 963, 1408 Eu, Road","Mespelare"),(57,"Eros Corp.","5489 Nunc Av.","Townsville"),(58,"Eu Industries","4452 Phasellus Rd.","Río Bueno"),(59,"Aliquet Odio Etiam Consulting","P.O. Box 161, 6950 Nec Rd.","Whitehorse"),(60,"Ligula Aenean Euismod Consulting","Ap #851-2730 Vehicula St.","Laramie"),(61,"A Consulting","662-7194 Est Rd.","Tulln an der Donau"),(62,"Eu Augue Porttitor Ltd","257-1529 Ipsum Ave","Paiguano"),(63,"Aenean Massa Integer LLC","581-5440 Et, Rd.","Rizes"),(64,"Dapibus Ligula Aliquam Foundation","217-3898 Scelerisque Street","Liers"),(65,"Sit Amet Risus Company","Ap #450-4661 Fusce Road","Attigliano"),(66,"Vivamus Euismod Industries","P.O. Box 628, 5331 Et Avenue","Montleban"),(67,"Iaculis Nec Foundation","P.O. Box 981, 6311 Enim, Avenue","Chépica"),(68,"Non Nisi Aenean Associates","P.O. Box 835, 9699 Mollis. Road","Hampstead"),(69,"Aliquam Limited","2374 Sociis Av.","Plancenoit"),(70,"Eget Foundation","P.O. Box 198, 4436 Dolor. St.","Montjovet"),(71,"Mauris Ut Ltd","6577 Eu Road","Montgomery"),(72,"Massa Suspendisse Eleifend PC","Ap #283-5096 Mi Rd.","West Vancouver"),(73,"Semper PC","P.O. Box 825, 3155 Eu Rd.","Saavedra"),(74,"Semper Inc.","799-6657 Varius St.","Morro d'Alba"),(75,"Neque Tellus Imperdiet Industries","698-7758 Arcu. Avenue","Plauen"),(76,"Diam Ltd","P.O. Box 277, 6215 Iaculis Street","Jumet"),(77,"Dolor Egestas Limited","P.O. Box 246, 7045 Suspendisse St.","Senneville"),(78,"Quisque Nonummy Ipsum Industries","Ap #258-3593 Pede. Rd.","Schepdaal"),(79,"A Scelerisque Incorporated","P.O. Box 872, 4664 Euismod Ave","Burgos"),(80,"Odio Aliquam Institute","P.O. Box 763, 6123 Egestas Rd.","Barmouth"),(81,"Ligula Nullam Incorporated","Ap #915-3994 Et Av.","Elx"),(82,"Enim Incorporated","809-5658 Lacus. Road","Montebelluna"),(83,"Massa Integer Inc.","P.O. Box 871, 1354 Nascetur Rd.","Coutisse"),(84,"Risus A Ultricies Industries","P.O. Box 252, 7833 Cursus St.","Ottawa"),(85,"Integer Vitae Nibh Corporation","8942 Feugiat. Road","Cochin"),(86,"Leo In LLC","P.O. Box 743, 2223 Nullam Rd.","Melazzo"),(87,"Pellentesque Eget Dictum Industries","7952 Praesent Rd.","Mussy-la-Ville"),(88,"Elit LLP","9441 Nunc Street","Tintange"),(89,"Amet Faucibus Ut PC","Ap #106-6848 Fermentum Ave","Ferrandina"),(90,"Nullam Ut Limited","4192 Vel Avenue","Owerri"),(91,"Sollicitudin A Malesuada PC","Ap #247-4449 Ipsum Street","Novoli"),(92,"Sem Pellentesque Ut Corp.","Ap #268-1534 Sem Ave","Hubli"),(93,"Sit Amet Ornare LLP","P.O. Box 275, 9328 Nec St.","Swan Hills"),(94,"Duis Cursus Institute","P.O. Box 686, 3259 Nullam Road","Colonnella"),(95,"Tellus Non Magna Incorporated","Ap #803-2564 Orci, Av.","Troon"),(96,"Morbi Non Sapien Ltd","Ap #923-931 Amet Street","Gallodoro"),(97,"Non Corp.","9170 Mollis. St.","Braunschweig"),(98,"Sapien Industries","Ap #347-2771 Lobortis. Ave","St. Catharines"),(99,"Amet Ltd","6018 Ac Avenue","Anjou"),(100,"Nisi LLC","409-7624 Iaculis Rd.","Río Bueno");


/*POPOLAMENTO SOCIETA*/
INSERT INTO `societa` (`ID`,`nome`,`sede`,`citta`)
    VALUES
(1,"Odio Semper Cursus Corporation","833-6473 Dolor Avenue","Halen"),
(2,"Rutrum Urna Nec LLC","6393 Bibendum Avenue","Cambridge"),
(3,"Vitae LLP","P.O. Box 330, 6888 In Ave","Allahabad"),
(4,"Pharetra Quisque LLP","8851 Egestas Street","Flensburg"),
(5,"Lorem Ltd","4618 Lobortis Av.","Saint-Maur-des-Fossés"),
(6,"Sed Pharetra Felis Corporation","Ap #662-1211 Faucibus Av.","Cork"),
(7,"Dapibus Id Inc.","Ap #109-1096 Non, Avenue","San Maurizio Canavese"),
(8,"Arcu Corporation","4439 Eget, Ave","Sperlinga"),
(9,"Risus Odio Inc.","1422 Curae; St.","Viranşehir"),
(10,"In Faucibus Institute","Ap #404-7673 Sem, Avenue","Port Coquitlam"),
(11,"Ultricies Adipiscing Limited","4034 Sit Road","Bangor"),
(12,"Dolor Nonummy Ac LLP","608-9589 Mauris Rd.","Campagna"),
(13,"Justo Faucibus Lectus Industries","Ap #164-8438 Est. Rd.","Montgomery"),
(14,"Arcu Foundation","237-699 Et Rd.","Capena"),
(15,"Donec Est PC","P.O. Box 570, 5600 Phasellus St.","Düsseldorf"),
(16,"Fringilla Mi Associates","P.O. Box 529, 9536 Faucibus Avenue","GomzŽ-Andoumont"),
(17,"Velit Aliquam Limited","909-7032 Malesuada Rd.","Landeck"),
(18,"Dui Nec Foundation","P.O. Box 150, 2829 Nisi Road","Tollembeek"),
(19,"Id Blandit Industries","2379 Erat, Avenue","Saalfelden am Steinernen Meer"),
(20,"Id Sapien Cras Consulting","243-9115 Pretium Road","Alessandria"),
(21,"Vel Foundation","Ap #702-5705 Proin Road","La Pintana"),
(22,"Maecenas Libero Foundation","Ap #370-3370 Mollis Rd.","Santa Juana"),
(23,"Lectus Pede Corporation","5176 Dictum Rd.","Merksem"),
(24,"Leo LLC","Ap #225-2806 Fermentum Rd.","Coihueco"),
(25,"Etiam Foundation","P.O. Box 810, 9480 Et St.","Stuttgart"),
(26,"Arcu Vivamus Corp.","5189 Arcu. Av.","Sant'Omero"),
(27,"Donec Fringilla Donec Inc.","6773 Ultrices. Ave","New Galloway"),
(28,"Lacinia Industries","4071 Nec, Rd.","Borgo Valsugana"),
(29,"Mauris Erat Eget Corporation","Ap #575-6474 Quisque Avenue","Wibrin"),
(30,"Varius Nam Porttitor Consulting","8149 Tempor St.","Daly"),
(31,"Amet Dapibus Id Incorporated","5715 Erat St.","Gerpinnes"),
(32,"Convallis Ligula Donec Foundation","5935 Ipsum Av.","GrivegnŽe"),
(33,"Ante Bibendum Company","2636 Et Rd.","Chełm"),
(34,"Non Lobortis Quis PC","389-7124 Cras Rd.","Bydgoszcz"),
(35,"Ipsum Inc.","P.O. Box 846, 1846 Tellus, Rd.","Saint-Pierre"),
(36,"Amet Lorem Semper Associates","138-8188 Turpis. Ave","Buckingham"),
(37,"Facilisis Eget Ipsum LLP","Ap #555-6203 Velit. Rd.","Araban"),
(38,"Auctor Ltd","6427 Sit St.","Motta Sant'Anastasia"),
(39,"Interdum Company","364-7480 Consequat Avenue","Tavigny"),
(40,"Volutpat Ornare Inc.","542 Cursus Road","Valtournenche"),
(41,"Mi Ac Incorporated","Ap #973-5814 Metus. Av.","Erdemli"),
(42,"Nec Corp.","P.O. Box 573, 5096 Lobortis, Rd.","Langford"),
(43,"Sem Semper Erat PC","P.O. Box 327, 2051 Imperdiet, Road","Cairo Montenotte"),
(44,"Consequat Institute","Ap #458-2143 Ultricies Rd.","Treguaco"),
(45,"Urna Justo Institute","887-4129 Sed Av.","Wevelgem"),
(46,"Dui Corporation","967-5765 Mauris Street","Cheyenne"),
(47,"Pede Nunc Sed Corp.","6200 Vulputate Street","Nocera Umbra"),
(48,"Maecenas Consulting","2816 Odio Av.","Zaria"),
(49,"In PC","1489 Consectetuer Ave","Rawalpindi"),
(50,"Sed Pede Cum LLP","P.O. Box 518, 8515 Sagittis Street","Arsimont"),
(51,"Nunc Mauris Inc.","174-1245 Suspendisse Road","Grand-RosiŽre-Hottomont"),
(52,"Parturient Montes Nascetur PC","3497 Quam. Street","Barbania"),
(53,"Vel Venenatis Inc.","6859 Ligula. Avenue","Campobasso"),
(54,"Eget Dictum Ltd","326-8538 Etiam Rd.","Hilo"),
(55,"Penatibus LLC","677-9059 Cras Av.","Arvier"),
(56,"Tempor Arcu Foundation","P.O. Box 208, 6347 Dapibus St.","Strijtem"),
(57,"Libero LLC","P.O. Box 973, 758 Nunc Rd.","San José de Alajuela"),
(58,"Augue Ac Ltd","299-5088 Et Rd.","Dion-Valmont"),
(59,"Augue Eu Tempor LLC","Ap #324-4778 Urna Road","Bruderheim"),
(60,"Nisi Mauris Nulla LLP","941-1578 Elit, Rd.","Spaniard's Bay"),
(61,"Urna Industries","P.O. Box 844, 6726 Id Road","Nieuwenrode"),
(62,"Ornare Sagittis LLC","2579 Mauris Av.","Introd"),
(63,"Diam Dictum Institute","5131 Arcu. St.","La Ligua"),
(64,"Amet Ante Vivamus Limited","Ap #325-5269 Enim. Rd.","Deline"),
(65,"Mi Pede LLC","424-8867 Tincidunt Av.","Dave"),
(66,"In Cursus Foundation","423-6276 Nisl Rd.","Dunbar"),
(67,"Non Corporation","635-8337 Dui Av.","Giurdignano"),
(68,"Purus Gravida Incorporated","9961 Magnis Ave","Townsville"),
(69,"Rhoncus Limited","513-2720 Ipsum St.","Alken"),
(70,"Nisi Nibh Lacinia Associates","P.O. Box 347, 9171 Laoreet, St.","Wimmertingen"),
(71,"Fusce Mi Lorem Company","4863 Non Road","Rhisnes"),
(72,"Magna Consulting","Ap #376-6299 At, St.","Miami"),
(73,"Cras LLC","Ap #364-4880 Nisi Ave","Buren"),
(74,"Neque Limited","6624 Mi Ave","Albisola Superiore"),
(75,"Commodo LLC","P.O. Box 908, 7290 Duis Ave","Warspite"),
(76,"Sem Magna PC","Ap #363-1992 A Street","Hope"),
(77,"Cubilia Curae; Phasellus Corporation","432-9077 Congue Ave","Renfrew"),
(78,"Mauris Sit Ltd","2233 Nibh. Avenue","Banbury"),
(79,"Pede Nec Associates","Ap #464-898 Et, Street","Jemappes"),
(80,"Accumsan Inc.","8065 Porta Rd.","Aalbeke"),
(81,"Metus Eu Limited","500-7249 Augue, Ave","Cagli"),
(82,"Senectus Et LLC","8854 Aliquet, Ave","Täby"),
(83,"Dolor Quam Associates","P.O. Box 210, 3004 Molestie Ave","Milena"),
(84,"Ipsum Phasellus Vitae Inc.","Ap #721-8494 Duis St.","Salt Spring Island"),
(85,"Nascetur Ridiculus Mus Inc.","1143 Morbi St.","Bonavista"),
(86,"Sed Turpis LLC","Ap #574-4983 Sit Road","Fort Smith"),
(87,"Erat Corporation","P.O. Box 303, 4014 Congue Road","San Martino in Pensilis"),
(88,"Ante Iaculis Nec Institute","Ap #467-6678 Odio Road","Sheikhupura"),
(89,"Non Vestibulum Nec Ltd","Ap #413-6058 Lectus Ave","Gavirate"),
(90,"Consectetuer Adipiscing Foundation","5640 Aliquam Avenue","Villar Pellice"),
(91,"Accumsan Neque Et Company","655-422 Phasellus St.","Mercedes"),
(92,"Vehicula Aliquet Libero Institute","6948 Nam Rd.","Halen"),
(93,"Fringilla Institute","Ap #756-8233 Non, Road","RosiŽres"),
(94,"Non Lorem Vitae Incorporated","Ap #906-5157 Integer Rd.","Meridian"),
(95,"Dui Corporation","2171 Fusce St.","Stockerau"),
(96,"Non Ante Bibendum Corp.","511-9495 Arcu. Av.","Oliver"),
(97,"Magna Duis Dignissim Foundation","530-3904 Ligula Rd.","Dreux"),
(98,"Aliquam Erat Volutpat Limited","6295 Diam Av.","Lacombe"),
(99,"Mauris Ut Corporation","718-5102 Ipsum Ave","Guadalupe"),
(100,"Eros Turpis Non PC","7593 Dignissim Rd.","Habay");


/*POPOLAMENTO PARTECIPA*/
INSERT INTO `Partecipa` (`Cliente`,`Festa`)
    VALUES
(70,28),
(10,37),
(76,91),
(69,60),
(63,61),
(24,92),
(89,4),
(84,74),
(18,59),
(74,46);

INSERT INTO `Partecipa` (`Cliente`,`Festa`)
    VALUES
(72,66),
(6,58),
(46,91),
(8,75),
(40,78),
(20,9),
(87,35),
(56,60),
(60,8),
(84,61);

INSERT INTO `Partecipa` (`Cliente`,`Festa`)
    VALUES
(35,55),
(97,41),
(82,6),
(77,45),
(54,57),
(7,97),
(14,49),
(7,74),
(46,15),
(21,89);

INSERT INTO `Partecipa` (`Cliente`,`Festa`)
    VALUES
(63,37),
(6,63),
(64,27),
(100,40),
(74,89),
(47,95),
(94,94),
(59,31),
(25,37),
(22,39);

INSERT INTO `Partecipa` (`Cliente`,`Festa`)
    VALUES
(30,64),
(37,95),
(42,29),
(50,100),
(98,19),
(82,56),
(89,65),
(46,72),
(74,100),
(11,67);

INSERT INTO `Partecipa` (`Cliente`,`Festa`)
    VALUES
(34,73),
(100,21),
(15,32),
(91,13),
(80,24),
(21,59),
(75,56),
(49,4),
(3,5),
(18,23);

INSERT INTO `Partecipa` (`Cliente`,`Festa`)
    VALUES
(84,97),
(77,15),
(94,24),
(36,31),
(65,49),
(82,22),
(12,25),
(23,85),
(74,57),
(45,41);

INSERT INTO `Partecipa` (`Cliente`,`Festa`)
    VALUES
(52,15),
(100,60),
(43,19),
(1,56),
(72,7),
(64,95),
(40,10),
(94,9),
(77,53),
(70,60);

INSERT INTO `Partecipa` (`Cliente`,`Festa`)
    VALUES
(13,62),
(79,73),
(21,54),
(16,5),
(94,52),
(96,96),
(91,22),
(49,89),
(38,68),
(72,30);

INSERT INTO `Partecipa` (`Cliente`,`Festa`)
    VALUES
(12,100),
(11,71),
(47,22),
(41,19),
(62,16),
(78,62),
(57,5),
(65,26),
(89,34),
(91,75);
