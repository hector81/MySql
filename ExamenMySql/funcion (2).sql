DELIMITER $$
DROP FUNCTION IF EXISTS funcion $$
CREATE FUNCTION funcion(fecha date, cat int) RETURNS int
BEGIN
	declare hab int;
	select numhabitacion into hab
    from habitaciones
	where tipo_habitacion = cat and not exists (
		select r.numhabitacion
		from reserva_habitac as r join habitaciones as h on r.numhabitacion=h.numhabitacion join tipo_habitacion as t on h.tipo_habitacion=t.categoria
		where fecha between r.FechaENTRADA and r.FechaSALIDA and h.tipo_habitacion = cat)
    order by 1 asc limit 1;
    if(hab is null) then
		set hab = 0;
	end if;
RETURN hab;
END $$
DELIMITER ;
select funcion('2009-3-15', 1);