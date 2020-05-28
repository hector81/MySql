#10  Crear un trigger que aumente un 10 % el gasto introducido si la fecha de la reserva es completa en agosto y
# tiene menos de 7 días de reserva. Comprobar también que la fecha es correcta, es decir, situada entre las fechas 
#de la reserva.
USE hotel;
DELIMITER $$
DROP TRIGGER IF EXISTS AUMENTO_PRECIO $$
CREATE TRIGGER AUMENTO_PRECIO AFTER UPDATE
ON gastos FOR EACH ROW
BEGIN
	IF (NEW.FECHA BETWEEN 
    (SELECT reserva_habitac.FechaENTRADA FROM reserva_habitac WHERE reserva_habitac.idRESERVA = new.idRESERVA) 
    AND 
    (SELECT reserva_habitac.FechaSALIDA FROM reserva_habitac WHERE reserva_habitac.idRESERVA = new.idRESERVA) 
    AND month(NEW.FECHA) LIKE '8' AND NEW.Cantidad >= 7) THEN
    
    UPDATE gastos SET gastos.Cantidad = (gastos.Cantidad + (gastos.Cantidad/100)*10);
    
    end if;
END$$