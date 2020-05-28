#8 Controlar que cuando se inserta un gasto, la fecha del mismo está dentro de las
#fechas de la reserva al que se asigna.
USE hotel;
DELIMITER $$
DROP TRIGGER IF EXISTS GASTO_INSERTAR $$
CREATE TRIGGER GASTO_INSERTAR BEFORE INSERT
ON gastos FOR EACH ROW
BEGIN
	IF (NEW.FECHA BETWEEN 
    (SELECT reserva_habitac.FechaENTRADA FROM reserva_habitac WHERE reserva_habitac.idRESERVA = new.idRESERVA) 
    AND 
    (SELECT reserva_habitac.FechaSALIDA FROM reserva_habitac WHERE reserva_habitac.idRESERVA = new.idRESERVA) 
    ) THEN
    
    insert into gasto(idRESERVA,idSERVICIOS,Fecha,Cantidad,Precio)
    values(new.idRESERVA,new.idSERVICIOS,new.Fecha,new.Cantidad,new.Precio);
    end if;
END$$