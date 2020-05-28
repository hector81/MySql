USE hotel;
DELIMITER $$
DROP TRIGGER IF EXISTS tr_cliente8 $$
CREATE TRIGGER tr_cliente8 before insert
ON gastos FOR EACH ROW
BEGIN
DECLARE msg  char(255); 

  if  NOT EXISTS(SELECT count(*) FROM  reserva_habitac r
       WHERE new.idreserva=r.idreserva and i.fecha  between r.fechaentrada and
        r.fechasalida) then
     BEGIN  
	SET msg = CONCAT('el gasto no se puede anotar a esa reserva, fuera de fechas ',new.Fecha);
  SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = msg;
  call kk();
 END if; 
	     
END $$

select * from gastos

insert into gastos values
(1, 1,'16-03-2009',1,10)