#7.- Cuando se inserte una reserva , insertar a su vez un gasto con Id servicio = 1 que corresponderá 
#a alojamiento., Fecha =Fecha Reserva, Cantidad= Días de la reserva, Precio=precio de la habitación 
#según la temporada.
USE hotel;
DELIMITER $$
DROP TRIGGER IF EXISTS RESERVA_INSERTAR $$
CREATE TRIGGER RESERVA_INSERTAR AFTER INSERT
ON reserva_habitac FOR EACH ROW
BEGIN
	DECLARE CLAVE INT;
    SET CLAVE = mysql_insert_id();
	INSERT INTO gasto(idRESERVA,idSERVICIOS,Fecha,Cantidad,Precio)
    VALUES(CLAVE,1,NEW.FECHA,NEW.Cantidad,new.precio);
END$$
