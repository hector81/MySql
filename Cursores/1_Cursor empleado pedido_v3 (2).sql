USE neGOcios2011;
DELIMITER $$
DROP PROCEDURE IF EXISTS EMPLE_PED $$
create procedure EMPLE_PED()
begin
DECLARE todo text;
DECLARE fin BOOLEAN DEFAULT FALSE;
DECLARE E,E1 VARCHAR(5);
DECLARE PEDIDO INT;
DECLARE MONTO DECIMAL;
DECLARE TOTAL_empleado DECIMAL;
DECLARE MI_CURSOR CURSOR FOR
SELECT e.nomempleado, pc.idpedido, SUM(pd.preciounidad * pd.cantidad)
FROM empleados e, pedidoscabe pc, pedidosdeta pd
WHERE e.idempleado = pc.idempleado AND pc.idpedido = pd.idpedido
GROUP BY e.nomempleado, pc.idpedido
ORDER BY e.nomempleado;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = TRUE;
OPEN MI_CURSOR;
SET TODO = "Informe";
set todo = concat(todo,char(13),'Pedido             Importe');
FETCH MI_CURSOR INTO E, PEDIDO, MONTO;
WHILE not fin do
  SET E1 = E;
  SET TOTAL_empleado = 0;
  set todo = concat(todo,char(13),'Empleado: ' ,E1);
  WHILE E = E1 and not fin do
  	SET TOTAL_empleado =TOTAL_empleado+ MONTO;
    set todo = concat(todo,char(13),PEDIDO,'         ' ,FORMAT(MONTO,2));
    FETCH MI_CURSOR INTO E, PEDIDO, MONTO;
  END while ;
  set todo = concat(todo,char(13),'TOTAL EMPLEADO :   ',FORMAT(TOTAL_empleado,2));
    
END while ;
CLOSE MI_CURSOR;
 
select todo;
select TODO into outfile '\\result4.txt'; # va a c:\
end $$
DELIMITER ;
-- EJECUTANDO LA FUNCION
CALL EMPLE_PED();


