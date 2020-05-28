#FUNCION QUE DEVUELVA EL PRIMER NUMERO DE HABITACION QUE ESTA LIBRE PARA UNA DETERMINADA FECHA (SOLO UN DIA)
#Y UNA DETERMINADA CATEOGIRA (O TIPO DE HABITACION). SI NO HAY DEVOLVERA 0.
USE hotel:
DELIMITER $$
DROP FUNCTION IF EXISTS numero_habitacion_libre $$
CREATE FUNCTION numero_habitacion_libre(dia date, TIPO INT) RETURNS INT
BEGIN
DECLARE  numero_habitacion_libre  int;
DECLARE COMPROBAR INT;
	
	SELECT habitaciones.NumHABITACION INTO COMPROBAR
    FROM habitaciones
	join reserva_habitac ON habitaciones.NumHABITACION != reserva_habitac.NumHABITACION
	JOIN precio_habitacion on precio_habitacion.TIPO_HABITACION = habitaciones.TIPO_HABITACION
	join temporada on temporada.TEMPORADA = precio_habitacion.TEMPORADA
	WHERE dia BETWEEN temporada.FechaINICIO AND temporada.FechaFINAL
    AND habitaciones.TIPO_HABITACION = TIPO 
    ORDER BY habitaciones.NumHABITACION DESC LIMIT 1 ;
    
    IF COMPROBAR != NULL THEN
		SET numero_habitacion_libre = COMPROBAR;
	ELSE
		SET numero_habitacion_libre = 0;
	END IF;
RETURN numero_habitacion_libre;
end $$ $$

SELECT numero_habitacion_libre('2009-03-16',2)
