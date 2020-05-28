USE hotel;
DELIMITER $$
DROP TRIGGER IF EXISTS tr_cliente7 $$
CREATE TRIGGER tr_cliente7 AFTER insert
ON reserva_habitac FOR EACH ROW
BEGIN
DECLARE PRECIO  decimal;
	select P.precio into PRECIO
	  from precio_habitacion p,temporada t,habitaciones  h 
	  where h.numhabitacion=new.numhabitacion 
	  and  p.tipo_habitacion=H.tipo_habitacion
	  and p.temporada=t.temporada 
	  AND  new.FechaENTRADA  between t.fechainicio and t.fechafinal;
	INSERT INTO gastos VALUES(DEFAULT,new.idRESERVA,1,new.FechaENTRADA,DATEDIFF(new.FechaSALIDA,new.FechaENTRADA),PRECIO);
  
END $$