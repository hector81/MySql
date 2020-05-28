#4.- Cuando se borre un cliente comprobar que el país del cliente borrado  está en otros clientes. 
#Si ya no queda ningún cliente con ese país borrar el registro de la tabla países.
USE hotel;
DELIMITER $$
DROP TRIGGER IF EXISTS BORRAR_CLIENTE_PAIS $$

CREATE TRIGGER BORRAR_CLIENTE_PAIS AFTER DELETE
ON clientes FOR EACH ROW

BEGIN
	IF OLD.PAIS <> NEW.PAIS THEN
		IF NOT EXISTS (SELECT PAIS FROM PAISES WHERE PAIS = OLD.PAIS ) THEN
			DELETE FROM PAISES WHERE PAISES.Pais = OLD.PAIS;
		END IF;
	END IF;
END $$
