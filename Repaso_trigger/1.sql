#Crea una función que devuelva si una habitación está reservada en una fecha que se
#especifique.
DELIMITER $$
DROP FUNCTION IF EXISTS HABITACION_RESERVADA $$
CREATE FUNCTION HABITACION_RESERVADA(NUMERO_HABITACION INT) RETURNS VARCHAR(25)
BEGIN
	DECLARE RESPUESTA VARCHAR(25);
    
	IF EXISTS(SELECT reserva_habitac.idRESERVA  FROM reserva_habitac 
    where reserva_habitac.NumHABITACION = NUMERO_HABITACION) THEN
	SET RESPUESTA = 'HABITACION RESEERVADA'	;
    
    ELSEIF EXISTS(SELECT reserva_habitac.idRESERVA  FROM reserva_habitac 
    where reserva_habitac.NumHABITACION != NUMERO_HABITACION) THEN
	SET RESPUESTA = 'HABITACION NO RESEERVADA'	;
    
    END IF;
	RETURN RESPUESTA;
end $$
DELIMITER ;
SELECT HABITACION_RESERVADA(3);

