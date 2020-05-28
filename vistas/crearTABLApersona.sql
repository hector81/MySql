USE esquemageografia;
CREATE TABLE persona (
	nombre_pais VARCHAR(50),
    nombre_ccaa VARCHAR(50),
    nombre_municipio VARCHAR(50),
    cantidad INTEGER
)
;

INSERT INTO persona values('España','La Rioja','Logroño',175000);
INSERT INTO persona values('España','La Rioja','Lardero',10550);
INSERT INTO persona values('España','La Rioja','Calahorra',20000);
INSERT INTO persona values('España','La Rioja','Manjarres',180);
INSERT INTO persona values('España','La Rioja','Haro',30000);
INSERT INTO persona values('España','Navarra','Pamplona',500000);
INSERT INTO persona values('España','Navarra','Viana',35000);
INSERT INTO persona values('España','Alava','Vitoria',7000000);
INSERT INTO persona values('España','Alava','Labastida',7000);
INSERT INTO persona values('España','Alava','Laguardia',10000);
INSERT INTO persona values('Italia','Lazio','Roma',5000000);
INSERT INTO persona values('Italia','Lazio','Fiucimino',60000);
INSERT INTO persona values('Italia','Veneto','Venecia',500000);
INSERT INTO persona values('Argelia','Oran','Oran',250000);
INSERT INTO persona values('Francia','Las Landas','Dax',30000);
INSERT INTO persona values('Francia','Bretaña','Quevert',400000);
