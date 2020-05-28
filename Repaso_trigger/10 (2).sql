#10  Crear un trigger que aumente un 10 % el gasto introducido si la fecha de la reserva esta completamente  en
# agosto y tiene menos de 7 días de reserva. 
-- Comprobar también que la fecha es correcta, es decir, situada 
#entre las fechas de la reserva.
DELIMITER $$
DROP TRIGGER IF EXISTS TRIGGER_10 $$
CREATE TRIGGER TRIGGER_10 BEFORE INSERT  
ON gastos FOR EACH ROW
BEGIN
	DECLARE msg  char(255);
    DECLARE ERR INT;
	IF EXISTS(SELECT count(*) FROM  gastos        
       JOIN reserva_habitac ON reserva_habitac.idRESERVA = gastos.idRESERVA 
       WHERE NEW.idGASTOS = gastos.idGASTOS 
       AND 
       MONTH(reserva_habitac.FechaENTRADA) LIKE 8 AND  MONTH(reserva_habitac.FechaSALIDA) LIKE 8
       AND DATEDIFF(reserva_habitac.FechaENTRADA,reserva_habitac.FechaSALIDA ) < 7)    
       AND NEW.Fecha BETWEEN reserva_habitac.FechaENTRADA AND reserva_habitac.FechaSALIDA
    THEN
		SET NEW.Precio = NEW.Precio + ((NEW.Precio/100)*10);
		BEGIN  
			SET msg = CONCAT('lA HABITACION HA AUMENTADO UN 10% DE PRECIO ',NEW.Precio);
			SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = msg;
			call TRIGGER_10();
            SET ERR = 7/0;
		END ;
	END IF;
    
END $$
