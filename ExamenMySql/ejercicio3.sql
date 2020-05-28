DELIMITER $$
DROP PROCEDURE IF EXISTS ejercicio3 $$
CREATE PROCEDURE ejercicio3 (IN ANIO INT)

BEGIN
SELECT sum(datediff(fechasalida, fechaentrada)) as Dias_Reservados, h.tipo_habitacion
FROM habitaciones as h JOIN reserva_habitac as rh ON h.NumHABITACION=rh.NumHABITACION
WHERE year(rh.FechaENTRADA) = ANIO
group by 2
order by 1 desc limit 3;
END $$
DELIMITER ;
CALL ejercicio3(2009);