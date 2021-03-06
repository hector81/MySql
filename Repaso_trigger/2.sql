#Crea una función que devuelva el gasto realizado por una reserva (aplicar el iva).
DELIMITER $$
DROP FUNCTION IF EXISTS GASTO_RESERVADA $$
CREATE FUNCTION GASTO_RESERVADA(ID_1RESERVA INT) RETURNS DECIMAL
BEGIN
	DECLARE RESPUESTA DECIMAL;

    SELECT GASTOS.Precio + GASTOS.Precio/100*reserva_habitac.IVA INTO  RESPUESTA 
    FROM GASTOS 
    JOIN reserva_habitac on GASTOS.idRESERVA = reserva_habitac.idRESERVA
    WHERE GASTOS.idRESERVA = ID_1RESERVA;
    
	RETURN RESPUESTA;
end $$
DELIMITER ;
SELECT GASTO_RESERVADA(1);