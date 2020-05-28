DELIMITER $$
DROP FUNCTION IF EXISTS ejercicio2 $$
CREATE FUNCTION ejercicio2(fecha date, cat int) RETURNS int
BEGIN
DECLARE nhabitacion int;
select h.NumHABITACION into nhabitacion
from habitaciones h
join reserva_habitac r on h.NumHABITACION=r.NumHABITACION
where fecha not between r.FechaENTRADA and r.FechaSALIDA
and h.tipo_habitacion = cat
order by h.NumHABITACION LIMIT 1;

if(NumHABITACION=null)
	then
	return 0;
	else
	RETURN nhabitacion;
end if;
end $$
DELIMITER ;
SELECT ejercicio2('2009-03-15', 1);