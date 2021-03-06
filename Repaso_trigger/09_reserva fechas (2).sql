USE hotel;
DELIMITER $$
DROP TRIGGER IF EXISTS tr_cliente9 $$
CREATE TRIGGER tr_cliente9 after insert
#Con after si daerror tambien funciona: No inserta
ON reserva_habitac FOR EACH ROW
BEGIN
DECLARE msg char(255); 
DECLARE err int; 
IF (exists
(select * from reserva_habitac  B
where b.numhabitacion=new.numhabitacion and
      new.idreserva<>b.idreserva and
      ((new.fechaentrada >= b.fechaentrada
	  and new.fechaentrada < b.fechasalida ) 
      # si ponemos between no permitiríamos ocupar el día de salida de otra habitación
      or 
       (new.fechasalida >= b.fechaentrada 
	   and new.fechasalida < b.fechasalida )
      or 
       ( new.fechasalida >= b.fechaentrada 
	   and new.fechasalida < b.fechasalida ))
     )
   ) then
  SET msg = CONCAT('Habitación no disponible en esa fecha: ',new.fechaentrada);
  SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = msg;
  set err=7/0;
 END if; 

END $$
DELIMITER ;
-- pruebas
insert into reserva_habitac values
(default,'2019-03-15 09:30:00',	'2019-03-16 09:30:00',	0.07,	107,	'12345');
 # -- ocupada hasta el dia 24




