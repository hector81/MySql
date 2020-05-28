#9.- Controlar que cuando se inserta o modifica una reserva que la habitación está
#disponible en esas fechas .
USE hotel;
DELIMITER $$
DROP TRIGGER IF EXISTS TRIGGER_1 $$
CREATE TRIGGER TRIGGER_1 BEFORE INSERT
ON reserva_habitac FOR EACH ROW
BEGIN
	DECLARE msg  char(255); 
	DECLARE ERR INT;
	IF NOT EXISTS(SELECT count(*) FROM  reserva_habitac        
       JOIN habitaciones ON reserva_habitac.NumHABITACION = habitaciones.NumHABITACION
       JOIN precio_habitacion ON precio_habitacion.TIPO_HABITACION = habitaciones.TIPO_HABITACION
       JOIN temporada ON precio_habitacion.TEMPORADA = temporada.TEMPORADA  
       WHERE new.idreserva = reserva_habitac.idreserva 
       AND 
       NEW.FechaENTRADA > temporada.FechaINICIO or 
       NEW.FechaSALIDA < temporada.FechaFINAL
       )    
    THEN
		BEGIN  
			SET msg = CONCAT('lA HABITACION NO ESTA DISPONIBLE EN ESTAS FECHAS ',new.FechaENTRADA);
			SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = msg;
			call kk();
            set err = 7/0;-- error
		END ;
	END IF;
    
END $$

DELIMITER $$
DROP TRIGGER IF EXISTS TRIGGER_2 $$
CREATE TRIGGER TRIGGER_2 BEFORE UPDATE
ON reserva_habitac FOR EACH ROW
BEGIN
	DECLARE msg  char(255); 
	DECLARE ERR INT;
	IF NOT EXISTS(SELECT count(*) FROM  reserva_habitac        
       JOIN habitaciones ON reserva_habitac.num = habitaciones.NumHABITACION
       JOIN precio_habitacion ON precio_habitacion.TIPO_HABITACION = habitaciones.TIPO_HABITACION
       JOIN temporada ON precio_habitacion.TEMPORADA = temporada.TEMPORADA  
       WHERE new.idreserva = reserva_habitac.idreserva 
       AND 
       NEW.FechaENTRADA between temporada.FechaINICIO and
        reserva_habitac.FechaFINAL)    
    THEN
		BEGIN  
			SET msg = CONCAT('lA HABITACION NO ESTA DISPONIBLE EN ESTAS FECHAS ',new.FechaENTRADA);
			SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = msg;
			call kk();
            set err = 7/0;-- error
		END ;
	END IF;
    
END $$