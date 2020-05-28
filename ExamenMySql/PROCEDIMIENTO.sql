#MOSTRAR EL NOMBRE DE LAS TRES CATEGORIAS QUE MÁS DIAS HAN RESERVADO EN UN AÑO DETERMINADO
DELIMITER $$
DROP PROCEDURE IF EXISTS categoriamasdias $$
CREATE PROCEDURE categoriamasdias(
IN año int,
out categ1 varchar(20) ,
out categ2 varchar(20),
out categ3 varchar(20))
begin
	SELECT distinct tipo_habitacion.Categoria
    INTO categ1 FROM tipo_habitacion 
	join habitaciones ON habitaciones.TIPO_HABITACION = tipo_habitacion.Categoria
	join reserva_habitac ON reserva_habitac.NumHABITACION = habitaciones.NumHABITACION
	AND year(reserva_habitac.FechaENTRADA) = 2009
    group by tipo_habitacion.Categoria
    order by datediff(reserva_habitac.FechaSALIDA, reserva_habitac.FechaENTRADA) desc limit 1;
	 
	SELECT distinct tipo_habitacion.Categoria
    INTO categ2 FROM tipo_habitacion 
	join habitaciones ON habitaciones.TIPO_HABITACION = tipo_habitacion.Categoria
	join reserva_habitac ON reserva_habitac.NumHABITACION = habitaciones.NumHABITACION
	AND year(reserva_habitac.FechaENTRADA) = 2009
    group by tipo_habitacion.Categoria
    having tipo_habitacion.Categoria<> categ1
    order by datediff(reserva_habitac.FechaSALIDA, reserva_habitac.FechaENTRADA) desc limit 1;
    
    SELECT distinct tipo_habitacion.Categoria
    INTO categ3 FROM tipo_habitacion 
	join habitaciones ON habitaciones.TIPO_HABITACION = tipo_habitacion.Categoria
	join reserva_habitac ON reserva_habitac.NumHABITACION = habitaciones.NumHABITACION
	AND year(reserva_habitac.FechaENTRADA) = 2009
    group by tipo_habitacion.Categoria
    having tipo_habitacion.Categoria<> categ1 and tipo_habitacion.Categoria<> categ2
    order by datediff(reserva_habitac.FechaSALIDA, reserva_habitac.FechaENTRADA) desc limit 1;
    
    
END $$
DELIMITER ; 
CALL categoriamasdias(2009, @categ1, @categ2,@categ3);
select @categ1,@categ2,@categ3;