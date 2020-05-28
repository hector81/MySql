DELIMITER $$
DROP PROCEDURE IF EXISTS ejercicio4 $$
create procedure ejercicio4()
BEGIN
DECLARE todo text;
DECLARE fin BOOLEAN DEFAULT FALSE;
DECLARE servicio, servicio1 CHAR(10);
declare totalfinal, totalservicio, totalaño, preciocursor DECIMAL DEFAULT 0;
declare año, año1 int;
declare fechacursor date;
DECLARE micursor CURSOR FOR
select s.NombreSERVICIO, year(g.fecha), g.fecha, g.precio*g.cantidad
from servicios s join gastos g on g.idServicios = s.idServicios
group by g.fecha
order by g.fecha;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = TRUE;
OPEN micursor;
SET TODO = "Informe gastos por servicio/año:";
set totalfinal = 0;

FETCH micursor INTO servicio, año, fechacursor, preciocursor;

WHILE not fin do
	set servicio1 = servicio;
    set todo = concat(todo,char(13),'Tipo de servicio: ',servicio);
	SET totalservicio = 0;    
	WHILE servicio1 = servicio and not fin do
    set año1 = año;
    set totalaño = 0;
    set todo = concat(todo,char(13),'Año: ',año);
    set todo = concat(todo,char(13),'Fecha',SPACE(14),'Precio');
    
		WHILE año1 = año and servicio1 = servicio and NOT fin DO
		 SET totalaño = totalaño + preciocursor;
		 set todo = concat(todo,char(13),fechacursor,SPACE(14),preciocursor);
		 FETCH micursor INTO servicio, año, fechacursor, preciocursor;
		END WHILE;
        
        set todo = concat(todo,char(13),'Total año ',año,SPACE(1),': ',totalaño,char(13));
       SET totalservicio = totalservicio + totalaño;
        
    END WHILE;
    set totalfinal = totalfinal + totalservicio;
    set todo = concat(todo,char(13),'Total ',servicio,SPACE(2),': ',totalservicio,char(13));
    
END WHILE;

set todo = concat(todo,char(13),'Total final:',SPACE(11),totalfinal);

CLOSE micursor;
select todo;
select TODO into outfile '\\ejercicio4.txt'; # va a c:\
end $$

DELIMITER ;

-- EJECUTANDO LA FUNCION
CALL ejercicio4();