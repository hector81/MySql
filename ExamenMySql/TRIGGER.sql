#AL INSERTAR RESERVA CONTROLAR QUE EL NUMERO DE DIAS SEA MENOR QUE 30 Y QUE LA FECHA DE ENTRADA SEA POSTERIO RO IGUAL
#A LA FECHA ACTUAL. EN CASO CONTRARIO CANCELAR INSERCION
USE Hotel;
DELIMITER $$
DROP TRIGGER IF EXISTS reserva_controlar $$

CREATE TRIGGER reserva_controlar BEFORE INSERT
ON reserva_habitac FOR EACH ROW

BEGIN
		-- SI CUMPLE
		IF (SELECT DATEDIFF(reserva_habitac.FechaENTRADA, reserva_habitac.FechaSALIDA) 
        FROM reserva_habitac WHERE reserva_habitac.idRESERVA = NEW.idRESERVA ) < 30
        AND (reserva_habitac.FechaENTRADA) <= curdate()
        THEN
			INSERT INTO reserva_habitac (idRESERVA,FechaENTRADA, FechaSALIDA, IVA, NumHABITACION, CLIENTE)
            VALUES(NEW.idRESERVA,NEW.FechaENTRADA, NEW.FechaSALIDA, NEW.IVA, NEW.NumHABITACION, NEW.CLIENTE); 
            
		-- SI NO CUMPLE
		ELSEIF (SELECT DATEDIFF(reserva_habitac.FechaENTRADA, reserva_habitac.FechaSALIDA) 
        FROM reserva_habitac WHERE reserva_habitac.idRESERVA = NEW.idRESERVA ) > 30
        AND (reserva_habitac.FechaENTRADA) > curdate()
        THEN	
			DELETE FROM reserva_habitac WHERE reserva_habitac.idRESERVA = NEW.idRESERVA;
        
		END IF;
END $$
