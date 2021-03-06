#1.- Cuando se inserte un cliente comprobar que existe el país y si no darlo de alta.
USE hotel;
DELIMITER $$
DROP TRIGGER IF EXISTS INSERCION_CLIENTES $$

CREATE TRIGGER INSERCION_CLIENTES AFTER INSERT
ON clientes FOR EACH ROW

BEGIN
	IF (NEW.PAIS NOT IN (SELECT PAIS FROM PAISES) ) THEN
		INSERT INTO PAISES (PAIS) VALUES(NEW.PAIS);
	END IF;
END