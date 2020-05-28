CREATE DATABASE prueba;
USE prueba;
CREATE TABLE persona (
	dni VARCHAR(9) NOT NULL PRIMARY KEY,
    nombre VARCHAR(10) NOT NULL,
    apellido1 VARCHAR(20) NOT NULL,
    apellido2 VARCHAR(20) NOT NULL,
    fecha_nacimiento date NOT NULL,
    telefono VARCHAR(9) NOT NULL,
    movil VARCHAR(9) NOT NULL
)
;

CREATE TABLE aficiones (
	id_aficiones VARCHAR(10) NOT NULL PRIMARY KEY,
    descripcion VARCHAR(20) NOT NULL,
    grupo BOOLEAN
);
    
CREATE TABLE persona_aficiones(
	dni VARCHAR(9) NOT NULL ,
    id_aficiones VARCHAR(10) NOT NULL,
	PRIMARY KEY(dni,id_aficiones ),
    CONSTRAINT fk_dni FOREIGN KEY (dni) REFERENCES persona (dni),
	CONSTRAINT fk_id_aficiones FOREIGN KEY (id_aficiones) REFERENCES aficiones (id_aficiones)
)
;
INSERT INTO persona VALUES('16596061F','Héctor','García','González','1981-5-5','941414555','666555999');
INSERT INTO persona VALUES('15960002P','Isabel','Navarra','Toledo','1985-1-16','963963963','666555999');
INSERT INTO persona VALUES('16596161F','José','García','Rioja','1950-5-7','941941123','666333121');
INSERT INTO persona VALUES('15961592P','María','Francia','Toledo','1985-1-16','987987987','658669933');
INSERT INTO persona VALUES('15062011J','Jesús','Sabino','Magaña','1985-1-10','987987987','658669933');

INSERT INTO aficiones VALUES('Logroñes11','alta', TRUE);
INSERT INTO aficiones VALUES('Osasuna22','alta', FALSE);
INSERT INTO aficiones VALUES('Atmadrid9','alta', FALSE);
INSERT INTO aficiones VALUES('Madrid666','baja', TRUE);
INSERT INTO aficiones VALUES('Bilbao987','alta', TRUE);

INSERT INTO persona_aficiones VALUES('16596061F','Logroñes11');
INSERT INTO persona_aficiones VALUES('15960002P','Osasuna22');
INSERT INTO persona_aficiones VALUES('16596161F','Atmadrid9');
INSERT INTO persona_aficiones VALUES('15961592P','Madrid666');
INSERT INTO persona_aficiones VALUES('15062011J','Bilbao987');



#select *,now() from persona;