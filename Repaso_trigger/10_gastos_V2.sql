/*
10  Crear un trigger que aumente un 10 % el gasto introducido si la fecha de la reserva
 es completa en agosto y tiene menos de 7 días de reserva.
 Comprobar también que la fecha es correcta, es decir, situada entre las fechas de la reserva.
*/
USE hotel;
DELIMITER $$
DROP TRIGGER IF EXISTS tr_cliente10 $$
CREATE TRIGGER tr_cliente10 after insert
#Con after si daerror tambien funciona: No inserta
ON gastos FOR EACH ROW
BEGIN
DECLARE msg char(255); 
DECLARE err int; 

DECLARE FECHAGAS DATETIME;
DECLARE FECHAENT DATETIME;
DECLARE FECHASAL DATETIME;
DECLARE DIFDIA INT;
DECLARE PRECIO decimal;

SELECT FechaENTRADA into FECHAENT  FROM reserva_habitac rh
				   where rh.idRESERVA = new.idRESERVA;
SELECT FechaSALIDA into FECHAsal FROM reserva_habitac rh
				   where rh.idRESERVA = new.idRESERVA;
set DIFDIA = (DATEDIFF( FECHAENT, FECHASAL) );

IF (new.FECHA BETWEEN FECHAENT AND FECHASAL) then
	IF (DIFDIA < 7 AND MONTH(FECHAENT) = 8 AND MONTH(FECHASAL) = 8) 
		then
		SET PRECIO=PRECIO*1.10;
	END if;
        
	INSERT INTO gastos (idRESERVA,
							idSERVICIOS,
							Fecha,
							Cantidad,
							Precio)
		SELECT idRESERVA,
			   idSERVICIOS,
			   Fecha,
			   Cantidad,
			   PRECIO
			   FROM inserted;
	ELSE
	SET msg = CONCAT('el gasto no se puede anotar a esa reserva, fuera de fechas ',new.Fecha);
  SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = msg;
  set err=7/0;
END if;

END $$
DELIMITER ;
insert into gastos values
(default,1, 1,'2019-03-15 09:30:00',1,10);
