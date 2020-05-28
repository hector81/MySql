#2.-  Cuando se actualice un cliente, si se ha modificado el país comprobar que existe el país nuevo y 
#si no darlo de alta.
USE hotel;
DELIMITER $$
DROP TRIGGER IF EXISTS ACTUALIZAR_CLIENTE $$

CREATE TRIGGER ACTUALIZAR_CLIENTE AFTER UPDATE
ON clientes FOR EACH ROW

BEGIN
	IF NOT EXISTS(SELECT * FROM  paises P
    WHERE NEW.PAIS=p.pais) THEN 
		INSERT INTO PAISES (PAIS) VALUES(NEW.PAIS);
	END IF;
END