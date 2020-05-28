#5.- Cuando se actualice  un cliente, si se ha modificado el país, comprobar que el país antiguo
#   está en otros clientes. Si ya no queda ningún cliente con ese país borrar el registro de la tabla países .
USE hotel;
DELIMITER $$
DROP TRIGGER IF EXISTS ACTUAL_CLIEN $$

CREATE TRIGGER ACTUAL_CLIEN AFTER UPDATE
ON clientes FOR EACH ROW

BEGIN
	IF OLD.PAIS <> NEW.PAIS THEN
		IF NOT EXISTS (SELECT PAIS FROM CLIENTES WHERE CLIENTES.PAIS = OLD.PAIS ) THEN
			DELETE FROM PAISES WHERE PAISES.Pais = OLD.PAIS;
        END IF;
	END IF;
END $$