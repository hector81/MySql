create database PAISES;
use PAISES;
CREATE TABLE provincia(
	nombre_provincia VARCHAR(20) null ,
	cod_pais INTEGER null ,
    cod_provincia INTEGER null,
    PRIMARY KEY(cod_provincia)
);
CREATE TABLE pais(
	nombre_pais VARCHAR(20) null ,
	cod_pais INTEGER null,
    PRIMARY KEY(cod_pais)
);
CREATE TABLE municipio(
	nombre_municipio VARCHAR(20) null ,
	cod_pais INTEGER null,
    cod_provincia INTEGER null,
    cod_municipio INTEGER null,
    PRIMARY KEY(cod_municipio)
);


INSERT INTO provincia VALUES('La Rioja', 1,1);
INSERT INTO provincia VALUES('Navarra', 1,2);
INSERT INTO provincia VALUES('Madrid', 1,3);
INSERT INTO provincia VALUES('EsukalHerria', 1,4);

INSERT INTO municipio VALUES('Logroño', 1,1,4);
INSERT INTO municipio VALUES('Iruña', 1,2,3);
INSERT INTO municipio VALUES('Madrid', 1,3,433);
INSERT INTO municipio VALUES('Donosti', 1,4,47);
INSERT INTO municipio VALUES('Bilbao', 1,4,48);
INSERT INTO municipio VALUES('Vitoria', 1,4,46);

INSERT INTO pais VALUES('España', 1);
INSERT INTO pais VALUES('Italia', 2);
INSERT INTO pais VALUES('Francia', 3);
INSERT INTO pais VALUES('Portugal', 4);

#EJEMPLO FULL JOIN
use paises;
SELECT * FROM provincia;
(SELECT * FROM provincia RIGHT JOIN pais ON pais.cod_pais = provincia.cod_pais)
UNION
(SELECT * FROM provincia LEFT JOIN municipio ON municipio.cod_provincia = provincia.cod_provincia)
