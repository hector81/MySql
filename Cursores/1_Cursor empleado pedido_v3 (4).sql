USE neGOcios2011;
DELIMITER $$
DROP PROCEDURE IF EXISTS EMPLE_PED $$
create procedure EMPLE_PED()
begin
DECLARE todo Blob;
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
SET TODO = concat(TODO,"Informe");
FETCH MI_CURSOR INTO E, PEDIDO, MONTO;
WHILE not fin do
set TODO = concat(TODO,"Informe");
  SET E1 = E;
  SET TOTAL_empleado = 0;
  WHILE E = E1 and not fin do
  	SET TOTAL_empleado =TOTAL_empleado+ MONTO;
	FETCH MI_CURSOR INTO E, PEDIDO, MONTO;
  END while ;
  set TOTAL_empleado = concat(TOTAL_empleado,"Informe");
END while ;
CLOSE MI_CURSOR;
select TODO as log into outfile 'result.txt';
end $$
DELIMITER ;
-- EJECUTANDO LA FUNCION



