#7.- Cuando se inserte una reserva , insertar a su vez un gasto con Id servicio = 1 que corresponderá 
#a alojamiento., Fecha =Fecha Reserva, Cantidad= Días de la reserva, Precio=precio de la habitación 
#según la temporada.
USE hotel;
DELIMITER $$
DROP TRIGGER IF EXISTS RESERVA_INSERTAR $$
CREATE TRIGGER RESERVA_INSERTAR AFTER INSERT
ON reserva_habitac FOR EACH ROW
BEGIN
	INSERT INTO gasto(idGASTOS ,idRESERVA,idSERVICIOS,Fecha,Cantidad,Precio)
    VALUES(DEFAULT,1,NEW.FechaENTRADA,DATEDIFF(FechaENTRADA,FechaFINAL),
    (SELECT ((precio_habitacion.Precio/100*reserva_habitac.IVA) + precio_habitacion.Precio ),reserva_habitac.FechaENTRADA 
    AS PRECIO FROM reserva_habitac
    JOIN habitaciones ON reserva_habitac.NumHABITACION = habitaciones.NumHABITACION
    JOIN tipo_habitacion ON tipo_habitacion.Categoria = habitaciones.tipo_habitacion
    JOIN precio_habitacion ON precio_habitacion.TIPO_HABITACION = tipo_habitacion.Categoria
    JOIN temporada ON precio_habitacion.TEMPORADA  = temporada.TEMPORADA
    WHERE reserva_habitac.FechaENTRADA BETWEEN temporada.FechaINICIO AND temporada.FechaFINAL
    GROUP BY '2009-02-16')
    );
END$$
-- 